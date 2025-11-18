import 'package:dartz/dartz.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/errors/failure.dart';
import 'package:fares/features/driver/chat/data/datasources/chat_data_source.dart';
import 'package:fares/features/driver/chat/data/models/conversation_messages_response_model.dart';
import 'package:fares/features/driver/chat/data/models/conversations_response_model.dart';
import 'package:fares/features/driver/chat/data/models/send_message_request_model.dart';
import 'package:fares/generated/locale_keys.g.dart';

class ChatRepo {
  final ChatDataSource _chatDataSource;

  ChatRepo({required ChatDataSource chatDataSource})
    : _chatDataSource = chatDataSource;

  Future<Either<Failure, ConversationsResponseModel>> getConversation({
    int page = 1,
    int perPage = 10,
  }) async {
    try {
      final result = await _chatDataSource.getConversations(
        page: page,
        perPage: perPage,
      );
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(Failure(message: LocaleKeys.unknown.tr()));
    }
  }

  Future<Either<Failure, ConversationMessagesResponseModel>>
  getConversationMessages(int parcelId) async {
    try {
      final result = await _chatDataSource.getConversationMessages(parcelId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(Failure(message: LocaleKeys.unknown.tr()));
    }
  }

  Future<Either<Failure, ConversationMessagesResponseModel>> sendMessage(
    SendMessageRequestModel request,
    String chatId,
  ) async {
    try {
      final result = await _chatDataSource.sendMessage(request, chatId);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    } catch (e) {
      return Left(Failure(message: LocaleKeys.unknown.tr()));
    }
  }
}
