part of '../../../feature_imports.dart';

class BottomSheetActions extends StatelessWidget {
  const BottomSheetActions({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextButton(
            onPressed: () {
              // Handle confirm button press
            },
            text: title,
          ),
        ),
        horizontalSpace(8),
        Expanded(
          child: AppTextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            text: LocaleKeys.cancel.tr(),
            backgroundColor: Colors.transparent,
            textColor: AppColors.red,
            hoverColor: AppColors.red.withAlpha(20),
          ),
        ),
      ],
    );
  }
}
