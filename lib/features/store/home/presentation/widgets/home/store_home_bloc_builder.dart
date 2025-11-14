part of '../../../features_imports.dart';

class StoreHomeBlocBuilder extends StatelessWidget {
  const StoreHomeBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StoreHomeCubit, StoreHomeState>(
      buildWhen: (oldState, newState) =>
          oldState.getStoreHomeState != newState.getStoreHomeState,
      builder: (context, state) {
        switch (state.getStoreHomeState) {
          case StateType.loading:
            return Skeletonizer(
              child: StoreHomeViewBody(storeHomeModel: dummyStoreHome),
            );
          case StateType.success:
            return RefreshIndicator(
              onRefresh: () async {
                // Check if not logged out before refreshing
                final cubit = context.read<StoreHomeCubit>();
                await cubit.getStoreHome();
              },
              child: StoreHomeViewBody(storeHomeModel: state.storeHome!),
            );
          case StateType.error:
            return buildWidget(
              CustomErrorWidget(
                message: state.errorMessage!,
                onPressed: () {
                  final cubit = context.read<StoreHomeCubit>();
                  if (cubit.state.logOutState != StateType.success) {
                    cubit.getStoreHome();
                  }
                },
              ),
              context,
            );
          case StateType.noInternet:
            return buildWidget(
              InternetConnectionWidget(
                isScaffold: true,
                onPressed: () {
                  final cubit = context.read<StoreHomeCubit>();
                  cubit.getStoreHome();
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
}
