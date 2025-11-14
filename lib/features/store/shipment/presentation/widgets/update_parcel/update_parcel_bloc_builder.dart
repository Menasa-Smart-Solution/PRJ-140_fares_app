part of '../../../feature_imports.dart';

class UpdateParcelBlocBuilder extends StatelessWidget {
  const UpdateParcelBlocBuilder({super.key, required this.parcelId});
  final int parcelId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UpdateParcelsCubit, UpdateParcelsState>(
      builder: (context, state) {
        switch (state.getParcelsState) {
          case StateType.loading:
            return Skeletonizer(
              enabled: true,
              child: UpdateParcelViewBody(parcel: dummyParcels[0]),
            );
          case StateType.success:
            return UpdateParcelViewBody(parcel: state.parcel!);
          case StateType.error:
            return CustomErrorWidget(
              message: state.errorMessage!,
              onPressed: () {
                context.read<UpdateParcelsCubit>().getCitiesPrices();
                context.read<UpdateParcelsCubit>().getProducts();
                context.read<UpdateParcelsCubit>().getParcel(parcelId);
              },
            );
          case StateType.noInternet:
            return InternetConnectionWidget(
              onPressed: () {
                context.read<UpdateParcelsCubit>().getCitiesPrices();
                context.read<UpdateParcelsCubit>().getProducts();
                context.read<UpdateParcelsCubit>().getParcel(parcelId);
              },
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
