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
    this.hoverColor,
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
  final Color? hoverColor;

  @override
  Widget build(BuildContext context) {
    return Skeleton.leaf(
      child: SizedBox(
        width: width ?? context.width,
        height: height ?? 55,
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all(
              Size(width ?? context.width, height ?? 55),
            ),
            backgroundColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.disabled)) {
                return (backgroundColor ?? AppColors.primaryColor).withOpacity(
                  0.6,
                );
              }
              return backgroundColor ?? AppColors.primaryColor;
            }),
            overlayColor: WidgetStateProperty.resolveWith<Color>((
              Set<WidgetState> states,
            ) {
              if (states.contains(WidgetState.hovered)) {
                return hoverColor ?? AppColors.lightPrimaryColor;
              }
              if (states.contains(WidgetState.pressed)) {
                return hoverColor ?? AppColors.lightPrimaryColor;
              }
              return Colors.transparent;
            }),
            padding: WidgetStateProperty.all(
              padding ?? EdgeInsets.symmetric(horizontal: 12),
            ),
            shape: WidgetStateProperty.all(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius ?? 100),
                side: borderColor != null
                    ? BorderSide(
                        color: borderColor ?? Colors.transparent,
                        width: 1,
                      )
                    : BorderSide.none,
              ),
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
  }
}
