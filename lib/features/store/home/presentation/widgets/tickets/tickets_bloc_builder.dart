part of '../../../features_imports.dart';

class TicketsBlocBuilder extends StatelessWidget {
  const TicketsBlocBuilder({super.key, required this.isComplaints});
  final bool isComplaints;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TicketsCubit, TicketsState>(
      buildWhen: (previous, current) =>
          current.getTicketsState != previous.getTicketsState,
      builder: (context, state) {
        switch (state.getTicketsState) {
          case StateType.loading:
            return Skeletonizer(
              enabled: true,
              child: TicketsListView(
                tickets: dummyTickets,
                isComplaints: isComplaints,
              ),
            );
          case StateType.success:
            return TicketsListView(
              tickets: state.tickets,
              isComplaints: isComplaints,
            );
          case StateType.error:
            return buildWidget(
              CustomErrorWidget(
                message: state.errorMessage!,
                onPressed: () {
                  context.read<TicketsCubit>().getTickets(isComplaints);
                },
              ),
              context,
            );
          case StateType.noInternet:
            return buildWidget(
              InternetConnectionWidget(
                onPressed: () {
                  context.read<TicketsCubit>().getTickets(isComplaints);
                },
              ),
              context,
            );
          case StateType.empty:
            return buildWidget(
              CustomEmptyWidget(
                message: isComplaints
                    ? LocaleKeys.noComplaints.tr()
                    : LocaleKeys.noSupportTickets.tr(),
                imagePath: isComplaints
                    ? AppImages.imagesEmpty
                    : AppImages.imagesEmptyTickets,
              ),
              context,
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
