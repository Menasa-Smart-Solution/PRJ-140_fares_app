import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'shipment_state.dart';

class ShipmentCubit extends Cubit<ShipmentState> {
  ShipmentCubit() : super(ShipmentInitial());
}
