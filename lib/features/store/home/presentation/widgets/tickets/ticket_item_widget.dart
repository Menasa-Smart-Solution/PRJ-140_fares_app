part of '../../../features_imports.dart';

class TicketItemWidget extends StatelessWidget {
  final int id;
  final int parcelId;
  final String details;
  final String createdAt;
  final String from;
  final String to;
  final String deliverymanName;
  final String deliverymanPhone;
  final String statusId;
  final String statusName;

  const TicketItemWidget({
    super.key,
    required this.id,
    required this.parcelId,
    required this.details,
    required this.createdAt,
    required this.from,
    required this.to,
    required this.deliverymanName,
    required this.deliverymanPhone,
    required this.statusId,
    required this.statusName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header with ID and Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStatusChip(),
              Row(
                children: [
                  Text(
                    '#$id',
                    style: AppTextStyles.bold16.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                  horizontalSpace(8),
                  const Icon(
                    Icons.receipt_long,
                    color: AppColors.primaryColor,
                    size: 20,
                  ),
                ],
              ),
            ],
          ),
          verticalSpace(12),
          Divider(color: Colors.grey.shade200, height: 1),
          verticalSpace(12),

          // Route Information
          _buildRouteInfo(),
          verticalSpace(12),

          // Details
          if (details.isNotEmpty) ...[
            Text(
              details,
              style: AppTextStyles.med14.copyWith(color: Colors.black87),
            ),

            verticalSpace(12),
          ],

          // Deliveryman Information
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.person_outline,
                      color: AppColors.primaryColor,
                      size: 20,
                    ),
                    horizontalSpace(8),
                    Expanded(
                      child: Text(
                        deliverymanName,
                        style: AppTextStyles.med12.copyWith(
                          color: Colors.black87,
                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),

                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Icon(
                            Icons.phone,
                            color: AppColors.lightPrimaryColor,
                            size: 18,
                          ),
                          horizontalSpace(8),
                          Flexible(
                            child: Text(
                              deliverymanPhone,
                              style: AppTextStyles.med12.copyWith(
                                color: AppColors.lightPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          verticalSpace(12),

          Row(
            children: [
              Icon(Icons.access_time, color: Colors.grey.shade600, size: 16),
              horizontalSpace(6),

              Text(
                formatToArabicDate(createdAt),
                style: AppTextStyles.reg14.copyWith(
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatusChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.pastelGreen,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        statusName,
        style: AppTextStyles.med14.copyWith(color: AppColors.primaryColor),
      ),
    );
  }

  Widget _buildRouteInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.location_on,
            color: AppColors.primaryColor,
            size: 20,
          ),
          Expanded(
            child: Text(
              from,
              style: AppTextStyles.med12.copyWith(color: Colors.black87),
              textAlign: TextAlign.start,
            ),
          ),
          horizontalSpace(8),

          const Icon(
            Icons.arrow_forward,
            color: AppColors.lightPrimaryColor,
            size: 20,
          ),
          Expanded(
            child: Text(
              to,
              style: AppTextStyles.med12.copyWith(color: Colors.black87),
              textAlign: TextAlign.end,
            ),
          ),
          horizontalSpace(8),
          Icon(Icons.location_on, color: Colors.red.shade400, size: 20),
        ],
      ),
    );
  }
}
