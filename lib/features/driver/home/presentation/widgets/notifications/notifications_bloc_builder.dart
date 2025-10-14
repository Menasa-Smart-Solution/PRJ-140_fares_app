part of '../widgets.dart';

class NotificationsBlocBuilder extends StatelessWidget {
  const NotificationsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
      builder: (context, state) {
        switch (state.notificationState) {
          case StateType.loading:
            return const SliverToBoxAdapter(
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 50),
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            );
          case StateType.success:
            return NotificationsListView(notifications: state.notifications);
          case StateType.error:
            return SliverFillRemaining(
              hasScrollBody: false,
              child: CustomErrorWidget(
                message: state.errorMessage!,
                onPressed: () {
                  context.read<NotificationsCubit>().getAllNotifications();
                },
              ),
            );
          case StateType.empty:
            return const SliverFillRemaining(
              hasScrollBody: false,
              child: CustomEmptyWidget(message: "لا يوجد إشعار حتى الآن.!"),
            );
          case StateType.noInternet:
            return SliverFillRemaining(
              hasScrollBody: false,
              child: InternetConnectionWidget(
                onPressed: () {
                  context.read<NotificationsCubit>().getAllNotifications();
                },
              ),
            );
          default:
            return const SliverToBoxAdapter(child: SizedBox());
        }
      },
    );
  }
}
