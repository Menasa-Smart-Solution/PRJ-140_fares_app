part of '../widgets.dart';

class FlightsBlocListener extends StatelessWidget {
  const FlightsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listenWhen: (previous, current) =>
          previous.receiveParcelsState != current.receiveParcelsState,
      listener: (context, state) async {
        if (state.receiveParcelsState.isSuccess) {
          OverlayHelper.hideLoadingOverlay();
          await context.read<HomeCubit>().getAllSummary();
          showSnackBar(message: 'تم قبول الطلب بنجاح', type: SnackType.success);
        } else if (state.receiveParcelsState.isLoading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.receiveParcelsState.isError) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(message: state.errorMessage!, type: SnackType.error);
        } else if (state.receiveParcelsState.isNoInternet) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(
            message: LocaleKeys.noNetworkConnection.tr(),
            type: SnackType.warning,
          );
        }
      },

      child: const SizedBox(),
    );
  }
}
