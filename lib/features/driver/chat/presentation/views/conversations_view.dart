part of '../../feature_imports.dart';

class ConversationsView extends StatelessWidget {
  const ConversationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: LocaleKeys.conversations.tr()),
      body: const ConversationsViewBody().withPadding(
        vertical: 20,
        horizontal: 16,
      ),
    );
  }
}
