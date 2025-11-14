class ApiConstants {
  const ApiConstants._();
  static const String login = "/login";
  static const String register = "/register";
  static const String branches = "/branches";
  static const String sendOtp = "/otp/request";
  static const String verifyOtp = "/otp/verify";
  static const String resetPassword = "/otp/reset-password";

  static const String deliverySummary = "/delivery-man/summary";
  static const String parcels = "/delivery-man/parcels";
  static const String callRecords = "/delivery-man/call-records";
  static const String changeStatus =
      "/delivery-man/parcels/multi-change-status";
  static const String partialDelivery = "/delivery-man/partial-delivery";

  static const String chat = "/chats";
  static const String notifications = "/notifications";
  static const String reasons = "/delivery-man/reasons";
  static const String uploadCallImage = "delivery-man/image/{parcelId}";

  static const String conversationMessages = '/chats/{chatId}/messages/store';
  static const String logout = '/logout';
  static const String receiveParcels =
      "delivery-man/flights/{flightId}/receive";
  static const String cities = "/prices";
  static const String receipts = "/receipts";
  static const String receiptDetails = "/receipts/{id}";
  static const String parcelsDetails = "/parcels/{id}";
  static const String parcelsStore = "/parcels";
  static const String collectsStore = "/collects";
  static const String createParcels = "/parcels/store";
  static const String productsStore = "/products";
  static const String contactUs = "/contact";
  static const String privacyPolicy = "/privacy-policy";
  static const String user = "/user";
  static const String tickets = "/tickets";
  static const String storeHome = "/home";
  static const String uploadImage = "/parcels/imageUpload";
  static const String updateParcel = "/parcels/{id}/update";
  static const String deleteParcel = "/parcels/{id}/destroy";
}
