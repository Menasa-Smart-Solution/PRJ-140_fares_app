import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/common_ui/widgets/app_text_button.dart';
import 'package:fares/core/common_ui/widgets/custom_app_bar.dart';
import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:fares/core/utils/app_images.dart';
import 'package:fares/generated/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InternetConnectionWidget extends StatelessWidget {
  const InternetConnectionWidget({
    super.key,
    this.isScaffold = false,
    this.appBar,
    this.onPressed,
  });
  final bool isScaffold;
  final CustomAppBar? appBar;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return isScaffold
        ? Scaffold(appBar: appBar, body: _buildWidget())
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Align(
      alignment: Alignment.center,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImages.imagesNoInternet, height: 0.35.sh),
            verticalSpace(20),
            Text(
              LocaleKeys.noNetworkConnection.tr(),
              style: AppTextStyles.bold24,
            ),
            verticalSpace(10),
            Text(
              LocaleKeys.checkYourInternet.tr(),
              textAlign: TextAlign.center,
              style: AppTextStyles.med16.copyWith(
                color: AppColors.black500, // Grey color
              ),
            ),
            if (onPressed != null) ...[
              verticalSpace(20),
              AppTextButton(
                width: 0.8.sw,
                radius: 20,
                text: LocaleKeys.retry.tr(),
                onPressed: onPressed ?? () {},
                backgroundColor: AppColors.primaryColor,
                textStyle: AppTextStyles.med16.copyWith(color: AppColors.white),
              ),
            ],
          ],
        ).withPadding(horizontal: 16, vertical: 24),
      ),
    );
  }
}
