import 'package:flutter/material.dart';
import 'package:zadanko/app/theme/app_colors.dart';

class AppLoadingIndicator extends StatelessWidget {
  const AppLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColors.bitterSweet,
    );
  }
}
