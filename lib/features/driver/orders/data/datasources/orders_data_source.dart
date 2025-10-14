import 'dart:io';

import 'package:fares/features/driver/orders/data/models/call_images_response.dart';
import 'package:fares/features/driver/orders/data/models/cancel_order_reasons_response.dart';
import 'package:fares/features/driver/orders/data/models/change_order_status_request.dart';
import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';
import 'package:fares/features/driver/orders/data/models/partial_delivery_request.dart';

abstract class OrdersDataSource {
  Future<ParcelsResponseModel> getOrders({
    String? status,
    String? id,
    int? page,
  });

  Future<CallImagesResponse> getCallImages({required int parcelId});

  Future<void> updateOrderStatus({required ChangeOrderStatusRequest body});

  Future<void> partialOrderStatus({required PartialDeliveryRequest body});

  Future<CancelOrderReasonsResponse> reasons();

  Future<void> uploadCallImage({required int parcelId, required File image});
}
