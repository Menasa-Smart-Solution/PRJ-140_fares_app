part of '../../feature_imports.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key, required this.chatParam});
  final ChatParam chatParam;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<ChatCubit>()..getConversationMessages(chatParam.parcelId),
      child: Scaffold(
        appBar: CustomAppBar(
          title: tr(
            LocaleKeys.shipmentConversation,
            namedArgs: {'value': '${chatParam.parcelId}'},
          ),
        ),

        body: ChatViewBody(parcelId: chatParam.parcelId),
      ),
    );
  }
}

class ChatParam {
  final int parcelId;
  final ChatCubit? chatCubit;
  ChatParam({required this.parcelId, this.chatCubit});
}
