part of '../../../feature_imports.dart';

class CitiesPricesListView extends StatelessWidget {
  const CitiesPricesListView({super.key, required this.citiesPrices});
  final List<CityModel> citiesPrices;
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: citiesPrices.length,

      itemBuilder: (context, index) {
        return CityPriceCard(city: citiesPrices[index]);
      },
    );
  }
}
