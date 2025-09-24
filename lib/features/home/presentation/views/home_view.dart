part of '../widgets/widgets.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header Section
            HomeHeaderWidget(balance: '500 د.ل'),
            verticalSpace(20),
            HomeSearchBarWidget(),
            verticalSpace(20),
            DashboardGridWidget(),
            verticalSpace(20),
          ],
        ).withPadding(vertical: 20, horizontal: 16),
      ),
    );
  }
}
