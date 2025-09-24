part of '../widgets.dart';

class NotificationsListView extends StatelessWidget {
  const NotificationsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) {
        return NotificationItem();
      },
      itemCount: 10,
    );
  }
}
