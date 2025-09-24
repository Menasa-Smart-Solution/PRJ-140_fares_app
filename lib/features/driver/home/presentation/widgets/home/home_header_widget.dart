part of '../widgets.dart';

class HomeHeaderWidget extends StatelessWidget {
  final String balance;

  const HomeHeaderWidget({super.key, this.balance = '500 د.ل'});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: () {},
              // padding: EdgeInsets.zero,
              visualDensity: const VisualDensity(horizontal: -1, vertical: -1),
              icon: Icon(
                AppIcons.menu,
                size: 15,
                color: AppColors.primaryColor,
              ),
            ),
            Container(
              width: 32,
              height: 32,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withAlpha(15),
                shape: BoxShape.circle,
              ),
              child: Text(
                'DE',
                style: AppTextStyles.med12.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        Column(
          children: [
            Text(
              LocaleKeys.currentBalance.tr(),
              style: AppTextStyles.med12.copyWith(color: AppColors.grey),
            ),
            Text(balance, style: AppTextStyles.semiBold12),
          ],
        ),
        horizontalSpace(15),
        Spacer(),

        RoundedIconButton(
          icon: AppIcons.notifications,
          onTap: () {
            context.pushNamed(Routes.notificationsRoute);
          },
          width: 32,
          height: 32,
          iconColor: AppColors.primaryColor,
          size: 15,
        ),
      ],
    );
  }
}
