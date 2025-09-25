import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    required this.onTap,
    required this.icon,
    this.size,
    this.color,
    this.radius,
  });
  final VoidCallback onTap;
  final IconData icon;
  final double? size;
  final Color? color;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(radius ?? 30),
      child: InkWell(
        borderRadius: BorderRadius.circular(radius ?? 30),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(icon, color: color, size: size),
        ),
      ),
    );
  }
}
