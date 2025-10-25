import 'package:fares/features/store/shipment/data/models/add_deposit_request_model.dart';
import 'package:fares/features/store/shipment/data/models/create_parcels_request_body.dart';
import 'package:fares/features/store/shipment/data/models/products_response_model.dart';
import 'package:fares/features/store/shipment/data/models/store_collect_request_model.dart';

abstract class ShipmentDataSource {
  Future<void> createStoreCollects({required StoreCollectRequestModel body});
  Future<void> createShipment({required CreateParcelsRequestBody body});
  Future<ProductsResponseModel> getProducts();
  Future<void> addDeposit({required AddDepositRequestModel body});
}
