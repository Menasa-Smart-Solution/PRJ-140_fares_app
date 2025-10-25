part of '../widgets.dart';

class NotificationsBlocBuilder extends StatelessWidget {
  const NotificationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        switch (state.notificationState) {
          case StateType.loading:
            return Skeletonizer(
              enabled: true,
              child: NotificationsListView(
                notifications: List.generate(
                  5,
                  (index) => NotificationModel(
                    id: index,
                    title: 'Notification $index',
                    body: 'This is the body of notification $index',
                    createdAt: DateTime.now().toIso8601String(),
                  ),
                ),
              ),
            );
          case StateType.success:
            return NotificationsListView(notifications: state.notifications);
          case StateType.error:
            return buildWidget(
              CustomErrorWidget(
                message: state.errorMessage!,
                onPressed: () {
                  context.read<NotificationsCubit>().getAllNotifications();
                },
              ),
              context,
            );
          case StateType.empty:
            return buildWidget(
              const CustomEmptyWidget(message: "لا يوجد إشعار حتى الآن.!"),
              context,
            );
          case StateType.noInternet:
            return buildWidget(
              InternetConnectionWidget(
                onPressed: () {
                  context.read<NotificationsCubit>().getAllNotifications();
                },
              ),
              context,
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
