import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:soupmarket_sdk/config/soup_market_config.dart';
import 'package:soupmarket_sdk/service/sdk_service_request.dart';
import 'package:soupmarket_sdk/service/sdk_service_response.dart';
import 'package:soupmarket_sdk/utils/const_api_urls.dart';

class SoupMarketSDK {
  static final SoupMarketSDK instance = SoupMarketSDK._internal();
  late final SoupMarketConfig _config;
  late final SDKServiceRequest _sdkServiceRequest;
  late final Dio _dio;

  SoupMarketSDK._internal();

  void initialize(SoupMarketConfig config) {
    _config = config;
    _sdkServiceRequest = SDKServiceRequest()
      ..initialize(
        baseUrl: config.environment.baseUrl,
        apiKey: config.apiKey,
        apiSecret: config.apiSecret,
        headers: config.additionalHeaders,
        timeout: config.timeout.inMilliseconds,
      );
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> clientRegister({Map<String, dynamic>? map}) async {
    FormData formData = FormData.fromMap(map!);
    return _sdkServiceRequest.post<Map<String, dynamic>>(
      endpoint: CLIENT_REGISTER,
      data: formData
    );
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> clientAccountService({String? contact}) async {
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get<Map<String, dynamic>>(
      endpoint: "${CLIENT_ACCOUNT_SERVICE+contact!}.json",
      queryParameters: queryParameters
    );
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> searchPinResetQuestion({String? searchWord, String? contact}) async {
    final queryParameters = {
      'contact': contact,
    };
    String endpoint = SEARCH_PIN_RESET_QUESTION+".json?search="+searchWord!;
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  // Future<SDKServiceResponse<Map<String, dynamic>>> pinResetQuestion(String searchWord) async {
  //   String endpoint = PIN_RESET_QUESTION+"?search="+searchWord;
  //   return _sdkServiceRequest.get(endpoint: endpoint);
  // }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualBasicInformation({String? id, String? contact}) async {
    final queryParameters = {
      'contact': contact,
    };
    String endpoint = INDIVIDUAL_BASIC_INFORMATION_SHOW+"${id}.json";
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> allIndividualList({String? id, String? contact}) async {
    String endpoint = ALL_INDIVIDUAL+"${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualBasicInformationSave({Map<String, dynamic>? data}) async {
    String endpoint = INDIVIDUAL_BASIC_INFORMATION_SAVE+".json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualBasicInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_BASIC_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualIdentityInformationShow({String? id, String? contact}) async {
    String endpoint = "${INDIVIDUAL_IDENTITY_INFORMATION_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualIdentityInformationSave({Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_IDENTITY_INFORMATION_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualIdentityInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_IDENTITY_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualAddressInformationShow({String? id, String? contact}) async {
    String endpoint = "${INDIVIDUAL_ADDRESS_INFORMATION_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualAddressInformationSave({Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_ADDRESS_INFORMATION_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualAddressInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_ADDRESS_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualEmploymentInformationShow({String? id, String? contact}) async {
    String endpoint = "${INDIVIDUAL_EMPLOYMENT_INFORMATION_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualEmploymentInformationSave({Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_EMPLOYMENT_INFORMATION_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualEmploymentInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_EMPLOYMENT_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individuaFatcaInformationShow({String? id, String? contact}) async {
    String endpoint = "${INDIVIDUAL_USA_FATCA_INFORMATION_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individuaFatcaInformationSave({Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_USA_FATCA_INFORMATION_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individuaFatcaInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_USA_FATCA_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualNextOfKinInformationShow({String? id, String? contact}) async {
    String endpoint = "${INDIVIDUAL_NEXT_OF_KIN_INFORMATION_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualNextOfKinInformationSave({Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_NEXT_OF_KIN_INFORMATION_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualNextOfKinInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_NEXT_OF_KIN_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  ////////////////////////Order Management//////////////

  Future<SDKServiceResponse<Map<String, dynamic>>> fundsUnderManagement({String? contact}) async {
    String endpoint = "${FUND_UNDER_MANAGEMENT}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> orderRequestStatus({String? id, String? contact}) async {
    String endpoint = "${ORDER_REQUEST_STATUS}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> createOrderRequest({Map<String, dynamic>? data}) async {
    String endpoint = "${CREATE_ORDER_REQUEST}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> custodyStatement({Map<String, dynamic>? data}) async {
    String endpoint = "${CLIENT_CUSTODY_STATEMENT}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> orderRequestHistory({Map<String, dynamic>? data}) async {
    String endpoint = "${ORDER_REQUEST_HISTORY}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> saveAccountServices({Map<String, dynamic>? data}) async {
    String endpoint = "${SAVE_ACCOUNT_SERVICE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> updateAccountServices({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${UPDATE_ACCOUNT_SERVICE}.json";
    FormData formData = FormData.fromMap(data!);
    formData.fields.add(MapEntry("id", id!));
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> checkDepositProcess({@required String? contact}) async {
    String endpoint = "${CHECK_DEPOSIT_AND_WITHDRAWAL_PROCESS}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  /***PIN MANAGEMENT****/
  Future<SDKServiceResponse<Map<String, dynamic>>> getPinResetQuestions({int max = 100, String? contact}) async {
    String endpoint = "${PIN_RESET_QUESTIONS}.json?max=${max}";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> requestPinReset({String? contact}) async {
    String endpoint = "${REQUEST_PIN_RESET}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> savePinReset({Map<String, dynamic>? data}) async {
    String endpoint = "${REQUEST_PIN_RESET}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> confirmResetPin({Map<String, dynamic>? data}) async {
    String endpoint = "${CONFIRM_PIN_RESET}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> changePin({Map<String, dynamic>? data}) async {
    String endpoint = "${CHANGE_PIN_RESET}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> createPin({Map<String, dynamic>? data}) async {
    String endpoint = "${CREATE_PIN_RESET}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  /**Security & Asset management**/
  Future<SDKServiceResponse<Map<String, dynamic>>> createSecuritySubTypeAssetAllocation({Map<String, dynamic>? data}) async {
    String endpoint = "${CREATE_SECURITY_SUB_TYPE_ASSET_ALLOCATION}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> etSecurityFlow({String? security, String? contact}) async {
    String endpoint = "${SECURITY_FLOWS}.json?security=${security}";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> createSecurityAssetAllocation({Map<String, dynamic>? data}) async {
    String endpoint = "${SECURITY_ASSET_ALLOCATION}.json";;
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> smsNumber({String? smsNumber, String? smsContent}) async {
    String endpoint = "${SEND_SMS_MESSAGE}.json${smsNumber}&smsContent=${smsContent}";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> annualGrossIncome({int maxPage = 100}) async {
    String endpoint = "${LOAD_ALL_ANNUAL_GROSS_INCOME}.json?max=$maxPage";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> monthlyGrossIncome({int maxPage = 100}) async {
    String endpoint = "${LOAD_ALL_MONTHLY_INCOME}.json?max=${maxPage}";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> clientIndustry({int maxPage = 100}) async {
    String endpoint = "${CLIENT_INDUSTRY}.json?max=${maxPage}";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> enumUtility({int maxPage = 100}) async {
    String endpoint = "${LOAD_ENUM_UTILITIES}.json?max=${maxPage}";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> annualTurnOver({int maxPage = 100}) async {
    String endpoint = "${LOAD_ANNUAL_TURN_OVER}.json?max=${maxPage}";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> saveClientBankDetails({Map<String, dynamic>? data}) async {
    String endpoint = "${SAVE_CLIENT_BANK_DETAILS}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> updateClientBankDetails({Map<String, dynamic>? data, @required String? id}) async {
    String endpoint = "${UPDATE_CLIENT_BANK_DETAILS}.json?id=${id}";
    FormData formData = FormData.fromMap(data!);
    formData.fields.add(MapEntry("id", id!));
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }
}