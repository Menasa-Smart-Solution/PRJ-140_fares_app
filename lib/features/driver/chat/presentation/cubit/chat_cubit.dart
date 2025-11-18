import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:fares/core/enums/enums.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/core/utils/app_logger.dart';
import 'package:fares/features/driver/chat/data/models/conversation_messages_response_model.dart';
import 'package:fares/features/driver/chat/data/models/send_message_request_model.dart';
import 'package:fares/features/driver/chat/data/repositories/chat_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/conversations_response_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit(this._chatRepo, this._internetService) : super(const ChatState());

  final ChatRepo _chatRepo;
  final InternetService _internetService;

  Future<void> getConversations({bool isLoadMore = false}) async {
    if (isLoadMore && (state.isLoadingMore || !state.hasMoreData)) return;

    final currentPage = isLoadMore ? state.currentPage + 1 : 1;

    if (isLoadMore) {
      emit(state.copyWith(isLoadingMore: true));
    } else {
      emit(
        state.copyWith(
          getAllConversationsState: StateType.loading,
          currentPage: 1,
          hasMoreData: true,
          conversations: [],
        ),
      );
    }
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(getAllConversationsState: StateType.noInternet));
      return;
    }
    final result = await _chatRepo.getConversation(
      page: currentPage,
      perPage: 10,
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getAllConversationsState: StateType.error,
            getAllConversationsErrorMessage: failure.message,
            isLoadingMore: false,
          ),
        );
      },
      (response) {
        final conversationsList = response.data!.chats;
        final allConversations = isLoadMore
            ? [...state.allConversations, ...conversationsList]
            : conversationsList;
        final hasMoreData =
            response.data!.currentPage < response.data!.lastPage;
        emit(
          state.copyWith(
            getAllConversationsState: StateType.success,
            conversations: allConversations,
            allConversations: allConversations, // Store original list
            hasMoreData: hasMoreData,
            isLoadingMore: false,
          ),
        );
      },
    );
  }

  void filterConversationsByParcelId(String? parcelId) {
    // If search is empty or null, show all conversations
    // Otherwise, filter from the original list
    final List<ConversationModel> filteredConversations =
        (parcelId == null || parcelId.isEmpty)
        ? state
              .allConversations // Show all when search is cleared
        : state.allConversations
              .where(
                (conversation) =>
                    conversation.parcelId?.toString().contains(parcelId) ??
                    false,
              )
              .toList(); // Filter when searching

    emit(
      state.copyWith(
        conversations: filteredConversations,
        getAllConversationsState: filteredConversations.isEmpty
            ? StateType.empty
            : StateType.success,
      ),
    );
  }

  Future<void> getConversationMessages(
    int parcelId, [
    bool isLoading = false,
  ]) async {
    if (isLoading) {
      emit(state.copyWith(getConversationMessagesState: StateType.loading));
    }
    AppLogger.log('Fetching messages for parcelId: $parcelId');
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(getConversationMessagesState: StateType.noInternet));
      return;
    }
    final result = await _chatRepo.getConversationMessages(parcelId);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getConversationMessagesState: StateType.error,
            getConversationMessagesErrorMessage: failure.message,
          ),
        );
      },
      (response) {
        emit(
          state.copyWith(
            getConversationMessagesState: StateType.success,
            conversationMessages: response.data!.chat,
          ),
        );
      },
    );
  }

  Future<void> sendMessage(
    String chatId,
    SendMessageRequestModel message,
    int parcelId,
  ) async {
    emit(state.copyWith(sendMessageState: StateType.loading));

    if (!await _internetService.isConnected()) {
      emit(state.copyWith(sendMessageState: StateType.noInternet));
      return;
    }
    final result = await _chatRepo.sendMessage(message, chatId);
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            sendMessageState: StateType.error,
            sendMessageErrorMessage: failure.message,
          ),
        );
      },
      (response) async {
        emit(state.copyWith(sendMessageState: StateType.success));
        // Fetch updated messages to refresh the UI
        await getConversationMessages(parcelId, false);
        // Reset send message state after successful send
        emit(state.copyWith(sendMessageState: StateType.initial));
      },
    );
  }
}
