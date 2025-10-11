part of 'chat_cubit.dart';

class ChatState extends Equatable {
  final List<ConversationModel> conversations;
  final List<ConversationModel> allConversations; // Original unfiltered list
  final StateType getAllConversationsState;
  final String? getAllConversationsErrorMessage;

  final ConversationMessagesModel? conversationMessages;
  final StateType getConversationMessagesState;
  final String? getConversationMessagesErrorMessage;

  final StateType sendMessageState;
  final String? sendMessageErrorMessage;

  const ChatState({
    this.conversations = const [],
    this.allConversations = const [],
    this.getAllConversationsState = StateType.loading,
    this.getAllConversationsErrorMessage,
    this.conversationMessages,
    this.getConversationMessagesState = StateType.loading,
    this.getConversationMessagesErrorMessage,
    this.sendMessageState = StateType.initial,
    this.sendMessageErrorMessage,
  });

  ChatState copyWith({
    List<ConversationModel>? conversations,
    List<ConversationModel>? allConversations,
    StateType? getAllConversationsState,
    String? getAllConversationsErrorMessage,
    ConversationMessagesModel? conversationMessages,
    StateType? getConversationMessagesState,
    String? getConversationMessagesErrorMessage,
    StateType? sendMessageState,
    String? sendMessageErrorMessage,
  }) {
    return ChatState(
      conversations: conversations ?? this.conversations,
      allConversations: allConversations ?? this.allConversations,
      getAllConversationsState:
          getAllConversationsState ?? this.getAllConversationsState,
      getAllConversationsErrorMessage:
          getAllConversationsErrorMessage ??
          this.getAllConversationsErrorMessage,
      conversationMessages: conversationMessages ?? this.conversationMessages,
      getConversationMessagesState:
          getConversationMessagesState ?? this.getConversationMessagesState,
      getConversationMessagesErrorMessage:
          getConversationMessagesErrorMessage ??
          this.getConversationMessagesErrorMessage,
      sendMessageState: sendMessageState ?? this.sendMessageState,
      sendMessageErrorMessage:
          sendMessageErrorMessage ?? this.sendMessageErrorMessage,
    );
  }

  @override
  List<Object?> get props => [
    conversations,
    allConversations,
    getAllConversationsState,
    getAllConversationsErrorMessage,
    conversationMessages,
    getConversationMessagesState,
    getConversationMessagesErrorMessage,
    sendMessageState,
    sendMessageErrorMessage,
  ];
}
