part of '../widgets.dart';

class DashboardGridWidget extends StatelessWidget {
  const DashboardGridWidget({super.key, required this.statuses});
  final List<SummaryStatusModel> statuses;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 188 / 158,
      ),
      itemCount: statuses.length,
      itemBuilder: (context, index) {
        return DashboardCardWidget(
          title: statuses[index].nameAr,
          subtitle: tr(
            LocaleKeys.availablePackages,
            namedArgs: {'value': statuses[index].count.toString()},
          ),
          imagePath: getImage(statuses[index].id.toString()),
          onTap: () => context.pushNamed(
            Routes.allOrdersRoute,
            arguments: statuses[index].id.toString(),
          ),
        );
      },
    );
  }
}
