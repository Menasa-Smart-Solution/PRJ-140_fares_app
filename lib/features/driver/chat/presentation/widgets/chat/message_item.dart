part of '../../../feature_imports.dart';

class MessageItem extends StatelessWidget {
  const MessageItem({super.key, required this.isSender, required this.message});
  final bool isSender;
  final MessageModel message;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: isSender ? TextDirection.rtl : TextDirection.ltr,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isSender
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grey200),
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage(
                  isSender ? AppImages.imagesStore : AppImages.imagesMan,
                ),
              ),
            ),
          ),
          horizontalSpace(8),

          Expanded(
            child: Align(
              alignment: isSender
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: Container(
                decoration: isSender
                    ? const BoxDecoration(
                        color: AppColors.lightPrimaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(0),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      )
                    : const BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(0),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 14,
                ),
                child: Column(
                  crossAxisAlignment: isSender
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.end,
                  children: [
                    Text(
                      isSender ? 'المتجر' : 'المندوب',
                      style: AppTextStyles.semiBold14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    verticalSpace(4),
                    Text(
                      message.details ?? '',
                      style: AppTextStyles.med12.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                    verticalSpace(4),
                    Text(
                      formatArabicDateTime(message.createdAt ?? ''),
                      style: AppTextStyles.reg12.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String formatArabicDateTime(String dateIso) {
    final date = DateTime.parse(dateIso).toLocal();

    final formattedDate = DateFormat('d MMMM y', 'ar').format(date);

    final formattedTime = DateFormat('h:mm a', 'ar').format(date);

    return '$formattedDate - $formattedTime';
  }
}
