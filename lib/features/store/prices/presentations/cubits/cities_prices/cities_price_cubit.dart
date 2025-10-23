import 'package:equatable/equatable.dart';
import 'package:fares/core/enums/enums.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/features/store/prices/data/models/city_response_model.dart';
import 'package:fares/features/store/prices/data/repos/prices_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'cities_price_state.dart';

class CitiesPriceCubit extends Cubit<CitiesPriceState> {
  final PricesRepo _repo;
  final InternetService _internetService;

  CitiesPriceCubit(this._repo, this._internetService)
    : super(const CitiesPriceState());

  Future<void> getCitiesPrices() async {
    emit(state.copyWith(getCitiesPricesState: StateType.loading));

    if (!await _internetService.isConnected()) {
      emit(state.copyWith(getCitiesPricesState: StateType.noInternet));
      return;
    }

    final result = await _repo.getCities();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            getCitiesPricesState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (cityResponse) {
        emit(
          state.copyWith(
            getCitiesPricesState: cityResponse.data.isEmpty
                ? StateType.empty
                : StateType.success,
            allCities: cityResponse.data,
            citiesPrices: cityResponse.data,
          ),
        );
      },
    );
  }

  void searchCities(String? query) {
    if (query == null || query.isEmpty) {
      emit(state.copyWith(citiesPrices: state.allCities));
      return;
    }

    final filteredCities = state.citiesPrices.where((city) {
      return city.name.toLowerCase().contains(query.toLowerCase());
    }).toList();
    emit(state.copyWith(citiesPrices: filteredCities));
  }
}
