part of '../../../feature_imports.dart';

class EditParcelBlocListener extends StatelessWidget {
  const EditParcelBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateParcelsCubit, UpdateParcelsState>(
      listenWhen: (previous, current) =>
          current.updateParcelState != previous.updateParcelState,
      listener: (context, state) {
        if (state.updateParcelState.isLoading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.updateParcelState.isSuccess) {
          OverlayHelper.hideLoadingOverlay();
          context.pop();
          showSnackBar(
            message: LocaleKeys.editShipmentSuccess.tr(),
            type: SnackType.success,
          );
          // Navigator.of(context).pop();
        } else if (state.updateParcelState.isError) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(message: state.errorMessage!, type: SnackType.error);
        }
      },
      child: const SizedBox(),
    );
  }
}
