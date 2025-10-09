import 'package:fares/features/driver/orders/data/models/call_images_response.dart';
import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';

abstract class OrdersDataSource {
  Future<ParcelsResponseModel> getOrders({
    String? status,
    String? id,
    int? page,
  });

  Future<CallImagesResponse> getCallImages({required int parcelId});
}
