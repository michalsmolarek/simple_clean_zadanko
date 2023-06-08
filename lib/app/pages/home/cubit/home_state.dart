part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.loading() = _Loading;
  const factory HomeState.loaded({List<Item>? items}) = _Loaded;
  const factory HomeState.fail() = _Fail;
}
