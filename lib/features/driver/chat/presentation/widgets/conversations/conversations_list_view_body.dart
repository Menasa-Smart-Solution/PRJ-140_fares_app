part of '../../../feature_imports.dart';

class ConversationsListView extends StatelessWidget {
  const ConversationsListView({super.key, required this.conversation});

  final List<ConversationModel> conversation;

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: conversation.length,
      separatorBuilder: (context, index) => verticalSpace(8),
      itemBuilder: (context, index) {
        return ConversationItem(conversation: conversation[index]);
      },
    );
  }
}
