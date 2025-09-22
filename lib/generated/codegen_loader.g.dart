// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _ar = {
  "trackingTitle": "تتبع حالة \nشحناتك \nوانت في مكانك",
  "deliverySubtitle": "التسليم في متناول يدك.",
  "startNow": "ابدأ الان",
  "appName": "فارس",
  "forDelivery": "للتوصيل",
  "createAccount": "انشاء حساب",
  "login": "تسجيل الدخول",
  "welcomeMessage": "مرحبا بك 👋",
  "emailPhoneHint": "ادخل البريد او رقم الجوال",
  "emailPhoneLabel": "البريد الالكتروني او رقم الجوال",
  "passwordLabel": "كلمة المرور",
  "passwordHint": "ادخل كلمة المرور",
  "forgotPassword": "نسيت كلمة المرور؟",
  "dontHaveAccount": " ليس لديك حساب؟",
  "loginWelcome": "مرحباً بك مرة أخرى، لقد افتقدناك!",
  "createNewAccount": "إنشاء حساب جديد",
  "registerSubtitle": "انضم إلينا وابدأ رحلتك معنا بخطوات سهلة وسريعة",
  "nameHint": "ادخل الاسم",
  "fullNameLabel": "الاسم بالكامل",
  "confirmPasswordLabel": "تاكيد كلمة المرور",
  "alreadyHaveAccount": "لديك حساب بالفعل؟",
  "dontReceiveCode": "لم تستقبل الرمز؟ ",
  "resendCode": "إعادة الإرسال",
  "resendIn": "إعادة الإرسال خلال  {seconds} ثانية",
  "pleaseEnterverificationCode": "يرجى إدخال رمز التحقق",
  "verificationCodeLengthValidation": "يجب أن يتكون الرمز من 6 أرقام"
};
static const Map<String,dynamic> _en = {};
static const Map<String, Map<String,dynamic>> mapLocales = {"ar": _ar, "en": _en};
}
