import 'package:equatable/equatable.dart';
import 'package:fares/core/utils/exports.dart';
import 'package:fares/features/store/shipment/data/repositories/shipment_repo.dart';

import '../../../data/models/store_collect_request_model.dart';

part 'create_store_collect_state.dart';

class CreateStoreCollectCubit extends Cubit<CreateStoreCollectState> {
  final ShipmentRepo _repo;

  CreateStoreCollectCubit(this._repo) : super(const CreateStoreCollectState());

  Future<void> createStoreCollects({
    required String phone,
    required String address,
    String? notes,
  }) async {
    if (state.selectedServices.isEmpty) {
      emit(
        state.copyWith(
          showWarning: true,
          createStoreCollectState: StateType.initial,
        ),
      );
      return;
    }
    emit(
      state.copyWith(
        createStoreCollectState: StateType.loading,
        showWarning: false,
      ),
    );

    final body = StoreCollectRequestModel(
      phone: phone,
      address: address,
      notes: notes,
      collectParcels: isServiceSelected(LocaleKeys.collectShipments) ? 1 : 0,
      financialSettlement: isServiceSelected(LocaleKeys.financialSettlement)
          ? 1
          : 0,
      returnParcels: isServiceSelected(LocaleKeys.refundShipments) ? 1 : 0,
    );

    final result = await _repo.createStoreCollects(body: body);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            createStoreCollectState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) {
        emit(state.copyWith(createStoreCollectState: StateType.success));
      },
    );
  }

  void toggleServiceSelection(String service) {
    final selectedServices = Set<String>.from(state.selectedServices);
    if (selectedServices.contains(service)) {
      selectedServices.remove(service);
    } else {
      selectedServices.add(service);
    }
    emit(state.copyWith(selectedServices: selectedServices));
  }

  void clearServiceSelection() {
    emit(state.copyWith(selectedServices: const {}));
  }

  bool isServiceSelected(String service) {
    return state.selectedServices.contains(service);
  }
}
