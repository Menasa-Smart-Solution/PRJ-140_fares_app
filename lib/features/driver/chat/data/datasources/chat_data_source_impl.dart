import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/network/api_service.dart';
import 'package:fares/core/network/error_handler.dart';
import 'package:fares/core/utils/app_logger.dart';
import 'package:fares/features/driver/chat/data/datasources/chat_data_source.dart';
import 'package:fares/features/driver/chat/data/models/conversation_messages_response_model.dart';
import 'package:fares/features/driver/chat/data/models/conversations_response_model.dart';
import 'package:fares/features/driver/chat/data/models/send_message_request_model.dart';

class ChatDataSourceImpl extends ChatDataSource {
  final ApiService _apiService;

  ChatDataSourceImpl({required ApiService apiService})
    : _apiService = apiService;
  @override
  Future<ConversationMessagesResponseModel> getConversationMessages(
    int parcelId,
  ) async {
    try {
      final response = await _apiService.getConversationMessages(parcelId);
      AppLogger.log(
        'Chat Data Source: get conversations Messages success:${response.data!.chat!.messages!.length}',
      );
      return response;
    } catch (e, s) {
      AppLogger.error(
        'Chat Data Source: get conversations Messages failed',
        e,
        s,
      );
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<ConversationsResponseModel> getConversations() async {
    try {
      final response = await _apiService.getConversations();
      AppLogger.log(
        'Chat Data Source: get conversations success:${response.data!.chats.length}',
      );
      return response;
    } catch (e, s) {
      AppLogger.error('Chat Data Source: get conversations failed', e, s);
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }

  @override
  Future<ConversationMessagesResponseModel> sendMessage(
    SendMessageRequestModel request,
    String chatId,
  ) async {
    try {
      final response = await _apiService.sendMessage(
        chatId: chatId,
        body: request,
      );
      AppLogger.log(
        'Chat Data Source: send message success:${response.data!.chat!.messages!.length}',
      );
      return response;
    } catch (e, s) {
      AppLogger.error('Chat Data Source: send message failed', e, s);
      throw ServerException(message: ErrorHandler.handle(e).message!);
    }
  }
}
