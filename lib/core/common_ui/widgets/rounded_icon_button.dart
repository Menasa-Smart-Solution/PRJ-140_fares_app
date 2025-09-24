import 'package:fares/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  const RoundedIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconColor,
    this.backgroundColor,
    this.width,
    this.height,
    this.size,
  });
  final IconData icon;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(25),
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(1),
          width: width ?? 40,
          height: height ?? 40,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: backgroundColor ?? AppColors.primaryColor.withAlpha(15),
          ),
          child: Center(
            child: Icon(
              icon,
              size: size ?? 18,
              color: iconColor ?? AppColors.primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
