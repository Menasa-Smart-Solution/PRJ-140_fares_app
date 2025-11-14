import 'dart:developer';

import 'package:fares/core/common_ui/widgets/animate_do.dart';
import 'package:fares/core/common_ui/widgets/custom_dropdown_field.dart';
import 'package:fares/core/common_ui/widgets/custom_dropdown_search_list.dart';
import 'package:fares/core/helpers/cache_helper.dart';
import 'package:fares/core/utils/prefs_keys.dart';
import 'package:fares/features/store/parcels/data/models/store_parcels_response_model.dart';
import 'package:fares/features/store/parcels/feature_imports.dart';
import 'package:fares/features/store/prices/data/models/city_response_model.dart';
import 'package:fares/features/store/prices/presentations/cubits/cities_prices/cities_price_cubit.dart';
import 'package:fares/features/store/shipment/data/models/products_response_model.dart';
import 'package:fares/features/store/shipment/presentation/cubit/collects/create_store_collect_cubit.dart';
import 'package:fares/features/store/shipment/presentation/cubit/create_parcels/create_parcels_cubit.dart';
import 'package:fares/features/store/shipment/presentation/cubit/update_parcles/update_parcels_cubit.dart';
import 'package:fares/features/store/shipment/presentation/cubit/update_parcles/update_parcels_state.dart';

import '../../../core/helpers/app_regx.dart';
import '../../../core/utils/exports.dart';

part 'presentation/views/create_shipment_view.dart';
part 'presentation/widgets/create_shipment/create_shipment_view_body.dart';
part 'presentation/widgets/create_shipment/choose_shipment_image.dart';
part 'presentation/widgets/create_shipment/sub_cities.dart';
part 'presentation/widgets/create_shipment/selected_products.dart';

part 'presentation/views/update_parcel_view.dart';
part 'presentation/widgets/update_parcel/update_parcel_view_body.dart';
part 'presentation/widgets/update_parcel/update_parcel_bloc_builder.dart';
part 'presentation/widgets/update_parcel/update_parcel_products.dart';
part 'presentation/widgets/update_parcel/update_parcel_selected_products.dart';
part 'presentation/widgets/update_parcel/update_parcel_sub_cities.dart';
part 'presentation/widgets/update_parcel/update_parcel_cities.dart';
part 'presentation/widgets/update_parcel/update_parcel_image.dart';
part 'presentation/widgets/update_parcel/update_parcel_options.dart';
part 'presentation/widgets/update_parcel/edit_parcel_bloc_listener.dart';

part 'presentation/widgets/create_shipment/shipment_options.dart';
part 'presentation/widgets/create_shipment/create_parcels_cities_bloc_builder.dart';
part 'presentation/widgets/create_shipment/create_parcels_bloc_listener.dart';
part 'presentation/widgets/create_shipment/create_parcels_bloc_builder.dart';
part 'presentation/widgets/create_shipment/create_parcels_products.dart';

part 'presentation/widgets/add_collection_request/collection_request_options.dart';
part 'presentation/widgets/add_collection_request/add_collection_bloc_listener.dart';

part 'presentation/views/add_collection_request_view.dart';
part 'presentation/widgets/add_collection_request/add_collection_request_view_body.dart';

part 'presentation/views/contact_info_view.dart';
part 'presentation/widgets/contact_info/contact_info_header.dart';
part 'presentation/widgets/contact_info/addresses_section.dart';
part 'presentation/widgets/contact_info/address_item.dart';
part 'presentation/widgets/contact_info/phone_numbers_section.dart';
part 'presentation/widgets/contact_info/phone_number_item.dart';

part 'presentation/views/products_view.dart';
part 'presentation/widgets/products/product_item_widget.dart';
part 'presentation/widgets/products/products_list_view.dart';
part 'presentation/widgets/products/products_bloc_builder.dart';
