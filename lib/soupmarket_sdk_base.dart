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

  SoupMarketSDK._internal();

  void initialize(SoupMarketConfig config) {
    _config = config;
    _sdkServiceRequest = SDKServiceRequest()
      ..initialize(
        // baseUrl: config.environment.baseUrl,
        baseUrl: config.baseUrl,
        apiKey: config.apiKey,
        apiSecret: config.apiSecret,
        headers: config.additionalHeaders,
        timeout: config.timeout.inMilliseconds,
      );
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> authenticate({Map<String, dynamic>? data}) async {
    String endpoint = CLIENT_AUTHENTICATE+".json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> saveClientRegister({Map<String, dynamic>? map}) async {
    FormData formData = FormData.fromMap(map!);
    return _sdkServiceRequest.post<Map<String, dynamic>>(
      endpoint: "${CLIENT_REGISTER}.json",
      data: formData
    );
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> getClientAccountService({String? contact}) async {
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

  Future<SDKServiceResponse<Map<String, dynamic>>> getIndividualBasicInformation({String? id, String? contact}) async {
    final queryParameters = {
      'contact': contact,
    };
    String endpoint = INDIVIDUAL_BASIC_INFORMATION_SHOW+"${id}.json";
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> getAllIndividualList({String? id, String? contact}) async {
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

  Future<SDKServiceResponse<Map<String, dynamic>>> individualRiskAssessmentShow({String? id, String? contact}) async {
    String endpoint = "${INDIVIDUAL_RISK_ASSESSMENT_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualRiskAssessmentSave({Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_RISK_ASSESSMENT_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> individualRiskAssessmentUpdate({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_RISK_ASSESSMENT_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  ////////////////////////Order Management//////////////

  Future<SDKServiceResponse<Map<String, dynamic>>> fundsUnderManagement({String? contact, Map<String, dynamic>? filter}) async {
    String endpoint = "${FUND_UNDER_MANAGEMENT}.json";
    final queryParameters = {
      'contact': contact,
      "enableFundManagement": true,
      ...?filter
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

  Future<SDKServiceResponse<Map<String, dynamic>>> getSecurityFlow({String? contact, Map<String, dynamic>? filter}) async {
    String endpoint = "${SECURITY_FLOWS}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> createSecurityAssetAllocation({Map<String, dynamic>? data}) async {
    String endpoint = "${SECURITY_ASSET_ALLOCATION}.json";;
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> smsNumber({String? smsNumber, String? smsContent}) async {
    String endpoint = "${SEND_SMS_MESSAGE}.json";
    final queryParameters = {
      'smsNumber': smsNumber,
      'smsContent': smsContent,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
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

  Future<SDKServiceResponse<Map<String, dynamic>>> getCustodyStatement({Map<String, dynamic>? filter, @required String? contact}) async {
    String endpoint = "${CUSTODY_STATEMENT}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> getTransactionStatement({Map<String, dynamic>? filter, @required String? contact}) async {
    String endpoint = "${TRANSACTION_STATEMENT}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> downloadSoupLink({Map<String, dynamic>? filter, @required String? contact}) async {
    String endpoint = "${DOWNLOAD_LINK_SOUPLINK}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> showClientEmergencyContact({String? contact}) async {
    String endpoint = "${SHOW_CLIENT_EMERGENCY_CONTACT}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> saveClientEmergencyContact({Map<String, dynamic>? data}) async {
    String endpoint = "${SAVE_CLIENT_EMERGENCY_CONTACT}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> updateClientEmergencyContact({Map<String, dynamic>? data, @required String? id}) async {
    String endpoint = "${UPDATE_CLIENT_EMERGENCY_CONTACT}/${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> loadAllRiskAssessmentQuestions({String? contact, Map<String, dynamic>? filter}) async {
    String endpoint = "${LOAD_ALL_RISK_ASSESSMENT_QUESTIONS}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<Map<String, dynamic>>> loadAllRiskAssessmentAnswers({String? contact, Map<String, dynamic>? filter}) async {
    String endpoint = "${LOAD_ALL_RISK_ASSESSMENT_ANSWERS}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

}