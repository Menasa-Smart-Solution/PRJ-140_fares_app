part of '../widgets.dart';

class HomeBottomNavigationWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int)? onItemTap;
  final VoidCallback? onAddTap;

  const HomeBottomNavigationWidget({
    super.key,
    this.selectedIndex = 0,
    this.onItemTap,
    this.onAddTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildBottomNavItem(
            icon: Icons.home,
            label: 'الرئيسية',
            isSelected: selectedIndex == 0,
            onTap: () => onItemTap?.call(0),
          ),
          _buildBottomNavItem(
            icon: Icons.receipt_long,
            label: 'الطلبات',
            isSelected: selectedIndex == 1,
            onTap: () => onItemTap?.call(1),
          ),
          // Add Button
          GestureDetector(
            onTap: onAddTap,
            child: Container(
              width: 56,
              height: 56,
              decoration: const BoxDecoration(
                color: AppColors.primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.add, color: Colors.white, size: 28),
            ),
          ),
          _buildBottomNavItem(
            icon: Icons.chat_bubble_outline,
            label: 'المحادثات',
            isSelected: selectedIndex == 2,
            onTap: () => onItemTap?.call(2),
          ),
          _buildBottomNavItem(
            icon: Icons.account_circle_outlined,
            label: 'الحساب',
            isSelected: selectedIndex == 3,
            onTap: () => onItemTap?.call(3),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavItem({
    required IconData icon,
    required String label,
    required bool isSelected,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primaryColor : AppColors.grey,
            size: 24,
          ),
          verticalSpace(4),
          Text(
            label,
            style: AppTextStyles.med12.copyWith(
              color: isSelected ? AppColors.primaryColor : AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
