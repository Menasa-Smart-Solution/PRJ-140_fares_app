// import 'package:arafat/core/helpers/spacing.dart';
// import 'package:arafat/core/theme/app_colors.dart';
// import 'package:arafat/core/theme/app_text_styles.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class AppTextFormField extends StatelessWidget {
//   const AppTextFormField({
//     super.key,
//     this.contentPadding,
//     this.focusedBorder,
//     this.enabledBorder,
//     this.onChanged,
//     this.inputTextStyle,
//     this.prefixIcon,
//     required this.hintText,
//     this.hintStyle,
//     this.isObscureText,
//     this.suffixIcon,
//     this.backgroundColor,
//     this.controller,
//     required this.validator,
//     this.keyboardType,
//     this.onSaved,
//     this.readOnly = false,
//     this.maxLines = 1,
//     this.title,
//     this.error,
//     this.showError = true,
//     this.borderColor,
//     this.radius,
//     this.onFieldSubmitted,
//     this.textInputAction,
//   });
//   final EdgeInsetsGeometry? contentPadding;
//   final InputBorder? focusedBorder;
//   final InputBorder? enabledBorder;
//   final TextStyle? inputTextStyle;
//   final String hintText;
//   final TextStyle? hintStyle;
//   final bool? isObscureText;
//   final Widget? suffixIcon;
//   final Widget? prefixIcon;
//   final Color? backgroundColor;
//   final TextEditingController? controller;
//   final Function(String?) validator;
//   final TextInputType? keyboardType;
//   final void Function(String?)? onSaved;
//   final String? title;
//   final String? error;
//   final bool showError;
//   final Color? borderColor;
//   final double? radius;
//   final int maxLines;
//   final bool readOnly;
//   final void Function(String)? onChanged;
//   final void Function(String)? onFieldSubmitted;
//   final TextInputAction? textInputAction;
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         if (title != null) ...[
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 title ?? "",
//                 style: AppTextStyles.font17W500.copyWith(
//                   color: AppColors.titleColor,
//                 ),
//               ),
//               Text(
//                 error ?? "",
//                 style: AppTextStyles.font16W400.copyWith(color: AppColors.red),
//               ),
//             ],
//           ),
//           verticalSpacing(8),
//         ],
//         TextFormField(
//           readOnly: readOnly,
//           onSaved: onSaved,
//           textInputAction: textInputAction,
//           onChanged: onChanged,
//           onFieldSubmitted: onFieldSubmitted,
//           onTapOutside: (event) {
//             FocusManager.instance.primaryFocus?.unfocus();
//           },
//           controller: controller,
//           validator: (value) => validator(value),
//           keyboardType: keyboardType ?? TextInputType.text,
//           obscureText: isObscureText ?? false,
//           maxLines: maxLines,

//           style:
//               inputTextStyle ??
//               TextStyle(fontSize: 16.sp, fontWeight: FontWeight.w600),
//           decoration: InputDecoration(
//             hintText: hintText,
//             suffixIcon: suffixIcon,

//             prefixIcon: prefixIcon,
//             fillColor: backgroundColor ?? AppColors.textFormFieldBg,
//             filled: true,
//             hintStyle:
//                 hintStyle ??
//                 AppTextStyles.font16W400.copyWith(color: AppColors.textGrey),
//             contentPadding:
//                 contentPadding ??
//                 EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
//             border: _buildBorder(),
//             enabledBorder: enabledBorder ?? _buildBorder(),
//             focusedBorder: focusedBorder ?? _buildBorder(),
//             errorStyle: showError == false
//                 ? const TextStyle(height: 0, color: Colors.red, fontSize: 0)
//                 : null,
//             errorBorder: _buildErrorBorder(),
//             focusedErrorBorder: _buildErrorBorder(),
//           ),
//         ),
//       ],
//     );
//   }

//   OutlineInputBorder _buildErrorBorder() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(12),
//       borderSide: BorderSide(
//         color: showError ? Colors.red : Colors.transparent,
//         width: 1.5.w,
//       ),
//     );
//   }

//   OutlineInputBorder _buildBorder() {
//     return OutlineInputBorder(
//       borderRadius: BorderRadius.circular(radius ?? 10),
//       borderSide: BorderSide(
//         color: borderColor ?? AppColors.textFormFieldBg,
//         width: 1.5.w,
//       ),
//     );
//   }
// }
