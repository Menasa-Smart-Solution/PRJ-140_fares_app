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
              onTap: () {
                context.pushNamed(Routes.profileRoute);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: DrawerItem(
              title: LocaleKeys.addShipment.tr(),
              imagePath: AppImages.imagesAdd,
              onTap: () {
                context.pushNamed(Routes.createShipmentRoute, arguments: false);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: DrawerItem(
              title: LocaleKeys.addDeposit.tr(),
              imagePath: AppImages.imagesDeposit,
              onTap: () {
                context.pushNamed(Routes.createShipmentRoute, arguments: true);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: DrawerItem(
              title: LocaleKeys.addCollectionRequest.tr(),
              imagePath: AppImages.imagesAddSequre,
              onTap: () {
                context.pushNamed(Routes.addCollectionRequestRoute);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: DrawerItem(
              title: LocaleKeys.financial.tr(),
              imagePath: AppImages.imagesMoney,
              onTap: () {
                context.pushNamed(Routes.collectionSettlementsRoute);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: DrawerItem(
              title: LocaleKeys.products.tr(),
              imagePath: AppImages.imagesProduct,
            ),
          ),
          SliverToBoxAdapter(
            child: DrawerItem(
              title: LocaleKeys.prices.tr(),
              imagePath: AppImages.imagesShipping,
              onTap: () {
                context.pushNamed(Routes.citiesPricesRoute);
              },
            ),
          ),
          SliverToBoxAdapter(
            child: DrawerItem(
              title: LocaleKeys.contactUs.tr(),
              imagePath: AppImages.imagesChats,
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
