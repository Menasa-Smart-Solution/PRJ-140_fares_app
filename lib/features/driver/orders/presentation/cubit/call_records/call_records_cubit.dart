import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:fares/core/enums/enums.dart';
import 'package:fares/core/services/image_picker_service.dart';
import 'package:fares/core/services/internet_service.dart';
import 'package:fares/features/driver/orders/data/models/call_images_response.dart';
import 'package:fares/features/driver/orders/data/repositories/orders_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'call_records_state.dart';

class CallRecordsCubit extends Cubit<CallRecordsState> {
  CallRecordsCubit(
    this._ordersRepo,
    this._internetService,
    this._imagePickerService,
  ) : super(const CallRecordsState());
  final OrdersRepo _ordersRepo;
  final InternetService _internetService;
  final ImagePickerService _imagePickerService;

  Future<void> getCallImages({required int parcelId}) async {
    emit(const CallRecordsState(callRecordsState: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(const CallRecordsState(callRecordsState: StateType.noInternet));
      return;
    }
    final result = await _ordersRepo.getCallImages(parcelId: parcelId);
    result.fold(
      (failure) {
        emit(
          CallRecordsState(
            callRecordsState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (result) {
        if (result.images.isEmpty) {
          emit(const CallRecordsState(callRecordsState: StateType.empty));
        } else {
          emit(
            CallRecordsState(
              callRecordsState: StateType.success,
              callImages: result.images,
            ),
          );
        }
      },
    );
  }

  Future<void> pickImage() async {
    final File? image = await _imagePickerService.pickImage(
      type: ImageSourceType.gallery,
    );
    if (image != null) {
      emit(state.copyWith(image: image, pickImageState: StateType.success));
    }
  }

  Future<void> uploadCallImage({
    required int parcelId,
    required File image,
  }) async {
    // Use uploadImageState so UI listeners specifically for upload flow can react
    emit(state.copyWith(uploadImageState: StateType.loading));
    if (!await _internetService.isConnected()) {
      emit(state.copyWith(uploadImageState: StateType.noInternet));
      return;
    }

    final result = await _ordersRepo.uploadCallImage(
      parcelId: parcelId,
      image: image,
    );
    result.fold(
      (failure) {
        emit(
          state.copyWith(
            uploadImageState: StateType.error,
            errorMessage: failure.message,
          ),
        );
      },
      (_) async {
        emit(state.copyWith(uploadImageState: StateType.success));
      },
    );
  }
}
