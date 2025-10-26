part of '../../../features_imports.dart';

class StoreHomeViewBody extends StatelessWidget {
  const StoreHomeViewBody({super.key, required this.storeHomeModel});
  final StoreHomeModel storeHomeModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          titleSpacing: 0,
          centerTitle: true,
          leading: CustomIconButton(
            onTap: () {
              //open drawer
              Scaffold.of(context).openDrawer();
            },
            icon: Icons.menu,
            color: AppColors.primaryColor,
          ),
          title: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'رصيدك الحالى',
                style: AppTextStyles.med12.copyWith(color: AppColors.grey),
              ),
              verticalSpace(5),
              Text(
                '${storeHomeModel.balance ?? '0'} د.ل',
                style: AppTextStyles.semiBold12,
              ),
            ],
          ),
        ),
        const SliverToBoxAdapter(child: StoreHomeLogout()),
        SliverToBoxAdapter(
          child: Skeleton.leaf(
            child: HomeSearchBarWidget(
              onTap: () {},
            ).withPadding(horizontal: 16),
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(20)),
        DashboardGridWidget(
          isStore: true,
          statuses: [
            ...storeHomeModel.statuses,
            StatusModel(
              id: 'chats',
              count: storeHomeModel.chatCounts ?? 0,
              nameAr: LocaleKeys.chats.tr(),
            ),
            // StatusModel(
            //   id: 'all',
            //   count:
            //       double.tryParse(storeHomeModel.balance ?? '0')?.toInt() ?? 0,
            //   nameAr: LocaleKeys.companyDues.tr(),
            // ),
          ],
        ),
        // SliverToBoxAdapter(
        //   child: Row(
        //     children: [
        //       Expanded(
        //         child: Skeleton.leaf(
        //           child: SizedBox(
        //             width: 188,
        //             height: 158,

        //             child: DashboardCardWidget(
        //               title: LocaleKeys.chats.tr(),
        //               subtitle: storeHomeModel.chatCounts.toString(),
        //               imagePath: AppImages.imagesChats,
        //               onTap: () => context.read<MainStoreCubit>().changeTab(2),
        //             ),
        //           ),
        //         ),
        //       ),
        //       horizontalSpace(12),
        //       Expanded(
        //         child: Skeleton.leaf(
        //           child: SizedBox(
        //             width: 188,
        //             height: 158,

        //             child: DashboardCardWidget(
        //               title: LocaleKeys.companyDues.tr(),
        //               subtitle: storeHomeModel.balance.toString(),
        //               imagePath: AppImages.imagesCompanyDues,
        //               onTap: () {},
        //             ),
        //           ),
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ],
    );
  }
}
