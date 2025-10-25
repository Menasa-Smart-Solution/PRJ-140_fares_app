part of '../../../features_imports.dart';

class TicketsListView extends StatelessWidget {
  const TicketsListView({super.key, required this.tickets});
  final List<TicketsModel> tickets;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: RefreshIndicator(
            onRefresh: () async {
              context.read<TicketsCubit>().getTickets();
            },
            child: ListView.builder(
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                return TicketItemWidget(
                  id: tickets[index].id,
                  parcelId: tickets[index].parcelId,
                  details: tickets[index].details,
                  createdAt: tickets[index].createdAt,
                  from: tickets[index].from,
                  to: tickets[index].to,
                  deliverymanName: tickets[index].deliveryman.name,
                  deliverymanPhone: tickets[index].deliveryman.phone,
                  statusId: tickets[index].status.id,
                  statusName: tickets[index].status.name,
                );
              },
            ),
          ),
        ),
        const CreateTicketBlocListener(),
      ],
    );
  }
}
