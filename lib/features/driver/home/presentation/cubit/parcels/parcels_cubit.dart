import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'parcels_state.dart';

class ParcelsCubit extends Cubit<ParcelsState> {
  ParcelsCubit() : super(ParcelsInitial());
}
