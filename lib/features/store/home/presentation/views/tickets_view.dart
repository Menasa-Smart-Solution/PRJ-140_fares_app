part of '../../features_imports.dart';

class TicketsView extends StatelessWidget {
  const TicketsView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<TicketsCubit>()..getTickets(),
      child: Scaffold(
        appBar: CustomAppBar(
          title: LocaleKeys.tickets.tr(),
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
                        child: const CreateTicketBottomSheet(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add, color: AppColors.primaryColor),
                );
              },
            ),
          ],
          showBackButton: false,
        ),
        body: const TicketsBlocBuilder().withPadding(
          horizontal: 16,
          vertical: 20,
        ),
      ),
    );
  }
}
