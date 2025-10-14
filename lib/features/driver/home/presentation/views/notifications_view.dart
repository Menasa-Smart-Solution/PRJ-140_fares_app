part of '../widgets/widgets.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NotificationsCubit>()..getAllNotifications(),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          title: LocaleKeys.notifications.tr(),
          showBackButton: false,
        ),
        body: const NotificationViewBody().withPadding(
          vertical: 20,
          horizontal: 16,
        ),
      ),
    );
  }
}
