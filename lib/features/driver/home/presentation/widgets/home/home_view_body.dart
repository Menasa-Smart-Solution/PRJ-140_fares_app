part of '../widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.getAllSummaryState) {
          case StateType.loading:
            return Expanded(
              child: Skeletonizer(child: _buildBody(SummaryDataModel.dummy())),
            );
          case StateType.success:
            return _buildBody(state.summary!.data);
          case StateType.error:
            return const Center(child: Text("Error"));
          case StateType.empty:
            return const Center(child: Text("No Data"));
          default:
            return const SizedBox();
        }

        // return Column(
        //   children: [
        //     // Header Section
        //     // const HomeHeaderWidget(balance: '500 د.ل'),
        //     // verticalSpace(20),
        //     const AcceptedParcels(),
        //     const HomeSearchBarWidget(),
        //     verticalSpace(20),
        //     const HomeBlocBuilder(),
        //     verticalSpace(20),
        //   ],
        // );
      },
    );
  }

  CustomScrollView _buildBody(SummaryDataModel model) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: NewFlights(flights: model.flights)),
        const SliverToBoxAdapter(
          child: Skeleton.leaf(child: HomeSearchBarWidget()),
        ),
        SliverToBoxAdapter(child: verticalSpace(20)),
        DashboardGridWidget(statuses: model.statuses),
        SliverToBoxAdapter(child: verticalSpace(12)),
        SliverToBoxAdapter(
          child: Row(
            children: [
              Expanded(
                child: Skeleton.leaf(
                  child: SizedBox(
                    width: 188,
                    height: 158,

                    child: DashboardCardWidget(
                      title: LocaleKeys.chats.tr(),
                      subtitle: model.chatsCount.toString(),
                      imagePath: AppImages.imagesChats,
                    ),
                  ),
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Skeleton.leaf(
                  child: SizedBox(
                    width: 188,
                    height: 158,

                    child: DashboardCardWidget(
                      title: LocaleKeys.companyDues.tr(),
                      subtitle: model.due.toString(),
                      imagePath: AppImages.imagesCompanyDues,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(12)),
        SliverToBoxAdapter(
          child: Row(
            children: [
              Expanded(
                child: Skeleton.leaf(
                  child: SizedBox(
                    width: 188,
                    height: 158,

                    child: DashboardCardWidget(
                      title: LocaleKeys.delivery.tr(),
                      imagePath: AppImages.imagesQrCode,
                    ),
                  ),
                ),
              ),
              horizontalSpace(12),
              Expanded(
                child: Skeleton.leaf(
                  child: SizedBox(
                    width: 188,
                    height: 158,

                    child: DashboardCardWidget(
                      title: LocaleKeys.orderFailed.tr(),
                      imagePath: AppImages.imagesQrCode,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        SliverToBoxAdapter(child: verticalSpace(20)),
      ],
    );
  }
}
