part of '../../../feature_imports.dart';

class DeleteParcelBlocListener extends StatelessWidget {
  const DeleteParcelBlocListener({super.key, this.status});
  final String? status;
  @override
  Widget build(BuildContext context) {
    return BlocListener<StoreParcelsCubit, StoreParcelsState>(
      listenWhen: (previous, current) =>
          previous.deleteParcelState != current.deleteParcelState,
      listener: (context, state) {
        if (state.deleteParcelState == StateType.loading) {
          OverlayHelper.showLoadingOverlay(context);
        }
        if (state.deleteParcelState == StateType.success) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(
            message: LocaleKeys.parcelDeletedSuccessfully.tr(),
            type: SnackType.success,
          );
          context.read<StoreParcelsCubit>().getStoreParcels(
            status: status,
            refresh: true,
          );
        } else if (state.deleteParcelState == StateType.error) {
          OverlayHelper.hideLoadingOverlay();

          showSnackBar(message: state.errorMessage!, type: SnackType.error);
        }
      },
      child: const SizedBox(),
    );
  }
}
