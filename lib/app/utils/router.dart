import 'package:auto_route/auto_route.dart';
import 'package:zadanko/app/pages/home/home_page.dart';
import 'package:zadanko/app/pages/item/item_page.dart';

export '../utils/router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(page: HomePage, initial: true),
    AutoRoute(page: ItemPage),
  ],
)
class $AppRouter {}
