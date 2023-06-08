import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:zadanko/domain/entities/item.dart';
import 'package:zadanko/domain/use_case/get_items_use_case.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@injectable
class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._getItemsUseCase) : super(const HomeState.loading()) {
    getItems();
  }

  final GetItemsUseCase _getItemsUseCase;

  getItems() async {
    emit(const HomeState.loading());
    final result = await _getItemsUseCase.call();
    result.fold(
      // ! I haven't noticed any error response so it is mocked in use case: 50% chance for an error
      (fail) => emit(const HomeState.fail()),
      (items) {
        items.sort((a, b) => a.orderId! > b.orderId! ? 1 : -1);
        emit(
          HomeState.loaded(items: items),
        );
      },
    );
  }
}
