import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/driver/chat/feature_imports.dart';
import 'package:fares/features/driver/home/presentation/widgets/widgets.dart';
import 'package:fares/features/store/home/presentations/views/store_home_view.dart';
import 'package:fares/features/store/main/presentations/cubit/main_store_cubit.dart';

class MainStoreView extends StatelessWidget {
  const MainStoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainStoreCubit(),
      child: const MainStore(),
    );
  }
}

class MainStore extends StatelessWidget {
  const MainStore({super.key});

  static const List<Widget> _pages = [
    StoreHomeView(),
    NotificationsView(),
    ConversationsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainStoreCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(index: state, children: _pages),
          drawer: const HomeDrawer(),
          bottomNavigationBar: NavigationBar(
            indicatorColor: AppColors.primaryColor,
            labelTextStyle: WidgetStateProperty.all(
              AppTextStyles.semiBold12.copyWith(color: AppColors.darkGrey),
            ),
            height: 60,
            elevation: 2,
            selectedIndex: state,
            onDestinationSelected: (int index) {
              context.read<MainStoreCubit>().changeTab(index);
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
