part of '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          // Header Section
          const HomeHeaderWidget(balance: '500 د.ل'),
          verticalSpace(20),
          const HomeSearchBarWidget(),
          verticalSpace(20),
          const DashboardGridWidget(),
          verticalSpace(20),
        ],
      ).withPadding(vertical: 20, horizontal: 16),
    );
  }
}
