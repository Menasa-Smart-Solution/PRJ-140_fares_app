part of '../widgets.dart';

class NewFlights extends StatelessWidget {
  const NewFlights({super.key, required this.flights});
  final List<int> flights;

  @override
  Widget build(BuildContext context) {
    return flights.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("الرحلات الجديدة", style: AppTextStyles.semiBold16),
              verticalSpace(8),
              Column(
                children: List.generate(
                  flights.length,
                  (index) => _buildNewsFlightsItem(flights[index], context),
                ),
              ),
            ],
          )
        : const SizedBox();
  }

  Widget _buildNewsFlightsItem(int flight, BuildContext context) {
    return Skeleton.leaf(
      child: ListTile(
        tileColor: AppColors.pastelGreen,
        title: Text("$flight", style: AppTextStyles.med16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        trailing: RoundedIconButton(
          onTap: () {
            context.read<HomeCubit>().receiveParcels(flight.toString());
          },
          icon: Icons.done,
          iconColor: Colors.white,
          backgroundColor: AppColors.lightPrimaryColor,
        ),
      ).withPadding(bottom: 8),
    );
  }
}
