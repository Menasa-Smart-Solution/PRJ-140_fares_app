part of '../widgets.dart';

class NotificationViewBody extends StatelessWidget {
  const NotificationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<NotificationsCubit>().getAllNotifications();
      },
      child: CustomScrollView(
        slivers: [
          // SliverToBoxAdapter(
          //   child: Text(
          //     LocaleKeys.allNotifications.tr(),
          //     style: AppTextStyles.bold16,
          //   ),
          // ),
          SliverToBoxAdapter(child: verticalSpace(16)),
          const NotificationsBlocBuilder(),
        ],
      ),
    );
  }
}
