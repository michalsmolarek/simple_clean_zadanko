import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:zadanko/app/pages/error/error_page.dart';
import 'package:zadanko/app/pages/home/cubit/home_cubit.dart';
import 'package:zadanko/app/theme/app_colors.dart';
import 'package:zadanko/app/theme/theme_manager.dart';
import 'package:zadanko/app/utils/consts.dart';
import 'package:zadanko/app/utils/router.gr.dart';
import 'package:zadanko/app/utils/translations/generated/l10n.dart';
import 'package:zadanko/app/widgets/app_loading_indicator.dart';
import 'package:zadanko/domain/entities/item.dart';
import 'package:zadanko/injectable/injectable.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeCubit>(),
      child: Scaffold(
        body: SafeArea(
          child: BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) => state.maybeWhen(
              loading: () => const AppLoadingWidget(),
              loaded: (items) => RefreshIndicator(
                color: AppColors.bitterSweet,
                onRefresh: () => context.read<HomeCubit>().getItems(),
                child: ListView.builder(
                  itemCount: items!.length,
                  itemBuilder: (context, index) => ItemTile(item: items[index]),
                ),
              ),
              fail: () => const ErrorPage(),
              orElse: () => const SizedBox.shrink(),
            ),
          ),
        ),
      ),
    );
  }
}

class AppLoadingWidget extends StatelessWidget {
  const AppLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const AppLoadingIndicator(),
        const Gap(32),
        Text(Translation.of(context).tip),
      ],
    ));
  }
}

class ItemTile extends StatelessWidget {
  const ItemTile({
    super.key,
    required this.item,
  });

  final Item item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => context.pushRoute(
        ItemRoute(item: item, url: item.url!),
      ),
      leading: CachedNetworkImage(
        imageUrl: item.imageUrl!,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${item.orderId! + 1}. ${item.title!}",
            style: getIt<ThemeManager>().textStyles.bodyText1,
          ),
          const Gap(4),
          Text(
            DateFormat(defaultDateFormat).format(item.modificationDate!),
            style: getIt<ThemeManager>().textStyles.bodyText2,
          ),
          const Gap(4),
        ],
      ),
      subtitle: Text(
        item.description!,
        style: getIt<ThemeManager>().textStyles.bodyText3,
      ),
    );
  }
}
