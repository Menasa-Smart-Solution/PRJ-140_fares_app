part of '../../../feature_imports.dart';

class CreateParcelsBlocListener extends StatelessWidget {
  const CreateParcelsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateParcelsCubit, CreateParcelsState>(
      listenWhen: (previous, current) =>
          current.createParcelsState != previous.createParcelsState,
      listener: (context, state) {
        if (state.createParcelsState.isLoading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.createParcelsState.isSuccess) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(
            message: 'تم أضافة شحنة جديدة بنجاح',
            type: SnackType.success,
          );
          // Navigator.of(context).pop();
        } else if (state.createParcelsState.isError) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(message: state.errorMessage!, type: SnackType.error);
        }
      },
      child: const SizedBox(),
    );
  }
}
