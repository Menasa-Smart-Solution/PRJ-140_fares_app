part of '../../feature_imports.dart';

class CitiesPricesView extends StatelessWidget {
  const CitiesPricesView({super.key});

  static const List<Map<String, dynamic>> _citiesPrices = [
    {
      'city': 'طرابلس',
      'price': 15.0,
      'deliveryTime': '1-2 يوم',
      'isActive': true,
    },
    {
      'city': 'بنغازي',
      'price': 20.0,
      'deliveryTime': '2-3 يوم',
      'isActive': true,
    },
    {
      'city': 'مصراتة',
      'price': 18.0,
      'deliveryTime': '1-2 يوم',
      'isActive': true,
    },
    {
      'city': 'الزاوية',
      'price': 12.0,
      'deliveryTime': '1 يوم',
      'isActive': true,
    },
    {
      'city': 'زليتن',
      'price': 17.0,
      'deliveryTime': '2 يوم',
      'isActive': false,
    },
    {
      'city': 'صبراتة',
      'price': 16.0,
      'deliveryTime': '1-2 يوم',
      'isActive': true,
    },
    {
      'city': 'الخمس',
      'price': 19.0,
      'deliveryTime': '2-3 يوم',
      'isActive': true,
    },
    {
      'city': 'سبها',
      'price': 35.0,
      'deliveryTime': '3-4 يوم',
      'isActive': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'أسعار المدن'),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AppTextFormField(
              hintText: 'ابحث عن مدينه هنا',
              validator: (value) {},
            ),
          ),

          SliverToBoxAdapter(child: verticalSpace(20)),
          SliverList.builder(
            itemCount: _citiesPrices.length,

            itemBuilder: (context, index) {
              return CustomFadeInUp(
                duration: 500 + (index * 50),
                child: CityPriceCard(
                  cityData: _citiesPrices[index],
                  index: index,
                ),
              );
            },
          ),
          SliverToBoxAdapter(child: verticalSpace(24)),
        ],
      ).withPadding(vertical: 20, horizontal: 16),
    );
  }
}
