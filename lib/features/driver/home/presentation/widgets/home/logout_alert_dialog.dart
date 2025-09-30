part of '../widgets.dart';

class LogoutAlertDialog extends StatelessWidget {
  const LogoutAlertDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("تسجيل الخروج", style: AppTextStyles.bold16),
          verticalSpace(8),
          Text(
            "سوف تحتاج إلى إدخال اسم المستخدم وكلمة المرور في المرة القادمة التي تريد فيها تسجيل الدخول",
            style: AppTextStyles.reg12.copyWith(color: AppColors.grey),
          ),
          verticalSpace(20),
          Row(
            children: [
              Expanded(
                child: AppTextButton(
                  onPressed: () {},
                  text: "تسجيل الخروج",
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
