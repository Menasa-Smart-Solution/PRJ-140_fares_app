part of '../../../feature_imports.dart';

class DeleteParcelAlertDialog extends StatelessWidget {
  const DeleteParcelAlertDialog({super.key, required this.onTap});
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("حذف الشحنة", style: AppTextStyles.bold16),
          verticalSpace(8),
          Text(
            "هل أنت متأكد أنك تريد حذف هذه الشحنة؟ لا يمكن التراجع عن هذا الإجراء.",
            style: AppTextStyles.reg12.copyWith(color: AppColors.grey),
          ),
          verticalSpace(20),
          Row(
            children: [
              Expanded(
                child: AppTextButton(
                  onPressed: () {
                    context.pop();
                    onTap();
                  },
                  text: "حذف الشحنة",
                  backgroundColor: Colors.transparent,
                  textColor: AppColors.red,
                  hoverColor: AppColors.lightRed,
                ),
              ),
              horizontalSpace(10),
              Expanded(
                child: AppTextButton(
                  onPressed: () {
                    context.pop();
                  },
                  text: LocaleKeys.cancel.tr(),
                  backgroundColor: Colors.transparent,
                  textColor: Colors.blue,
                  hoverColor: Colors.blue.withAlpha(50),
                ),
              ),
            ],
          ),
        ],
      ).withPadding(vertical: 20, horizontal: 16),
    );
  }
}
