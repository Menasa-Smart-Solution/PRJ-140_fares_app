part of '../../../features_imports.dart';

class TicketsBlocBuilder extends StatelessWidget {
  const TicketsBlocBuilder({super.key});

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
              child: TicketsListView(tickets: dummyTickets),
            );
          case StateType.success:
            return TicketsListView(tickets: state.tickets);
          case StateType.error:
            return CustomErrorWidget(
              message: state.errorMessage!,
              onPressed: () {
                context.read<TicketsCubit>().getTickets();
              },
            );
          case StateType.noInternet:
            return InternetConnectionWidget(
              onPressed: () {
                context.read<TicketsCubit>().getTickets();
              },
            );
          case StateType.empty:
            return CustomEmptyWidget(
              message: LocaleKeys.noSupportTickets.tr(),
              imagePath: AppImages.imagesEmptyTickets,
            );
          default:
            return const SizedBox();
        }
      },
    );
  }
}
