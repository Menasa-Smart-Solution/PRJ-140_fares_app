import 'package:fares/core/helpers/extensions.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.backgroundColor,
    this.textStyle,
    this.padding,
    this.radius,
    this.width,
    this.isLoading = false,
    this.height,
    this.isGradient = false,
    this.borderColor,
    this.textColor,
  });
  final VoidCallback onPressed;
  final String text;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  final double? width;
  final double? height;
  final bool isGradient;
  final Color? borderColor;
  final bool isLoading;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: SizedBox(
        width: width ?? context.width,
        height: height ?? 65,
        child: TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(
            minimumSize: Size(width ?? context.width, height ?? 65),
            backgroundColor: backgroundColor ?? AppColors.primaryColor,
            padding: padding ?? EdgeInsets.symmetric(horizontal: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius ?? 100),
              side: borderColor != null
                  ? BorderSide(
                      color: borderColor ?? Colors.transparent,
                      width: 1,
                    )
                  : BorderSide.none,
            ),
          ),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              text,
              style:
                  textStyle ??
                  AppTextStyles.bold16.copyWith(
                    color: textColor ?? AppColors.white,
                  ),
            ),
          ),
        ),
      ),
    );

    // Skeleton.leaf(
    //     child: InkWell(
    //       onTap: onPressed,
    //       borderRadius: BorderRadius.circular(radius ?? 12),
    //       child: Container(
    //         width: width ?? 1.sw,
    //         height: height ?? 50.h,

    //         padding: padding ?? EdgeInsets.symmetric(horizontal: 12.h),
    //         decoration: BoxDecoration(
    //           color: backgroundColor ?? AppColors.primaryDark,
    //           gradient: gradientColors == null
    //               ? null
    //               : LinearGradient(
    //                   colors: gradientColors!,
    //                   begin: Alignment.topLeft,
    //                   end: Alignment.bottomRight,
    //                 ),
    //           borderRadius: BorderRadius.circular(radius ?? 12),
    //           border: borderColor != null
    //               ? Border.all(color: borderColor!, width: 1)
    //               : null,
    //         ),
    //         child: Center(
    //           child: FittedBox(
    //             fit: BoxFit.cover,
    //             child: Text(
    //               text,
    //               style: textStyle ?? AppTextStyles.bigTitleSemibold,
    //             ),
    //           ),
    //         ),
    //       ),
    //     ),
    //   );
  }
}
