part of '../../feature_imports.dart';

class StoreParcelDetailsView extends StatelessWidget {
  const StoreParcelDetailsView({super.key, required this.parcelId});
  final int parcelId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<StoreParcelsCubit>()..getStoreParcelDetails(parcelId),
      child: Scaffold(
        appBar: CustomAppBar(title: 'بيانات الشحنة # ${parcelId.toString()}'),
        body: const StoreParcelsDetailsBlocBuilder(),
      ),
    );
  }
}

// class ParcelInfoSection extends StatelessWidget {
//   final Map<String, dynamic> parcelData;

//   const ParcelInfoSection({super.key, required this.parcelData});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: AppColors.lightPrimaryColor.withOpacity(0.1),
//         borderRadius: BorderRadius.circular(20),
//         border: Border.all(
//           color: AppColors.lightPrimaryColor.withOpacity(0.3),
//           width: 1,
//         ),
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryColor.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Icon(
//                   Icons.inventory_2_outlined,
//                   color: AppColors.primaryColor,
//                   size: 24,
//                 ),
//               ),
//               horizontalSpace(12),
//               Text(
//                 'بيانات الشحنة',
//                 style: AppTextStyles.semiBold16.copyWith(
//                   color: AppColors.primaryColor,
//                 ),
//               ),
//             ],
//           ),
//           verticalSpace(20),
//           _buildInfoRow('الكود', parcelData['code'] as String),
//           verticalSpace(12),
//           _buildInfoRow('الوصف', parcelData['description'] as String),
//           verticalSpace(12),
//           _buildInfoRow(
//             'الحالة',
//             parcelData['status'] as String,
//             valueColor: AppColors.lightPrimaryColor,
//           ),
//           verticalSpace(12),
//           _buildInfoRow('عدد القطع', parcelData['pieces'] as String),
//           verticalSpace(16),
//           Divider(color: AppColors.primaryColor.withOpacity(0.2)),
//           verticalSpace(16),
//           _buildInfoRow(
//             'سعر المنتج',
//             '${parcelData['productPrice']} د.ل',
//             valueStyle: AppTextStyles.bold16,
//           ),
//           verticalSpace(12),
//           _buildInfoRow(
//             'سعر الشحن',
//             '${parcelData['shippingPrice']} د.ل',
//             valueStyle: AppTextStyles.bold16,
//           ),
//           verticalSpace(16),
//           Divider(color: AppColors.primaryColor.withOpacity(0.2)),
//           verticalSpace(16),
//           _buildInfoRow(
//             'الإجمالي',
//             '${parcelData['total']} د.ل',
//             valueStyle: AppTextStyles.bold16,
//             valueColor: AppColors.primaryColor,
//           ),
//           verticalSpace(12),
//           _buildInfoRow('الإنشاء', parcelData['createdAt'] as String),
//           verticalSpace(12),
//           _buildInfoRow('ملاحظة', parcelData['notes'] as String),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoRow(
//     String label,
//     String value, {
//     Color? valueColor,
//     TextStyle? valueStyle,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Text(
//             label,
//             style: AppTextStyles.med14.copyWith(color: AppColors.grey),
//           ),
//         ),
//         horizontalSpace(12),
//         Expanded(
//           child: Text(
//             value.isEmpty ? '-' : value,
//             style: (valueStyle ?? AppTextStyles.med14).copyWith(
//               color: valueColor ?? AppColors.black,
//             ),
//             textAlign: TextAlign.left,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class RecipientInfoSection extends StatelessWidget {
//   final Map<String, dynamic> recipientData;

//   const RecipientInfoSection({super.key, required this.recipientData});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.primaryColor.withOpacity(0.08),
//             blurRadius: 20,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: AppColors.lightPrimaryColor.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Icon(
//                   Icons.person_outline,
//                   color: AppColors.lightPrimaryColor,
//                   size: 24,
//                 ),
//               ),
//               horizontalSpace(12),
//               Text(
//                 'بيانات المستلم',
//                 style: AppTextStyles.semiBold16.copyWith(
//                   color: AppColors.primaryColor,
//                 ),
//               ),
//             ],
//           ),
//           verticalSpace(20),
//           _buildInfoRow('الاسم', recipientData['name'] as String),
//           verticalSpace(12),
//           _buildInfoRow(
//             'الهاتف',
//             recipientData['phone'] as String,
//             valueColor: AppColors.primaryColor,
//           ),
//           verticalSpace(12),
//           _buildInfoRow(
//             'الهاتف الإحتياطي',
//             recipientData['backupPhone'] as String,
//           ),
//           verticalSpace(12),
//           _buildInfoRow('المدينة', recipientData['city'] as String),
//           verticalSpace(12),
//           _buildInfoRow('العنوان', recipientData['address'] as String),
//         ],
//       ),
//     );
//   }

//   Widget _buildInfoRow(
//     String label,
//     String value, {
//     Color? valueColor,
//     TextStyle? valueStyle,
//   }) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Expanded(
//           child: Text(
//             label,
//             style: AppTextStyles.med14.copyWith(color: AppColors.grey),
//           ),
//         ),
//         horizontalSpace(12),
//         Expanded(
//           child: Text(
//             value.isEmpty ? '-' : value,
//             style: (valueStyle ?? AppTextStyles.med14).copyWith(
//               color: valueColor ?? AppColors.black,
//             ),
//             textAlign: TextAlign.left,
//           ),
//         ),
//       ],
//     );
//   }
// }

// class ParcelTimelineSection extends StatelessWidget {
//   final List<Map<String, dynamic>> timeline;

//   const ParcelTimelineSection({super.key, required this.timeline});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(horizontal: 20),
//       padding: const EdgeInsets.all(24),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: AppColors.primaryColor.withOpacity(0.08),
//             blurRadius: 20,
//             offset: const Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: AppColors.primaryColor.withOpacity(0.1),
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: const Icon(
//                   Icons.history,
//                   color: AppColors.primaryColor,
//                   size: 24,
//                 ),
//               ),
//               horizontalSpace(12),
//               Text(
//                 'سجل الشحنة',
//                 style: AppTextStyles.semiBold16.copyWith(
//                   color: AppColors.primaryColor,
//                 ),
//               ),
//             ],
//           ),
//           verticalSpace(20),
//           ...List.generate(timeline.length, (index) {
//             final item = timeline[index];
//             return _buildTimelineItem(
//               item['title'] as String,
//               item['date'] as String,
//               isLast: index == timeline.length - 1,
//             );
//           }),
//         ],
//       ),
//     );
//   }

//   Widget _buildTimelineItem(String title, String date, {bool isLast = false}) {
//     return Row(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Column(
//           children: [
//             Container(
//               width: 12,
//               height: 12,
//               decoration: const BoxDecoration(
//                 color: AppColors.lightPrimaryColor,
//                 shape: BoxShape.circle,
//               ),
//             ),
//             if (!isLast)
//               Container(
//                 width: 2,
//                 height: 60,
//                 color: AppColors.lightPrimaryColor.withOpacity(0.3),
//               ),
//           ],
//         ),
//         horizontalSpace(16),
//         Expanded(
//           child: Container(
//             margin: EdgeInsets.only(bottom: isLast ? 0 : 12),
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: AppColors.lightPrimaryColor.withOpacity(0.05),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: AppTextStyles.med14.copyWith(color: AppColors.black),
//                 ),
//                 verticalSpace(6),
//                 Text(
//                   date,
//                   style: AppTextStyles.reg12.copyWith(color: AppColors.grey),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
