part of '../widgets.dart';

class DashboardGridWidget extends StatelessWidget {
  const DashboardGridWidget({
    super.key,
    required this.statuses,
    this.isStore = false,
  });
  final List<StatusModel> statuses;
  final bool isStore;
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
          onTap: () {
            if (!isStore) {
              context.pushNamed(
                Routes.allOrdersRoute,
                arguments: AllOrdersParams(
                  status: statuses[index].id.toString(),
                ),
              );
            } else {
              if (statuses[index].id.toString() != 'chats') {
                context.pushNamed(
                  Routes.storeParcelsRoute,
                  arguments: StoreParcelsParams(
                    id: statuses[index].id.toString() == 'all'
                        ? null
                        : statuses[index].id.toString(),
                    name: statuses[index].nameAr,
                  ),
                );
              } else {
                context.read<MainStoreCubit>().changeTab(2);
              }
            }
          },
        );
      },
    );
  }
}
