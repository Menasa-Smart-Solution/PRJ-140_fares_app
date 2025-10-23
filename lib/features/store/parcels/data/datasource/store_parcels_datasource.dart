import 'package:fares/features/store/parcels/data/models/store_parcels_details_response_model.dart';
import 'package:fares/features/store/parcels/data/models/store_parcels_response_model.dart';

abstract class StoreParcelsDataSource {
  Future<StoreParcelsResponseModel> getStoreParcels({
    String? status,
    String? id,
    int? page,
  });
  Future<StoreParcelsDetailsResponseModel> getStoreParcelDetails(int id);
}
