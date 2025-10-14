part of '../../../feature_imports.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key, required this.parcelId});
  final int parcelId; // Example conversation ID
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (context, state) {
        switch (state.getConversationMessagesState) {
          case StateType.loading:
            return const Center(child: CircularProgressIndicator());
          case StateType.success:
            return ChatListViewItem(
              conversationMessages: state.conversationMessages!,
            );
          case StateType.error:
            return buildWidget(
              CustomErrorWidget(
                message: state.getConversationMessagesErrorMessage!,
                onPressed: () {
                  context.read<ChatCubit>().getConversationMessages(parcelId);
                },
              ).withPadding(horizontal: 16),
              context,
            );

          case StateType.noInternet:
            return buildWidget(
              InternetConnectionWidget(
                onPressed: () {
                  context.read<ChatCubit>().getConversationMessages(parcelId);
                },
              ).withPadding(horizontal: 16),
              context,
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
