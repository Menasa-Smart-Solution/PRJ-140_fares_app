import 'dart:async';

import 'package:fares/core/common_ui/widgets/animate_do.dart';
import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';
import 'package:fares/features/store/prices/data/models/city_response_model.dart';
import 'package:fares/features/store/prices/data/models/receipt_response_model.dart';
import 'package:fares/features/store/prices/presentations/cubits/cities_prices/cities_price_cubit.dart';
import 'package:fares/features/store/prices/presentations/cubits/receipts/receipts_cubit.dart';

import '../../../core/utils/exports.dart';

part '../prices/presentations/views/cities_prices_view.dart';
part '../prices/presentations/widgets/cities_prices/cities_prices_header.dart';
part '../prices/presentations/widgets/cities_prices/city_price_card.dart';
part '../prices/presentations/widgets/cities_prices/cities_prices_view_body.dart';
part '../prices/presentations/widgets/cities_prices/cities_prices_list_view.dart';
part '../prices/presentations/widgets/cities_prices/cities_prices_bloc_builder.dart';

part '../prices/presentations/views/collection_settlements_view.dart';
part '../prices/presentations/widgets/collection_settlements/collection_settlements_view_body.dart';
part '../prices/presentations/widgets/collection_settlements/settlement_card.dart';
part '../prices/presentations/widgets/collection_settlements/settlement_header.dart';
part '../prices/presentations/widgets/collection_settlements/value_column.dart';
part '../prices/presentations/widgets/collection_settlements/receipts_bloc_builder.dart';
part '../prices/presentations/widgets/collection_settlements/receipts_list_view.dart';

part '../prices/presentations/views/financial_settlement_view.dart';
part '../prices/presentations/widgets/settlement_details/settlement_info_card.dart';
part '../prices/presentations/widgets/settlement_details/shipment_item_card.dart';
part '../prices/presentations/widgets/settlement_details/shipment_card.dart';
part '../prices/presentations/widgets/settlement_details/financial_settlement_view_body.dart';
part '../prices/presentations/widgets/settlement_details/receipts_details_bloc_builder.dart';
