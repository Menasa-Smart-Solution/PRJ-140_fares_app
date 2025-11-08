import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/store/home/presentation/cubit/tickets/tickets_cubit.dart';

class CreateTicketBlocListener extends StatelessWidget {
  const CreateTicketBlocListener({super.key, required this.isComplaints});
  final bool isComplaints;

  @override
  Widget build(BuildContext context) {
    return BlocListener<TicketsCubit, TicketsState>(
      listenWhen: (previous, current) =>
          current.createTicketState != previous.createTicketState,
      listener: (context, state) async {
        if (state.createTicketState.isSuccess) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(
            message: isComplaints
                ? LocaleKeys.createComplaintSuccess.tr()
                : 'تم إنشاء التذكرة بنجاح',
            type: SnackType.success,
          );
          context.read<TicketsCubit>().getTickets(isComplaints);
        } else if (state.createTicketState.isLoading) {
          OverlayHelper.showLoadingOverlay(context);
        } else if (state.createTicketState.isError) {
          OverlayHelper.hideLoadingOverlay();
          showSnackBar(message: state.errorMessage!, type: SnackType.error);
        } else if (state.createTicketState.isNoInternet) {
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
