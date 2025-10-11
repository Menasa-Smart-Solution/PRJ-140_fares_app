import 'dart:async';

import 'package:fares/core/common_ui/widgets/custom_cached_image.dart';
import 'package:fares/core/common_ui/widgets/custom_empty_widget.dart';
import 'package:fares/core/common_ui/widgets/internet_connection_widget.dart';
import 'package:fares/core/helpers/helper_func.dart';
import 'package:fares/core/helpers/show_snackbar.dart';
import 'package:fares/core/utils/app_logger.dart';
import 'package:fares/features/driver/orders/data/models/call_images_response.dart';
import 'package:fares/features/driver/orders/data/models/change_order_status_request.dart';
import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';
import 'package:fares/features/driver/orders/data/models/partial_delivery_request.dart';
import 'package:fares/features/driver/orders/presentation/cubit/call_records/call_records_cubit.dart';
import 'package:fares/features/driver/orders/presentation/cubit/order_operation/order_operation_cubit.dart';
import 'package:fares/features/driver/orders/presentation/cubit/order_operation/order_operation_state.dart';
import 'package:fares/features/driver/orders/presentation/cubit/orders/orders_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';
import '../../../core/utils/exports.dart';

part 'presentation/views/track_order_view.dart';
part 'presentation/views/all_orders_view.dart';
part 'presentation/views/order_qr_code_view.dart';

part 'presentation/widgets/order_card_item.dart';
part 'presentation/widgets/order_details_widget.dart';

part 'presentation/widgets/track_order/track_order_view_body.dart';
part 'presentation/widgets/track_order/change_status_bloc_listener.dart';
part 'presentation/widgets/track_order/under_review_bottom_sheet.dart';
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

part 'presentation/views/call_logs_view.dart';
part 'presentation/widgets/call_logs/call_logs_view_body.dart';
part 'presentation/widgets/call_logs/call_logs_bloc_builder.dart';
part 'presentation/widgets/call_logs/call_logs_images_list_view.dart';
