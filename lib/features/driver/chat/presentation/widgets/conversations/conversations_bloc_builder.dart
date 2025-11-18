part of '../../../feature_imports.dart';

class ConversationsBlocBuilder extends StatelessWidget {
  const ConversationsBlocBuilder({super.key, required this.scrollController});
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        switch (state.getAllConversationsState) {
          case StateType.loading:
            return const SliverToBoxAdapter(
              child: ConversationsLoadingShimmer(),
            );

          case StateType.success:
            return ConversationsListView(
              conversation: state.conversations,
              scrollController: scrollController,
              isLoadingMore: state.isLoadingMore,
              hasMore: state.hasMoreData,
            );
          case StateType.error:
            return SliverFillRemaining(
              hasScrollBody: false,
              child: CustomErrorWidget(
                message: state.getAllConversationsErrorMessage!,
                onPressed: () {
                  context.read<ChatCubit>().getConversations();
                },
              ),
            );
          case StateType.empty:
            return const EmptyConversations();
          case StateType.noInternet:
            return SliverFillRemaining(
              hasScrollBody: false,
              child: InternetConnectionWidget(
                onPressed: () {
                  context.read<ChatCubit>().getConversations();
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
