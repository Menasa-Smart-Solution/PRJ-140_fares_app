part of '../../../feature_imports.dart';

class ParcelTimelineSection extends StatelessWidget {
  final List<ParcelsRecord> records;

  const ParcelTimelineSection({super.key, required this.records});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(),
          verticalSpace(20),
          ...List.generate(records.length, (index) {
            final item = records[index];
            return TimelineItem(
              title: item.details ?? '-',
              date: formatToArabicDate(item.createdAt ?? '-'),
              isLast: index == records.length - 1,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(
            Icons.history,
            color: AppColors.primaryColor,
            size: 24,
          ),
        ),
        horizontalSpace(12),
        Text(
          'سجل الشحنة',
          style: AppTextStyles.semiBold16.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
