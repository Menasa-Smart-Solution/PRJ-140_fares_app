import 'package:dropdown_search/dropdown_search.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../generated/locale_keys.g.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class CustomDropdownSearchList<T> extends StatelessWidget {
  const CustomDropdownSearchList({
    super.key,
    required this.items,
    required this.onChanged,
    this.backgroundColor,
    this.showRemove = false,
    this.borderColor,
    this.initialValue,
    this.radius,
    this.hintColor,
    required this.itemAsString,
    this.showSearch = true,
    required this.hintText,
    this.showLabel,
    this.title,
    this.validator,
    this.titleColor,
  });
  final List<T> items;
  final ValueChanged<T?> onChanged;
  final Color? backgroundColor;
  final Color? borderColor;
  final T? initialValue;
  final double? radius;
  final Color? hintColor;
  final String Function(T item) itemAsString;
  final bool showSearch;
  final String hintText;
  final bool showRemove;
  final bool? showLabel;
  final String? title;
  final String? Function(T?)? validator;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      child: DropdownSearch<T>(
        compareFn: (item1, item2) => item1 == item2,
        items: (filter, infiniteScrollProps) => items,
        itemAsString: itemAsString,
        validator: validator,
        onChanged: (value) {
          onChanged(value);
        },
        dropdownBuilder: (context, selectedItem) {
          if (selectedItem == null) {
            return const SizedBox.shrink(); // Or any placeholder if you want
          }
          return Text(
            itemAsString(
              selectedItem,
            ), // Use your existing itemAsString function
            // ✅ Control the style, max lines, and overflow
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          );
        },
        selectedItem: initialValue,
        suffixProps: DropdownSuffixProps(
          clearButtonProps: ClearButtonProps(
            isVisible: showRemove && initialValue != null,
            icon: const Icon(Icons.close, size: 20, color: AppColors.red),
          ),
        ),
        popupProps: PopupProps.menu(
          showSearchBox: showSearch,
          fit: FlexFit.loose,
          searchFieldProps: TextFieldProps(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: AppTextStyles.reg14.copyWith(
                color: hintColor ?? AppColors.grey,
              ),
              fillColor: AppColors.textFormFieldBg,
              border: _buildBorder(),
              enabledBorder: _buildBorder(),
              focusedBorder: _buildBorder(),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
            ),
          ),

          scrollbarProps: const ScrollbarProps(
            thickness: 8,
            radius: Radius.circular(8),
            thumbColor: AppColors.primaryColor,
          ),
          loadingBuilder: (context, searchEntry) => const Center(
            child: CircularProgressIndicator(color: AppColors.primaryColor),
          ),
          errorBuilder: (context, searchEntry, exception) =>
              Center(child: Text(LocaleKeys.unknown.tr())),
          emptyBuilder: (context, searchEntry) {
            return Center(
              child: Text(
                'لا توجد بيانات',
                style: AppTextStyles.med14.copyWith(color: AppColors.grey500),
              ),
            );
          },
          itemBuilder: (context, item, isDisabled, isSelected) {
            return ListTile(
              title: Text(itemAsString(item), style: AppTextStyles.med14),
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              visualDensity: VisualDensity.compact,
            );
          },
        ),

        decoratorProps: DropDownDecoratorProps(
          decoration: InputDecoration(
            floatingLabelBehavior: showLabel == true
                ? FloatingLabelBehavior.always
                : FloatingLabelBehavior.never,
            labelText: title,
            labelStyle: AppTextStyles.reg14.copyWith(
              color: titleColor ?? AppColors.black500,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            hintText: hintText,
            hintStyle: AppTextStyles.med14.copyWith(color: AppColors.grey),
            border: _buildBorder(),
            fillColor: backgroundColor ?? AppColors.white,
            filled: true,
            enabledBorder: _buildBorder(),
            focusedBorder: _buildBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder _buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius ?? 12),
      borderSide: BorderSide(
        color: borderColor ?? AppColors.grey200,
        width: 1.5,
      ),
    );
  }
}
