part of '../widgets.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        switch (state.getAllSummaryState) {
          case StateType.loading:
            return Skeletonizer(
              child: _buildBody(SummaryDataModel.dummy(), context),
            );
          case StateType.success:
            return RefreshIndicator(
              onRefresh: () async {
                await context.read<HomeCubit>().getAllSummary();
              },
              child: _buildBody(state.summary!.data, context),
            );
          case StateType.error:
            return buildWidget(
              CustomErrorWidget(
                message: state.errorMessage!,
                onPressed: () {
                  context.read<HomeCubit>().getAllSummary();
                },
              ),
              context,
            );
          case StateType.noInternet:
            return buildWidget(
              InternetConnectionWidget(
                onPressed: () {
                  context.read<HomeCubit>().getAllSummary();
                },
              ),
              context,
            );
          case StateType.empty:
            return buildWidget(
              const CustomEmptyWidget(message: 'لا توجد بيانات'),
              context,
            );
          default:
            return const SizedBox();
        }
      },
    );
  }

  CustomScrollView _buildBody(SummaryDataModel model, BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          automaticallyImplyLeading: false,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          titleSpacing: 0,
          title: Row(
            children: [
              Skeleton.keep(
                child: Image.asset(
                  AppImages.imagesLogoFullDark,
                  width: 100,
                  height: 50,
                ),
              ),
              const Spacer(),
              CustomIconButton(
                onTap: () {
                  final cubit = context.read<HomeCubit>();
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => BlocProvider.value(
                      value: cubit,
                      child: const LogoutAlertDialog(),
                    ),
                  );
                },
                icon: Icons.logout,
                color: AppColors.red,
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(20)),
        SliverToBoxAdapter(child: NewFlights(flights: model.flights)),
        const SliverToBoxAdapter(
          child: Skeleton.leaf(child: HomeSearchBarWidget()),
        ),
        const SliverToBoxAdapter(child: LogoutBlocListener()),
        SliverToBoxAdapter(child: verticalSpace(20)),
        const SliverToBoxAdapter(child: FlightsBlocListener()),
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
                      onTap: () => context.read<DriverMainCubit>().changeTab(2),
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
                      onTap: () => context.pushNamed(
                        Routes.allOrdersRoute,
                        arguments: AllOrdersParams(
                          status: 'FinancialSettlementPending',
                          title: LocaleKeys.companyDues.tr(),
                        ),
                      ),
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
                      onTap: () {
                        context.pushNamed(
                          Routes.orderQrCodeRoute,
                          arguments: true,
                        );
                      },
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
                      onTap: () {
                        context.pushNamed(
                          Routes.orderQrCodeRoute,
                          arguments: false,
                        );
                      },
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
