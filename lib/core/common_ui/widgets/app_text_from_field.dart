import 'package:fares/core/helpers/spacing.dart';
import 'package:fares/core/theme/app_colors.dart';
import 'package:fares/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.onChanged,
    this.inputTextStyle,
    this.prefixIcon,
    required this.hintText,
    this.hintStyle,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.keyboardType,
    this.onSaved,
    this.readOnly = false,
    this.maxLines = 1,
    this.title,
    this.error,
    this.borderColor,
    this.radius,
    this.onFieldSubmitted,
    this.textInputAction,
    this.showFocusedBorder = true,
  });
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final String hintText;
  final TextStyle? hintStyle;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final TextInputType? keyboardType;
  final void Function(String?)? onSaved;
  final String? title;
  final String? error;
  final Color? borderColor;
  final double? radius;
  final int maxLines;
  final bool readOnly;
  final void Function(String)? onChanged;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final bool showFocusedBorder;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[
          Text(
            title ?? "",
            style: AppTextStyles.med14.copyWith(color: AppColors.black500),
          ),
          verticalSpace(8),
        ],
        TextFormField(
          readOnly: readOnly,
          onSaved: onSaved,
          textInputAction: textInputAction,
          onChanged: onChanged,
          onFieldSubmitted: onFieldSubmitted,
          onTapOutside: (event) {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          controller: controller,
          validator: (value) => validator(value),
          keyboardType: keyboardType ?? TextInputType.text,
          obscureText: isObscureText ?? false,
          maxLines: maxLines,

          style:
              inputTextStyle ??
              const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          decoration: InputDecoration(
            hintText: hintText,
            suffixIcon: suffixIcon,

            prefixIcon: prefixIcon,
            fillColor: backgroundColor ?? AppColors.textFormFieldBg,
            filled: true,
            hintStyle:
                hintStyle ??
                AppTextStyles.reg14.copyWith(color: AppColors.grey500),
            contentPadding:
                contentPadding ??
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            border: _buildBorder(),
            enabledBorder: enabledBorder ?? _buildBorder(),
            focusedBorder:
                focusedBorder ??
                _buildBorder(
                  color: showFocusedBorder ? AppColors.primaryColor : null,
                ),
            errorStyle: const TextStyle(
              height: 0,
              color: Colors.red,
              fontSize: 0,
            ),

            errorBorder: _buildErrorBorder(),
            focusedErrorBorder: _buildErrorBorder(),
          ),
        ),
      ],
    );
  }

  OutlineInputBorder _buildErrorBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 50),
      borderSide: const BorderSide(color: Colors.red, width: 1.5),
    );
  }

  OutlineInputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 50),
      borderSide: BorderSide(
        color: color ?? borderColor ?? AppColors.textFormBorderColor,
        width: 1.5,
      ),
    );
  }
}
