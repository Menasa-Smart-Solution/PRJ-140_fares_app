import 'dart:async';

import 'package:fares/core/common_ui/widgets/custom_empty_widget.dart';
import 'package:fares/core/common_ui/widgets/custom_error_widget.dart';
import 'package:fares/core/helpers/cache_helper.dart';
import 'package:fares/core/helpers/helper_func.dart';
import 'package:fares/core/utils/app_logger.dart';
import 'package:fares/core/utils/prefs_keys.dart';
import 'package:fares/features/driver/chat/data/models/conversation_messages_response_model.dart';
import 'package:fares/features/driver/chat/data/models/conversations_response_model.dart';
import 'package:fares/features/driver/chat/data/models/send_message_request_model.dart';
import 'package:fares/features/driver/chat/presentation/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';
import '../../../core/common_ui/widgets/internet_connection_widget.dart';
import '../../../core/helpers/dummy_data.dart';
import '../../../core/utils/exports.dart';

part 'presentation/views/conversations_view.dart';
part 'presentation/widgets/conversations/conversations_view_body.dart';
part 'presentation/widgets/conversations/conversations_list_view_body.dart';
part 'presentation/widgets/conversations/conversations_bloc_builder.dart';
part 'presentation/widgets/conversations/empty_conversations.dart';
part 'presentation/widgets/conversations/conversation_item.dart';
part 'presentation/widgets/conversations/conversations_loading_shimmer.dart';

part 'presentation/views/chat_view.dart';
part 'presentation/widgets/chat/chat_view_body.dart';
part 'presentation/widgets/chat/send_message_form_field.dart';
part 'presentation/widgets/chat/message_item.dart';
part 'presentation/widgets/chat/chat_list_view_item.dart';
