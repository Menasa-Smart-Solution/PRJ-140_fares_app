import '../../utils/exports.dart';

class CustomDropdownField<T> extends StatelessWidget {
  const CustomDropdownField({
    super.key,
    required this.items,
    required this.onChanged,
    this.backgroundColor,
    this.borderColor,
    this.initialValue,
    this.radius,
    this.titleColor,
    this.hintColor,
    this.label,
    required this.itemAsString,
    required this.hint,
  });
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final Color? backgroundColor;
  final Color? borderColor;
  final T? initialValue;
  final double? radius;
  final Color? hintColor;
  final String Function(T item) itemAsString;
  final String hint;
  final String? label;
  final Color? titleColor;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      hint: Text(hint),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      initialValue: initialValue,
      items: items
          .map(
            (status) => DropdownMenuItem(
              value: status,
              child: Text(itemAsString(status)),
            ),
          )
          .toList(),
      decoration: InputDecoration(
        filled: true,
        fillColor: backgroundColor ?? AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        labelText: label,
        labelStyle: AppTextStyles.reg14.copyWith(
          color: titleColor ?? AppColors.black500,
        ),
        border: _buildBorder(),
        enabledBorder: _buildBorder(),
        focusedBorder: _buildBorder(color: AppColors.primaryColor),
      ),

      validator: (value) {
        if (value == null) {
          return LocaleKeys.fieldRequired.tr();
        }
        return null;
      },
      onChanged: onChanged,
    );
  }

  OutlineInputBorder _buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 12),
      borderSide: const BorderSide(
        color: AppColors.textFormBorderColor,
        width: 1.5,
      ),
    );
  }
}
