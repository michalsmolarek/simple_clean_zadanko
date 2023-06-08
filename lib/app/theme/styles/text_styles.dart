part of 'styles.dart';

@injectable
class TextStyles {
  TextStyle get headline1 => const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      );

  TextStyle get headline2 => const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      );

  TextStyle get bodyText1 => const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w700,
        color: AppColors.black,
      );
  TextStyle get bodyText2 => const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      );
  TextStyle get bodyText3 => const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.black,
      );
}
