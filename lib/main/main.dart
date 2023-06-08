import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:zadanko/app/theme/theme_manager.dart';

import '../app/utils/consts.dart';
import '../app/utils/router.gr.dart';
import '../app/utils/translations/generated/l10n.dart';
import '../injectable/injectable.dart';

Future mainCommon() async {
  WidgetsFlutterBinding.ensureInitialized();
  injectDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: getIt<ThemeManager>().lightTheme,
      builder: (context, child) => child!,
      routeInformationParser: getIt<AppRouter>().defaultRouteParser(),
      routerDelegate: getIt<AppRouter>().delegate(),
      localizationsDelegates: const [
        Translation.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: Translation.delegate.supportedLocales,
      locale: const Locale('en'),
      title: appName,
    );
  }
}
