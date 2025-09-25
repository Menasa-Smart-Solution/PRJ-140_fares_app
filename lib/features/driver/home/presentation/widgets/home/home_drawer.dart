part of '../widgets.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primaryColor,
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: RoundedIconButton(
              icon: Icons.close,
              size: 35,
              onTap: () {
                context.pop();
              },
              iconColor: AppColors.white,
            ).toStart,
          ),
          SliverToBoxAdapter(child: verticalSpace(30)),
          SliverToBoxAdapter(
            child: DrawerItem(
              title: LocaleKeys.profile.tr(),
              imagePath: AppImages.imagesProfile,
            ),
          ),
          SliverToBoxAdapter(
            child: DrawerItem(
              title: LocaleKeys.shipments.tr(),
              imagePath: AppImages.imagesGlobal,
            ),
          ),
          SliverToBoxAdapter(
            child: DrawerItem(
              title: LocaleKeys.walletMenu.tr(),
              imagePath: AppImages.imagesGlobal,
            ),
          ),
          SliverToBoxAdapter(
            child: DrawerItem(
              title: LocaleKeys.chatsMenu.tr(),
              imagePath: AppImages.imagesGlobal,
            ),
          ),
          SliverToBoxAdapter(
            child: DrawerItem(
              title: LocaleKeys.aboutApp.tr(),
              imagePath: AppImages.imagesHelp,
            ),
          ),
          SliverToBoxAdapter(
            child: DrawerItem(
              title: LocaleKeys.policies.tr(),
              imagePath: AppImages.imagesShieldSecurity,
            ),
          ),
          SliverToBoxAdapter(
            child: DrawerItem(
              title: LocaleKeys.termsAndConditions.tr(),
              imagePath: AppImages.imagesDocumentText,
            ),
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: LogoutWidget(),
          ),
        ],
      ).withPadding(vertical: 30, horizontal: 16),
    );
  }
}
