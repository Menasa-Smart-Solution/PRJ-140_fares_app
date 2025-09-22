import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static const String fontFamily = 'LamaSans';

  // Base text style with common properties
  static TextStyle _baseTextStyle({
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  // Predefined text styles using static getters
  static TextStyle get reg14 => _regular(fontSize: 14);
  static TextStyle get reg16 => _regular(fontSize: 16);
  static TextStyle get med12 => _medium(fontSize: 12);
  static TextStyle get med14 => _medium(fontSize: 14);
  static TextStyle get med18 => _medium(fontSize: 18);
  static TextStyle get bold16 => _bold(fontSize: 16);
  static TextStyle get bold24 => _bold(fontSize: 24);
  static TextStyle get font50W700 => _bold(fontSize: 50);

  static TextStyle _regular({
    required double fontSize,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w400,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle _medium({
    required double fontSize,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w500,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle _semiBold({
    required double fontSize,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }

  static TextStyle _bold({
    required double fontSize,
    Color? color,
    double? height,
    double? letterSpacing,
  }) {
    return _baseTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeight.w700,
      color: color,
      height: height,
      letterSpacing: letterSpacing,
    );
  }
}
