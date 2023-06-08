import 'package:injectable/injectable.dart';
import 'package:zadanko/app/utils/router.gr.dart';

@module
abstract class AppRouterModule {
  @singleton
  AppRouter get instance => AppRouter();
}
