part of '../../../feature_imports.dart';

class ConversationsLoadingShimmer extends StatelessWidget {
  const ConversationsLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    final list = List.generate(10, (index) => dummyConversation);
    return Skeletonizer(
      enabled: true,
      child: ListView.separated(
        itemCount: list.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 8),
        itemBuilder: (context, index) =>
            ConversationItem(conversation: list[index]),
      ),
    );
  }
}
