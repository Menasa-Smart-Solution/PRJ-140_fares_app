part of '../../feature_imports.dart';

class ConversationsView extends StatelessWidget {
  const ConversationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChatCubit>()..getConversations(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.conversations.tr(),
          showBackButton: false,
        ),
        body: const ConversationsViewBody().withPadding(
          bottom: 20,
          horizontal: 16,
        ),
      ),
    );
  }
}
