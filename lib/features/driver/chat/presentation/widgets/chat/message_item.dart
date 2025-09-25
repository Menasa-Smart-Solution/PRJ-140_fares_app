part of '../../../feature_imports.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.isSender});
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: isSender
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.center,
      mainAxisAlignment: isSender
          ? MainAxisAlignment.end
          : MainAxisAlignment.start,
      children: [
        if (!isSender) ...[
          const CircleAvatar(radius: 16, backgroundColor: AppColors.grey200),
          horizontalSpace(10),
        ],
        Expanded(
          child: Align(
            alignment: isSender ? Alignment.centerLeft : Alignment.centerRight,
            child: Container(
              decoration: isSender
                  ? const BoxDecoration(
                      color: AppColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(0),
                      ),
                    )
                  : null,
              padding: isSender
                  ? const EdgeInsets.symmetric(vertical: 10, horizontal: 14)
                  : EdgeInsets.zero,
              child: Text(
                "Hi, Cras sed nisissssssssssssssss at sagittis",
                style: AppTextStyles.med12.copyWith(
                  color: isSender ? AppColors.white : AppColors.grey500,
                ),
              ),
            ),
          ),
        ),
        if (isSender) ...[
          horizontalSpace(10),
          const CircleAvatar(radius: 16, backgroundColor: AppColors.grey200),
        ],
      ],
    );
  }
}
