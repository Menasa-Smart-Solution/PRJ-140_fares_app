part of '../widgets.dart';

class NotificationsListView extends StatefulWidget {
  const NotificationsListView({
    super.key,
    required this.notifications,
    required this.isLoadingMore,
    required this.hasMore,
  });
  final List<NotificationModel> notifications;
  final bool isLoadingMore;
  final bool hasMore;

  @override
  State<NotificationsListView> createState() => _NotificationsListViewState();
}

class _NotificationsListViewState extends State<NotificationsListView> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom && widget.hasMore && !widget.isLoadingMore) {
      context.read<NotificationsCubit>().getAllNotifications(isLoadMore: true);
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const AlwaysScrollableScrollPhysics(),
      controller: _scrollController,
      itemBuilder: (context, index) {
        if (index == widget.notifications.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Center(child: CustomLoading()),
          );
        }
        return NotificationItem(notification: widget.notifications[index]);
      },
      itemCount: widget.notifications.length + (widget.isLoadingMore ? 1 : 0),
    );
  }
}
