import 'package:fares/core/utils/exports.dart';

class BottomNavItem extends StatelessWidget {
  final IconData iconData;
  final Function? onTap;
  final String label;
  final bool isSelected;
  const BottomNavItem({
    super.key,
    required this.iconData,
    this.onTap,
    this.isSelected = false,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          IconButton(
            icon: Icon(
              iconData,
              color: isSelected ? AppColors.primaryColor : Colors.grey,
              size: 20,
            ),
            onPressed: onTap as void Function()?,
          ),
          Text(
            label,
            style: AppTextStyles.reg12.copyWith(
              color: isSelected ? AppColors.primaryColor : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
