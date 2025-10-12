import 'package:dio/dio.dart';
import 'package:fares/core/network/api_constants.dart';
import 'package:fares/features/auth/data/models/auth_request_model.dart';
import 'package:fares/features/auth/data/models/auth_response_model.dart';
import 'package:fares/features/driver/chat/data/models/conversation_messages_response_model.dart';
import 'package:fares/features/driver/chat/data/models/conversations_response_model.dart';
import 'package:fares/features/driver/chat/data/models/send_message_request_model.dart';
import 'package:fares/features/driver/orders/data/models/call_images_response.dart';
import 'package:fares/features/driver/orders/data/models/cancel_order_reasons_response.dart';
import 'package:fares/features/driver/orders/data/models/change_order_status_request.dart';
import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';
import 'package:fares/features/driver/home/data/models/summary_response_model.dart';
import 'package:fares/features/driver/orders/data/models/partial_delivery_request.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<AuthResponseModel> login(@Body() LoginRequestModel body);

  @GET(ApiConstants.deliverySummary)
  Future<SummaryResponseModel> getAllSummary();

  @GET(ApiConstants.parcels)
  Future<ParcelsResponseModel> getParcels({
    @Query('status') String? status,
    @Query('query') String? id,
    @Query('page') int? page,
  });

  @GET('${ApiConstants.callRecords}/{parcel_id}')
  Future<CallImagesResponse> getCallImages({
    @Path('parcel_id') required int parcelId,
  });

  @POST(ApiConstants.changeStatus)
  Future<void> changeStatus({@Body() required ChangeOrderStatusRequest body});

  @POST(ApiConstants.partialDelivery)
  Future<void> partialDelivery({@Body() required PartialDeliveryRequest body});

  @GET(ApiConstants.chat)
  Future<ConversationsResponseModel> getConversations();

  @GET('${ApiConstants.chat}/{parcel_id}')
  Future<ConversationMessagesResponseModel> getConversationMessages(
    @Path('parcel_id') int parcelId,
  );

  @POST(ApiConstants.conversationMessages)
  Future<ConversationMessagesResponseModel> sendMessage({
    @Path('chatId') required String chatId,
    @Body() required SendMessageRequestModel body,
  });

  @POST(ApiConstants.logout)
  Future<void> logOut();

  @POST(ApiConstants.receiveParcels)
  Future<void> receiveParcels(@Path('flightId') String flightId);

  @GET(ApiConstants.reasons)
  Future<CancelOrderReasonsResponse> getCancelOrderReasons();
}
