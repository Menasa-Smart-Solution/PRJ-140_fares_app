import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fares/core/network/api_constants.dart';
import 'package:fares/features/auth/data/models/auth_request_model.dart';
import 'package:fares/features/auth/data/models/auth_response_model.dart';
import 'package:fares/features/auth/data/models/branches_response_model.dart';
import 'package:fares/features/auth/data/models/message_response_model.dart';
import 'package:fares/features/auth/data/models/register_request_model.dart';
import 'package:fares/features/auth/data/models/register_response_model.dart';
import 'package:fares/features/auth/data/models/send_otp_request_model.dart';
import 'package:fares/features/auth/data/models/verify_otp_request_model.dart';
import 'package:fares/features/driver/chat/data/models/conversation_messages_response_model.dart';
import 'package:fares/features/driver/chat/data/models/conversations_response_model.dart';
import 'package:fares/features/driver/chat/data/models/send_message_request_model.dart';
import 'package:fares/features/driver/home/data/models/notifications_response_model.dart';
import 'package:fares/features/driver/orders/data/models/call_images_response.dart';
import 'package:fares/features/driver/orders/data/models/cancel_order_reasons_response.dart';
import 'package:fares/features/driver/orders/data/models/change_order_status_request.dart';
import 'package:fares/features/driver/orders/data/models/parcels_response_model.dart';
import 'package:fares/features/driver/home/data/models/summary_response_model.dart';
import 'package:fares/features/driver/orders/data/models/partial_delivery_request.dart';
import 'package:fares/features/profile/data/models/user_response_model.dart';
import 'package:fares/features/store/app_info/data/models/contact_us_response_model.dart';
import 'package:fares/features/store/app_info/data/models/privacy_policy_response_model.dart';
import 'package:fares/features/store/home/data/models/create_ticket_request_model.dart';
import 'package:fares/features/store/home/data/models/store_home_response_model.dart';
import 'package:fares/features/store/home/data/models/tickets_response_models.dart';
import 'package:fares/features/store/parcels/data/models/store_parcels_details_response_model.dart';
import 'package:fares/features/store/parcels/data/models/store_parcels_response_model.dart';
import 'package:fares/features/store/prices/data/models/city_response_model.dart';
import 'package:fares/features/store/prices/data/models/receipt_details_response_model.dart';
import 'package:fares/features/store/prices/data/models/receipt_response_model.dart';
import 'package:fares/features/store/shipment/data/models/add_deposit_request_model.dart';
import 'package:fares/features/store/shipment/data/models/products_response_model.dart';
import 'package:fares/features/store/shipment/data/models/store_collect_request_model.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/auth/data/models/reset_password_request_model.dart';
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

  @GET(ApiConstants.notifications)
  Future<NotificationsResponseModel> getNotifications({
    @Query('page') int page = 1,
    @Query('per_page') int perPage = 10,
  });

  @POST(ApiConstants.uploadCallImage)
  @MultiPart()
  Future<void> uploadCallImage({
    @Path('parcelId') required int parcelId,
    @Part() required File image,
  });

  @POST(ApiConstants.resetPassword)
  Future<MessageResponseModel> resetPassword(
    @Body() ResetPasswordRequestModel body,
  );
  @POST(ApiConstants.verifyOtp)
  Future<MessageResponseModel> verifyOtp(@Body() VerifyOtpRequestModel body);
  @POST(ApiConstants.sendOtp)
  Future<MessageResponseModel> sendOtp({
    @Body() required SendOtpRequestModel body,
  });
  @POST(ApiConstants.register)
  Future<RegisterResponseModel> register(@Body() RegisterRequestModel body);
  @GET(ApiConstants.branches)
  Future<BranchesResponseModel> getBranches();

  @GET(ApiConstants.cities)
  Future<CityResponseModel> getCities();

  @GET(ApiConstants.receipts)
  Future<ReceiptResponseModel> getReceipts({@Query('page') int page = 1});
  @GET(ApiConstants.receiptDetails)
  Future<ReceiptDetailsResponseModel> getReceiptDetails({
    @Path('id') required int id,
  });

  @GET(ApiConstants.parcelsStore)
  Future<StoreParcelsResponseModel> getStoreParcels({
    @Query('status') String? status,
    @Query('query') String? id,
    @Query('page') int? page,
  });

  @GET(ApiConstants.parcelsDetails)
  Future<StoreParcelsDetailsResponseModel> getStoreParcelDetails({
    @Path('id') required int id,
  });

  @POST(ApiConstants.collectsStore)
  Future<void> createStoreCollects({
    @Body() required StoreCollectRequestModel body,
  });
  @POST(ApiConstants.createParcels)
  Future<void> createParcels({@Body() required FormData body});

  @GET(ApiConstants.productsStore)
  Future<ProductsResponseModel> getProducts();

  @POST(ApiConstants.createParcels)
  Future<void> addDeposit({@Body() required AddDepositRequestModel body});

  @GET(ApiConstants.contactUs)
  Future<ContactUsResponseModel> getContactUsInfo();

  @GET(ApiConstants.privacyPolicy)
  Future<PrivacyPolicyResponseModel> getPrivacyPolicyInfo();

  @GET(ApiConstants.user)
  Future<UserResponseModel> getUserInfo();

  @GET(ApiConstants.tickets)
  Future<TicketsResponseModels> getTickets();

  @POST(ApiConstants.tickets)
  Future<void> createTickets({@Body() required CreateTicketRequestModel body});

  @GET(ApiConstants.storeHome)
  Future<StoreHomeResponseModel> getStoreHome();
}
