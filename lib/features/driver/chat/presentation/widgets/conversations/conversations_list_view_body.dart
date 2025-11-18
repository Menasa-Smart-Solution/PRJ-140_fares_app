part of '../../../feature_imports.dart';

class ConversationsListView extends StatefulWidget {
  const ConversationsListView({
    super.key,
    required this.conversation,
    required this.isLoadingMore,
    required this.hasMore,
  });

  final List<ConversationModel> conversation;
  final bool isLoadingMore;
  final bool hasMore;

  @override
  State<ConversationsListView> createState() => _ConversationsListViewState();
}

class _ConversationsListViewState extends State<ConversationsListView> {
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
      context.read<ChatCubit>().getConversations(isLoadMore: true);
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
    return SliverList.separated(
      itemCount: widget.conversation.length + (widget.isLoadingMore ? 1 : 0),
      separatorBuilder: (context, index) => verticalSpace(8),
      itemBuilder: (context, index) {
        if (index == widget.conversation.length) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Center(child: CustomLoading()),
          );
        }
        return ConversationItem(conversation: widget.conversation[index]);
      },
    );
  }
}
