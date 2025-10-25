part of '../widgets.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key, required this.notifications});
  final List<NotificationModel> notifications;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return NotificationItem(notification: notifications[index]);
      },
      itemCount: notifications.length,
    );
  }
}
