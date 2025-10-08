import 'dart:async';

import 'package:fares/core/helpers/helper_func.dart';
import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';
import 'package:fares/features/driver/orders/presentation/cubit/orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../core/utils/exports.dart';

part 'presentation/views/track_order_view.dart';
part 'presentation/views/all_orders_view.dart';
part 'presentation/views/order_qr_code_view.dart';

part 'presentation/widgets/order_card_item.dart';
part 'presentation/widgets/order_details_widget.dart';

part 'presentation/widgets/track_order/track_order_view_body.dart';
part 'presentation/widgets/track_order/shipment_delivery_failed_bottom_sheet.dart';
part 'presentation/widgets/track_order/bottom_sheet_container.dart';
part 'presentation/widgets/track_order/pending_shipment_delivery_bottom_sheet.dart';
part 'presentation/widgets/track_order/bottom_sheet_actions.dart';
part 'presentation/widgets/track_order/order_price_details_item.dart';
part 'presentation/widgets/track_order/confirm_order_shipping_bottom_sheet.dart';
part 'presentation/widgets/track_order/order_menu.dart';
part 'presentation/widgets/track_order/shipping_status_dropdown.dart';
part 'presentation/widgets/track_order/partial _shipment_delivery_bottom_sheet.dart';

part 'presentation/widgets/order_qrcode/order_qr_code_view_body.dart';

part 'presentation/widgets/orders/all_orders_view_body.dart';
part 'presentation/widgets/orders/orders_list_view.dart';
part 'presentation/widgets/orders/orders_bloc_builder.dart';
part 'presentation/widgets/orders/search_order_text_form_field.dart';
