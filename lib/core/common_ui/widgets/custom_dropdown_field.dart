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
    this.hintColor,
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
