part of '../../../feature_imports.dart';

class ChangeStatusBlocListener extends StatelessWidget {
  const ChangeStatusBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<OrderOperationCubit, OrderOperationState>(
      listener: (context, state) {
        if (state.changeOrderStatusState.isLoading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.changeOrderStatusState.isSuccess) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(
            message: 'تم تحديث حالة الشحنة بنجاح',
            type: SnackType.success,
          );
          // Pop back to trigger refresh on previous screen
          Navigator.of(context).pop(true);
        } else if (state.changeOrderStatusState.isError ||
            state.changeOrderStatusState.isNoInternet) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(
            message: state.errorMessage ?? 'حدث خطأ ما، يرجى المحاولة مرة أخرى',
            type: SnackType.error,
          );
        }
      },
      child: const SizedBox(),
    );
  }
}
