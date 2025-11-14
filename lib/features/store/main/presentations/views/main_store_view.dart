import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/driver/chat/feature_imports.dart';
import 'package:fares/features/driver/home/presentation/widgets/widgets.dart';
import 'package:fares/features/store/home/features_imports.dart';
import 'package:fares/features/store/home/presentation/views/store_home_view.dart';
import 'package:fares/features/store/main/presentations/cubit/main_store_cubit.dart';
import 'package:fares/features/store/shipment/feature_imports.dart';

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
    TicketsView(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainStoreCubit, int>(
      builder: (context, state) {
        return Scaffold(
          body: IndexedStack(index: state, children: _pages),
          floatingActionButton: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {
              context.pushNamed(Routes.createShipmentRoute, arguments: false);
            },
            child: const Icon(Icons.add),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          drawer: const HomeDrawer(),
          bottomNavigationBar: NavigationBar(
            indicatorColor: Colors.transparent,
            labelTextStyle: WidgetStateProperty.all(
              AppTextStyles.semiBold12.copyWith(color: AppColors.darkGrey),
            ),

            height: 65,
            elevation: 1,
            selectedIndex: state,
            onDestinationSelected: (int index) {
              context.read<MainStoreCubit>().changeTab(index);
            },
            destinations: [
              NavigationDestination(
                icon: const Icon(Icons.home, color: AppColors.grey200),
                selectedIcon: const Icon(
                  Icons.home,

                  color: AppColors.primaryColor,
                ),
                label: LocaleKeys.home.tr(),
              ),
              NavigationDestination(
                icon: const Icon(Icons.notifications, color: AppColors.grey200),
                selectedIcon: const Icon(
                  Icons.notifications,
                  color: AppColors.primaryColor,
                ),
                label: LocaleKeys.notifications.tr(),
              ),

              NavigationDestination(
                icon: const Icon(
                  Icons.chat_bubble_rounded,
                  color: AppColors.grey200,
                ),
                selectedIcon: const Icon(
                  Icons.chat_bubble_rounded,
                  color: AppColors.primaryColor,
                ),
                label: LocaleKeys.chats.tr(),
              ),
              NavigationDestination(
                icon: const Icon(
                  Icons.confirmation_num_outlined,
                  color: AppColors.grey200,
                ),
                selectedIcon: const Icon(
                  Icons.confirmation_num_outlined,
                  color: AppColors.primaryColor,
                ),
                label: LocaleKeys.tickets.tr(),
              ),
            ],
          ),
        );
      },
    );
  }
}
