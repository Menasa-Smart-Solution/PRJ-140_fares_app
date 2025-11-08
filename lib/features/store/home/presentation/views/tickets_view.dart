part of '../../features_imports.dart';

class TicketsView extends StatelessWidget {
  const TicketsView({super.key, this.isComplaints = false});
  final bool isComplaints;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TicketsCubit>()..getTickets(isComplaints),
      child: Scaffold(
        appBar: CustomAppBar(
          title: isComplaints
              ? LocaleKeys.complaints.tr()
              : LocaleKeys.tickets.tr(),
          actions: [
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    final cubit = context.read<TicketsCubit>();
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (context) => BlocProvider.value(
                        value: cubit,
                        child: CreateTicketBottomSheet(
                          isComplaints: isComplaints,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add, color: AppColors.primaryColor),
                );
              },
            ),
          ],
          showBackButton: isComplaints ? true : false,
        ),
        body: Column(
          children: [
            Expanded(
              child: TicketsBlocBuilder(
                isComplaints: isComplaints,
              ).withPadding(horizontal: 16, vertical: 20),
            ),
            CreateTicketBlocListener(isComplaints: isComplaints),
          ],
        ),
      ),
    );
  }
}
