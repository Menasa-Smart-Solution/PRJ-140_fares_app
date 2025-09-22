import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension ContextExtension on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  Future<dynamic> pushNamedAndRemoveUntil(
    String routeName, {
    Object? arguments,
    required RoutePredicate predicate,
  }) {
    return Navigator.of(
      this,
    ).pushNamedAndRemoveUntil(routeName, predicate, arguments: arguments);
  }

  void pop() => Navigator.of(this).pop();

  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
}

extension StringExtension on String? {
  bool isNullOrEmpty() => this == null || this == "";
}

extension ListExtension<T> on List<T>? {
  bool isNullOrEmpty() => this == null || this!.isEmpty;
}

extension ExtensionWidget on Widget {
  Widget get center => Align(alignment: Alignment.center, child: this);

  Widget withPadding({
    double all = 0.0,
    double vertical = 0.0,
    double horizontal = 0.0,
    double top = 0.0,
    double bottom = 0.0,
    double start = 0.0,
    double end = 0.0,
  }) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        top: (all + vertical + top),
        bottom: (all + vertical + bottom),
        start: (all + horizontal + start),
        end: (all + horizontal + start),
      ),
      child: this,
    );
  }

  Widget get toEnd =>
      Align(alignment: AlignmentDirectional.centerEnd, child: this);
  Widget get toStart =>
      Align(alignment: AlignmentDirectional.centerStart, child: this);
  Widget get toBottom => Align(alignment: Alignment.bottomCenter, child: this);
  Widget get toBottomEnd =>
      Align(alignment: AlignmentDirectional.bottomEnd, child: this);
  Widget get toBottomStart =>
      Align(alignment: AlignmentDirectional.bottomStart, child: this);
  Widget get toTopEnd =>
      Align(alignment: AlignmentDirectional.topEnd, child: this);
  Widget get toTopStart =>
      Align(alignment: AlignmentDirectional.topStart, child: this);
  Widget get toTop => Align(alignment: Alignment.topCenter, child: this);
}

extension WidgetExtension on Widget {
  Widget onTap({required void Function() function}) {
    return GestureDetector(onTap: function, child: this);
  }

  Widget onTapShadow({
    required BorderRadius borderRadius,
    required void Function() function,
  }) {
    return InkWell(
      onTap: function,
      borderRadius: borderRadius,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: this,
    );
  }
}
