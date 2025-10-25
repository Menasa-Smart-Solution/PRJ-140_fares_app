part of '../widgets.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<NotificationsCubit>().getAllNotifications();
      },
      child: const NotificationsBlocBuilder(),
    );
  }
}
