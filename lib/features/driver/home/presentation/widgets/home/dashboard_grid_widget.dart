part of '../widgets.dart';

class DashboardGridWidget extends StatelessWidget {
  const DashboardGridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 188 / 158,
          ),
          itemCount: 10,
          itemBuilder: (context, index) {
            return DashboardCardWidget(
              title: 'جميع الطلبات',
              subtitle: '154 حركة متاحة',
              imagePath: AppImages.imagesAllOrders,
              onTap: () => print('Dashboard card tapped at index $index'),
            );
          },
        ),
      ),
    );
  }
}
