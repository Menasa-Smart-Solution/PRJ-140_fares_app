part of '../../../feature_imports.dart';

class AddCollectionBlocListener extends StatelessWidget {
  const AddCollectionBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateStoreCollectCubit, CreateStoreCollectState>(
      listenWhen: (previous, current) =>
          current.createStoreCollectState != previous.createStoreCollectState ||
          current.showWarning != previous.showWarning,
      listener: (context, state) {
        if (state.createStoreCollectState.isLoading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.createStoreCollectState.isSuccess) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(message: 'تم حفظ الطلب بنجاح', type: SnackType.success);
          // Navigator.of(context).pop();
        } else if (state.createStoreCollectState.isError) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(message: state.errorMessage!, type: SnackType.error);
        } else if (state.showWarning) {
          log('Showing warning snack bar');
          showSnackBar(
            message: 'يرجى اختيار خدمة واحدة على الأقل',
            type: SnackType.warning,
          );
        }
      },
      child: const SizedBox(),
    );
  }
}
