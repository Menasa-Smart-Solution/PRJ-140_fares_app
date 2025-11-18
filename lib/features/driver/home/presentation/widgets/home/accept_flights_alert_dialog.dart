part of '../widgets.dart';

class AcceptFlightsAlertDialog extends StatelessWidget {
  const AcceptFlightsAlertDialog({
    super.key,
    required this.onTap,
    required this.flight,
  });
  final VoidCallback onTap;
  final int flight;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("تأكيد استلام الرحلة", style: AppTextStyles.bold16),
          verticalSpace(8),
          Text(
            "هل انت متأكد من استلام رحلة رقم #$flight",
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
                  text: "نعم",
                  backgroundColor: Colors.transparent,
                  textColor: AppColors.primaryColor,
                  hoverColor: AppColors.pastelGreen,
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
                  textColor: AppColors.red,
                  hoverColor: AppColors.red.withAlpha(50),
                ),
              ),
            ],
          ),
        ],
      ).withPadding(vertical: 20, horizontal: 16),
    );
  }
}
