part of '../../../features_imports.dart';

class TicketsViewBody extends StatelessWidget {
  const TicketsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data - replace with actual data from Cubit/API
    final tickets = [
      {
        "id": 141981,
        "parcel_id": 141981,
        "details": "تم",
        "created_at": "2025-09-07 13:45:33",
        "from": "قرقارش",
        "to": "طرابلس المركز",
        "deliveryman": {"name": "محمد هدية حسن", "phone": "0911135512"},
        "status": {"id": "8", "name": "قيد الإجراء"},
      },
      {
        "id": 141982,
        "parcel_id": 141982,
        "details": "طرد جديد",
        "created_at": "2025-09-07 14:20:15",
        "from": "بنغازي",
        "to": "طرابلس",
        "deliveryman": {"name": "أحمد علي محمد", "phone": "0925558899"},
        "status": {"id": "1", "name": "مكتمل"},
      },
      {
        "id": 141983,
        "parcel_id": 141983,
        "details": "عاجل",
        "created_at": "2025-09-07 15:10:42",
        "from": "مصراتة",
        "to": "الزاوية",
        "deliveryman": {"name": "خالد سالم عبدالله", "phone": "0917774455"},
        "status": {"id": "2", "name": "قيد التسليم"},
      },
    ];

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: verticalSpace(16)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          sliver: SliverList.builder(
            itemCount: tickets.length,
            itemBuilder: (context, index) {
              final ticket = tickets[index];
              final deliveryman = ticket['deliveryman'] as Map<String, dynamic>;
              final status = ticket['status'] as Map<String, dynamic>;

              return TicketItemWidget(
                id: ticket['id'] as int,
                parcelId: ticket['parcel_id'] as int,
                details: ticket['details'] as String,
                createdAt: ticket['created_at'] as String,
                from: ticket['from'] as String,
                to: ticket['to'] as String,
                deliverymanName: deliveryman['name'] as String,
                deliverymanPhone: deliveryman['phone'] as String,
                statusId: status['id'] as String,
                statusName: status['name'] as String,
              );
            },
          ),
        ),
        SliverToBoxAdapter(child: verticalSpace(20)),
      ],
    );
  }
}
