import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zadanko/app/pages/home/cubit/home_cubit.dart';
import 'package:zadanko/app/theme/app_colors.dart';
import 'package:zadanko/app/theme/theme_manager.dart';
import 'package:zadanko/app/utils/translations/generated/l10n.dart';
import 'package:zadanko/injectable/injectable.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Translation.of(context).unexpectedError,
            ),
            TextButton(
              onPressed: () {
                context.read<HomeCubit>().getItems();
              },
              child: Text(
                Translation.of(context).refresh,
                style: getIt<ThemeManager>().textStyles.bodyText3.copyWith(color: AppColors.bitterSweet),
              ),
            )
          ],
        ),
      ),
    );
  }
}
