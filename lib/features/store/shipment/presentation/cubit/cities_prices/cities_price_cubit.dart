import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cities_price_state.dart';

class CitiesPriceCubit extends Cubit<CitiesPriceState> {
  CitiesPriceCubit() : super(CitiesPriceInitial());
}
