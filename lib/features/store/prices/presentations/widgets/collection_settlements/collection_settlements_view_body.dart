part of '../../../feature_imports.dart';

class CollectionSettlementsViewBody extends StatelessWidget {
  const CollectionSettlementsViewBody({super.key});

  // Mock data model
  List<Map<String, dynamic>> _mockData() => [
    {
      'date': '2025-10-10',
      'ref': '#12345',
      'parcels': 4,
      'total': 345.0,
      'discount': 15.0,
      'net': 330.0,
    },
    {
      'date': '2025-10-09',
      'ref': '#12344',
      'parcels': 2,
      'total': 200.0,
      'discount': 0.0,
      'net': 200.0,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final items = _mockData();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: ListView.separated(
        itemCount: items.length,
        separatorBuilder: (_, __) => const SizedBox(height: 12),
        itemBuilder: (context, index) {
          final item = items[index];
          return SettlementCard(
            date: item['date'],
            reference: item['ref'],
            parcels: item['parcels'],
            total: item['total'],
            discount: item['discount'],
            net: item['net'],
          );
        },
      ),
    );
  }
}
