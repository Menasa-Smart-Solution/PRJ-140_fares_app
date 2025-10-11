import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/driver/chat/feature_imports.dart';
import 'package:fares/features/driver/home/presentation/widgets/widgets.dart';
import 'package:fares/features/driver/main/presentation/cubit/navigation_cubit.dart';
import 'package:flutter/material.dart';

class DriverMain extends StatelessWidget {
  const DriverMain({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<DriverMainCubit>(),
      child: const DriverMainView(),
    );
  }
}

class DriverMainView extends StatelessWidget {
  const DriverMainView({super.key});

  static const List<Widget> _pages = [
    HomeView(),
    NotificationsView(),
    ConversationsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DriverMainCubit, DriverMainState>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(index: state.currentIndex, children: _pages),
          drawer: const HomeDrawer(),
          bottomNavigationBar: NavigationBar(
            indicatorColor: AppColors.primaryColor,
            labelTextStyle: WidgetStateProperty.all(
              AppTextStyles.semiBold12.copyWith(color: AppColors.darkGrey),
            ),
            height: 60,
            elevation: 2,
            selectedIndex: state.currentIndex,
            onDestinationSelected: (int index) {
              context.read<DriverMainCubit>().changeTab(index);
            },
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home, color: AppColors.grey200),
                selectedIcon: const Icon(Icons.home, color: AppColors.white),
                label: LocaleKeys.home.tr(),
              ),
              NavigationDestination(
                icon: const Icon(AppIcons.wallet, color: AppColors.grey200),
                selectedIcon: const Icon(
                  AppIcons.notifications,
                  color: AppColors.white,
                ),
                label: LocaleKeys.notifications.tr(),
              ),

              NavigationDestination(
                icon: const Icon(
                  AppIcons.conversations,
                  color: AppColors.grey200,
                ),
                selectedIcon: const Icon(
                  AppIcons.conversations,
                  color: AppColors.white,
                ),
                label: LocaleKeys.chats.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
