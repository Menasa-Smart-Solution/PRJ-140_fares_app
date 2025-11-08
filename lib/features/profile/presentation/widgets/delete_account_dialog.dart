part of '../../feature_imports.dart';

class DeleteAccountDialog extends StatelessWidget {
  const DeleteAccountDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("تأكيد حذف الحساب", style: AppTextStyles.bold16),
          verticalSpace(8),
          Text(
            "هل أنت متأكد من رغبتك في حذف حسابك؟ لن تتمكن من استعادة البيانات بعد الحذف.",
            style: AppTextStyles.reg12.copyWith(color: AppColors.grey),
          ),
          verticalSpace(20),
          Row(
            children: [
              Expanded(
                child: AppTextButton(
                  onPressed: () {
                    context.pop();
                    context.read<ProfileCubit>().userLogout();
                  },
                  text: "حذف الحساب",
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
