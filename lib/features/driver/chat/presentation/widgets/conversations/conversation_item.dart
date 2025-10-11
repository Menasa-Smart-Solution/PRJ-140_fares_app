part of '../../../feature_imports.dart';

class ConversationItem extends StatelessWidget {
  const ConversationItem({super.key, required this.conversation});
  final ConversationModel conversation;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      splashColor: AppColors.pastelGreen,
      tileColor: AppColors.textFormFieldBg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
        side: const BorderSide(color: AppColors.textFormBorderColor),
      ),
      leading: Skeleton.leaf(
        child: Container(
          width: 48,
          height: 48,
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.textFormBorderColor),
          ),
          child: Center(child: Image.asset(AppImages.imagesIconPrimary)),
        ),
      ),
      title: Text(
        conversation.parcelId.toString(),
        style: AppTextStyles.bold16.copyWith(color: AppColors.primaryColor),
      ),
      subtitle: Text(
        conversation.lastMessage?.details ?? '',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.med16,
      ),
      trailing: Text(
        DateFormat(
          'yy/MM/dd',
        ).format(DateTime.parse(conversation.createdAt ?? '')),
        style: AppTextStyles.reg12.copyWith(color: AppColors.grey),
      ),
      onTap: () {
        final cubit = context.read<ChatCubit>();
        context.pushNamed(
          Routes.chatRoute,
          arguments: ChatParam(
            parcelId: conversation.parcel?.id ?? 0,
            chatCubit: cubit,
          ),
        );
      },
    );
  }
}
