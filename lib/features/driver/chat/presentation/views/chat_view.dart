part of '../../feature_imports.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;
    return Scaffold(
      appBar: CustomAppBar(
        title: tr(
          LocaleKeys.shipmentConversation,
          namedArgs: const {'value': '1356'},
        ),
      ),

      body: const ChatViewBody().withPadding(vertical: 20, horizontal: 16),
      bottomSheet: SendMessageFormField(bottomPadding: bottomPadding),
    );
  }
}
