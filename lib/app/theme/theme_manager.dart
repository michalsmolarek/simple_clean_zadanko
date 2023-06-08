import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:zadanko/app/theme/styles/styles.dart';

import 'app_colors.dart';

@injectable
class ThemeManager {
  const ThemeManager(this.textStyles);

  final TextStyles textStyles;

  ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: AppColors.defaultBackground,
        primaryColor: AppColors.white,
        colorScheme: ColorScheme.light(secondary: AppColors.defaultActiveColor),
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.transparent,
          titleTextStyle: textStyles.bodyText1.copyWith(color: AppColors.black),
          elevation: 0,
          iconTheme: const IconThemeData(
            color: AppColors.bitterSweet,
          ),
        ),
        primaryTextTheme: TextTheme(
          labelLarge: const TextStyle(
            color: AppColors.black,
          ),
          bodyLarge: textStyles.bodyText1,
          bodyMedium: textStyles.bodyText2,
          displayLarge: textStyles.headline1,
          displayMedium: textStyles.headline2,
          displaySmall: textStyles.bodyText3,
        ),
      );
}
