part of '../../../feature_imports.dart';

class ChatViewBody extends StatelessWidget {
  const ChatViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Text(
            "اليوم 14:30",
            style: AppTextStyles.med12.copyWith(color: AppColors.darkGrey),
          ).center,
        ),
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverList.separated(
          itemCount: 5,
          itemBuilder: (context, index) {
            return const MessageItem(isSender: true);
          },
          separatorBuilder: (context, index) => verticalSpace(30),
        ),
      ],
    );
  }
}
