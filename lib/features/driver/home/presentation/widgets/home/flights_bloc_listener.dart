part of '../widgets.dart';

class FlightsBlocListener extends StatelessWidget {
  const FlightsBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) async {
        if (state.logOutState.isSuccess) {
          OverlayHelper.hideLoadingOverlay();
          await context.read<HomeCubit>().getAllSummary();
          showSnackBar(message: 'تم قبول الطلب بنجاح', type: SnackType.success);
        } else if (state.logOutState.isLoading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.logOutState.isError) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(message: state.errorMessage!, type: SnackType.error);
        } else if (state.logOutState.isNoInternet) {
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
