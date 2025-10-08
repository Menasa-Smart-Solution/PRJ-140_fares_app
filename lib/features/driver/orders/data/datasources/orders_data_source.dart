import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';

abstract class OrdersDataSource {
  Future<ParcelsResponseModel> getOrders({String? status, int? id, int? page});
}
