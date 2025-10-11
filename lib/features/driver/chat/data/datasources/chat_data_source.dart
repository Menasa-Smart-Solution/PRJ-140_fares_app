import 'package:fares/features/driver/chat/data/models/conversation_messages_response_model.dart';
import 'package:fares/features/driver/chat/data/models/conversations_response_model.dart';
import 'package:fares/features/driver/chat/data/models/send_message_request_model.dart';

abstract class ChatDataSource {
  Future<ConversationMessagesResponseModel> sendMessage(
    SendMessageRequestModel request,
    String chatId,
  );

  Future<ConversationMessagesResponseModel> getConversationMessages(
    int parcelId,
  );

  Future<ConversationsResponseModel> getConversations();
}
