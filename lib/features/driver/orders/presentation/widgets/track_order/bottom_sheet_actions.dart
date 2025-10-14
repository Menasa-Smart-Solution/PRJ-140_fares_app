part of '../../../feature_imports.dart';

class BottomSheetActions extends StatelessWidget {
  const BottomSheetActions({super.key, required this.title, this.onPressed});
  final String title;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppTextButton(onPressed: onPressed ?? () {}, text: title),
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
