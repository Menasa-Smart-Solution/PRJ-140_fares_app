part of '../../../feature_imports.dart';

class ChatListViewItem extends StatefulWidget {
  const ChatListViewItem({super.key, required this.conversationMessages});
  final ConversationMessagesModel conversationMessages;

  @override
  State<ChatListViewItem> createState() => _ChatListViewItemState();
}

class _ChatListViewItemState extends State<ChatListViewItem> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // Scroll to bottom after the widget is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToBottom();
    });
  }

  @override
  void didUpdateWidget(ChatListViewItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    // Scroll to bottom when messages update
    if (oldWidget.conversationMessages.messages?.length !=
        widget.conversationMessages.messages?.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollToBottom();
      });
    }
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: widget.conversationMessages.messages == null
              ? buildWidget(
                  const CustomEmptyWidget(message: 'ا توجد رسائل بعد 👋'),
                  context,
                )
              : ListView.separated(
                  controller: _scrollController,
                  itemCount: widget.conversationMessages.messages!.length,
                  itemBuilder: (context, index) {
                    return MessageItem(
                      isSender:
                          widget
                              .conversationMessages
                              .messages![index]
                              .storeId !=
                          null,
                      message: widget.conversationMessages.messages![index],
                    );
                  },
                  separatorBuilder: (context, index) => verticalSpace(30),
                ).withPadding(vertical: 20, horizontal: 16),
        ),
        SendMessageFormField(conversationMessages: widget.conversationMessages),
      ],
    );
  }
}
