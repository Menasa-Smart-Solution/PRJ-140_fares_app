part of '../../../feature_imports.dart';

class SendMessageFormField extends StatefulWidget {
  const SendMessageFormField({super.key, required this.conversationMessages});
  final ConversationMessagesModel conversationMessages;

  @override
  State<SendMessageFormField> createState() => _SendMessageFormFieldState();
}

class _SendMessageFormFieldState extends State<SendMessageFormField> {
  final TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final bottomPadding = MediaQuery.of(context).viewPadding.bottom;

    return Container(
      height: 90,
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: bottomPadding,
        top: 10,
      ),
      alignment: Alignment.bottomCenter,
      decoration: const BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.grey500,
            blurRadius: 10,
            offset: Offset(0, -2),
          ),
        ],
      ),

      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: AppTextFormField(
              hintText: LocaleKeys.writeYourMessage.tr(),
              validator: (value) {},
              controller: _messageController,
              borderColor: AppColors.textFormFieldBg,
              showFocusedBorder: false,
            ),
          ),
          horizontalSpace(10),

          BlocConsumer<ChatCubit, ChatState>(
            listener: (context, state) {
              if (state.sendMessageState.isSuccess) {
                // Message sent successfully, UI will update automatically
                // because getConversationMessages is called in the cubit
              } else if (state.sendMessageState.isError) {
                // Show error message if needed
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      state.sendMessageErrorMessage ?? 'خطأ في إرسال الرسالة',
                    ),
                    backgroundColor: AppColors.red,
                  ),
                );
              }
            },
            builder: (context, state) {
              return state.sendMessageState.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Material(
                      color: Colors.transparent,
                      child: Ink(
                        decoration: const ShapeDecoration(
                          color: AppColors.primaryColor,
                          shape: CircleBorder(),
                        ),
                        child: InkWell(
                          onTap: () async {
                            final type = await CacheHelper.getSecuredString(
                              PrefsKeys.role,
                            );
                            if (_messageController.text.isNotEmpty) {
                              if (!context.mounted) return;
                              await context.read<ChatCubit>().sendMessage(
                                widget.conversationMessages.id!.toString(),
                                SendMessageRequestModel(
                                  message: _messageController.text,
                                  parcelId:
                                      widget.conversationMessages.parcelId!,
                                  type: type == 'store'
                                      ? 'store'
                                      : 'deliveryman ',
                                ),
                                int.parse(
                                  widget.conversationMessages.parcelId!,
                                ),
                              );
                              _messageController.clear();
                            }
                          },
                          customBorder: const CircleBorder(),

                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: Center(
                              child: SvgPicture.asset(
                                AppImages.imagesSend,
                                width: 20,
                                height: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
