part of 'cities_price_cubit.dart';

class CitiesPriceState extends Equatable {
  final StateType getCitiesPricesState;
  final List<CityModel> citiesPrices;
  final List<CityModel> allCities;
  final String? errorMessage;

  const CitiesPriceState({
    this.getCitiesPricesState = StateType.loading,
    this.citiesPrices = const [],
    this.allCities = const [],
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
    getCitiesPricesState,
    citiesPrices,
    errorMessage,
    allCities,
  ];

  CitiesPriceState copyWith({
    StateType? getCitiesPricesState,
    List<CityModel>? citiesPrices,
    String? errorMessage,
    List<CityModel>? allCities,
  }) {
    return CitiesPriceState(
      getCitiesPricesState: getCitiesPricesState ?? this.getCitiesPricesState,
      citiesPrices: citiesPrices ?? this.citiesPrices,
      errorMessage: errorMessage ?? this.errorMessage,
      allCities: allCities ?? this.allCities,
    );
  }
}
