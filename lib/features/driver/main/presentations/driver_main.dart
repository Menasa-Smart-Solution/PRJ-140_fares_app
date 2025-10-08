import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/driver/chat/feature_imports.dart';
import 'package:fares/features/driver/home/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DriverMain extends StatefulWidget {
  const DriverMain({super.key});

  @override
  State<DriverMain> createState() => _DriverMainState();
}

class _DriverMainState extends State<DriverMain> {
  final List<Widget> _pages = const [
    HomeView(),
    HomeView(),
    ConversationsView(),
    ConversationsView(),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _pages),
      drawer: const HomeDrawer(),

      bottomNavigationBar: NavigationBar(
        indicatorColor: AppColors.primaryColor,
        labelTextStyle: WidgetStateProperty.all(
          AppTextStyles.semiBold12.copyWith(color: AppColors.darkGrey),
        ),
        height: 60,
        elevation: 2,
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home, color: AppColors.grey200),
            selectedIcon: const Icon(Icons.home, color: AppColors.white),
            label: LocaleKeys.home.tr(),
          ),
          NavigationDestination(
            icon: const Icon(AppIcons.wallet, color: AppColors.grey200),
            selectedIcon: const Icon(AppIcons.wallet, color: AppColors.white),
            label: LocaleKeys.wallet.tr(),
          ),
          NavigationDestination(
            icon: const Icon(AppIcons.orders, color: AppColors.grey200),
            selectedIcon: const Icon(AppIcons.orders, color: AppColors.white),
            label: LocaleKeys.orders.tr(),
          ),
          NavigationDestination(
            icon: const Icon(AppIcons.conversations, color: AppColors.grey200),
            selectedIcon: const Icon(
              AppIcons.conversations,
              color: AppColors.white,
            ),
            label: LocaleKeys.chats.tr(),
          ),
        ],
      ),
    );
  }
}
