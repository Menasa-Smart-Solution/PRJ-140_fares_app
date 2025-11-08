import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:fares/core/errors/exceptions.dart';
import 'package:fares/core/errors/failure.dart';
import 'package:fares/features/store/shipment/data/datasources/shipment_data_source.dart';
import 'package:fares/features/store/shipment/data/models/add_deposit_request_model.dart';
import 'package:fares/features/store/shipment/data/models/create_parcels_request_body.dart';
import 'package:fares/features/store/shipment/data/models/products_response_model.dart';
import 'package:fares/features/store/shipment/data/models/store_collect_request_model.dart';

class ShipmentRepo {
  final ShipmentDataSource _dataSource;

  ShipmentRepo(this._dataSource);

  Future<Either<Failure, void>> createStoreCollects({
    required StoreCollectRequestModel body,
  }) async {
    try {
      await _dataSource.createStoreCollects(body: body);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  Future<Either<Failure, void>> createShipment({
    required CreateParcelsRequestBody body,
    File? image,
  }) async {
    try {
      String? imageUrl;
      if (image != null) {
        final result = await _dataSource.uploadParcelsImage(image: image);
        imageUrl = result.imageUrl;
      }
      body.imagePath = imageUrl;
      await _dataSource.createShipment(body: body);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  Future<Either<Failure, ProductsResponseModel>> getProducts() async {
    try {
      final response = await _dataSource.getProducts();
      return Right(response);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  Future<Either<Failure, void>> addDeposit({
    required AddDepositRequestModel body,
  }) async {
    try {
      await _dataSource.addDeposit(body: body);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
