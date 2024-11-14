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

  Future<SDKServiceResponse<dynamic>> authenticate({Map<String, dynamic>? data}) async {
    String endpoint = CLIENT_AUTHENTICATE+".json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> saveClientRegister({Map<String, dynamic>? map}) async {
    FormData formData = FormData.fromMap(map!);
    return _sdkServiceRequest.post<Map<String, dynamic>>(
      endpoint: "${CLIENT_REGISTER}.json",
      data: formData
    );
  }

  Future<SDKServiceResponse<dynamic>> getClientAccountService({String? contact}) async {
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get<Map<String, dynamic>>(
      endpoint: "${CLIENT_ACCOUNT_SERVICE}.json",
      queryParameters: queryParameters
    );
  }

  Future<SDKServiceResponse<dynamic>> searchPinResetQuestion({String? searchWord, String? contact}) async {
    final queryParameters = {
      'contact': contact,
    };
    String endpoint = SEARCH_PIN_RESET_QUESTION+".json?search="+searchWord!;
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  // Future<SDKServiceResponse<dynamic>> pinResetQuestion(String searchWord) async {
  //   String endpoint = PIN_RESET_QUESTION+"?search="+searchWord;
  //   return _sdkServiceRequest.get(endpoint: endpoint);
  // }

  Future<SDKServiceResponse<dynamic>> getIndividualBasicInformation({String? id, String? contact}) async {
    final queryParameters = {
      'contact': contact,
    };
    String endpoint = INDIVIDUAL_BASIC_INFORMATION_SHOW+"${id}.json";
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> getAllIndividualList({String? id, String? contact}) async {
    String endpoint = "${ALL_INDIVIDUAL}.json";
    final queryParameters = {
      'contact': contact,
      'id': id,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> individualBasicInformationSave({Map<String, dynamic>? data}) async {
    String endpoint = INDIVIDUAL_BASIC_INFORMATION_SAVE+".json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualBasicInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_BASIC_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualIdentityInformationShow({String? id, String? contact}) async {
    String endpoint = "${INDIVIDUAL_IDENTITY_INFORMATION_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> individualIdentityInformationSave({Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_IDENTITY_INFORMATION_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualIdentityInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_IDENTITY_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualAddressInformationShow({String? id, String? contact}) async {
    String endpoint = "${INDIVIDUAL_ADDRESS_INFORMATION_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> individualAddressInformationSave({Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_ADDRESS_INFORMATION_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualAddressInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_ADDRESS_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualEmploymentInformationShow({String? id, String? contact}) async {
    String endpoint = "${INDIVIDUAL_EMPLOYMENT_INFORMATION_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> individualEmploymentInformationSave({Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_EMPLOYMENT_INFORMATION_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualEmploymentInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_EMPLOYMENT_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individuaFatcaInformationShow({String? id, String? contact}) async {
    String endpoint = "${INDIVIDUAL_USA_FATCA_INFORMATION_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> individuaFatcaInformationSave({Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_USA_FATCA_INFORMATION_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individuaFatcaInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_USA_FATCA_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualNextOfKinInformationShow({String? id, String? contact}) async {
    String endpoint = "${INDIVIDUAL_NEXT_OF_KIN_INFORMATION_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> individualNextOfKinInformationSave({Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_NEXT_OF_KIN_INFORMATION_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualNextOfKinInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_NEXT_OF_KIN_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualRiskAssessmentShow({String? id, String? contact}) async {
    String endpoint = "${INDIVIDUAL_RISK_ASSESSMENT_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> individualRiskAssessmentSave({Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_RISK_ASSESSMENT_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualRiskAssessmentUpdate({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${INDIVIDUAL_RISK_ASSESSMENT_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  ////////////////////////Order Management//////////////

  // Future<SDKServiceResponse<dynamic>> fundsUnderManagement({String? contact, Map<String, dynamic>? filter}) async {
  Future<SDKServiceResponse<dynamic>> fundsUnderManagement({String? contact, Map<String, dynamic>? filter}) async {
    String endpoint = "${FUND_UNDER_MANAGEMENT}.json";
    final queryParameters = {
      'contact': contact,
      "enableFundManagement": true,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> orderRequestStatus({String? id, String? contact}) async {
    String endpoint = "${ORDER_REQUEST_STATUS}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> createOrderRequest({Map<String, dynamic>? data}) async {
    String endpoint = "${CREATE_ORDER_REQUEST}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> custodyStatement({Map<String, dynamic>? data}) async {
    String endpoint = "${CLIENT_CUSTODY_STATEMENT}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> orderRequestHistory({Map<String, dynamic>? data}) async {
    String endpoint = "${ORDER_REQUEST_HISTORY}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> saveAccountServices({Map<String, dynamic>? data}) async {
    String endpoint = "${SAVE_ACCOUNT_SERVICE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> updateAccountServices({String? id, Map<String, dynamic>? data}) async {
    String endpoint = "${UPDATE_ACCOUNT_SERVICE}.json";
    FormData formData = FormData.fromMap(data!);
    formData.fields.add(MapEntry("id", id!));
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> checkDepositProcess({@required String? contact}) async {
    String endpoint = "${CHECK_DEPOSIT_AND_WITHDRAWAL_PROCESS}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  /***PIN MANAGEMENT****/
  Future<SDKServiceResponse<dynamic>> getPinResetQuestions({int max = 100, String? contact}) async {
    String endpoint = "${PIN_RESET_QUESTIONS}.json?max=${max}";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> requestPinReset({String? contact}) async {
    String endpoint = "${REQUEST_PIN_RESET}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> savePinReset({Map<String, dynamic>? data}) async {
    String endpoint = "${REQUEST_PIN_RESET}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> confirmResetPin({Map<String, dynamic>? data}) async {
    String endpoint = "${CONFIRM_PIN_RESET}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> changePin({Map<String, dynamic>? data}) async {
    String endpoint = "${CHANGE_PIN_RESET}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> createPin({Map<String, dynamic>? data}) async {
    String endpoint = "${CREATE_PIN_RESET}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  /**Security & Asset management**/
  Future<SDKServiceResponse<dynamic>> createSecuritySubTypeAssetAllocation({Map<String, dynamic>? data}) async {
    String endpoint = "${CREATE_SECURITY_SUB_TYPE_ASSET_ALLOCATION}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> getSecurityFlow({String? contact, Map<String, dynamic>? filter}) async {
    String endpoint = "${SECURITY_FLOWS}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> createSecurityAssetAllocation({Map<String, dynamic>? data}) async {
    String endpoint = "${SECURITY_ASSET_ALLOCATION}.json";;
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> smsNumber({String? smsNumber, String? smsContent}) async {
    String endpoint = "${SEND_SMS_MESSAGE}.json";
    final queryParameters = {
      'smsNumber': smsNumber,
      'smsContent': smsContent,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<dynamic>> annualGrossIncome({int maxPage = 100}) async {
    String endpoint = "${LOAD_ALL_ANNUAL_GROSS_INCOME}.json?max=$maxPage";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<dynamic>> monthlyGrossIncome({int maxPage = 100}) async {
    String endpoint = "${LOAD_ALL_MONTHLY_INCOME}.json?max=${maxPage}";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<dynamic>> clientIndustry({int maxPage = 100}) async {
    String endpoint = "${CLIENT_INDUSTRY}.json?max=${maxPage}";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<dynamic>> enumUtility({int maxPage = 100}) async {
    String endpoint = "${LOAD_ENUM_UTILITIES}.json?max=${maxPage}";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<dynamic>> annualTurnOver({int maxPage = 100}) async {
    String endpoint = "${LOAD_ANNUAL_TURN_OVER}.json?max=${maxPage}";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<dynamic>> saveClientBankDetails({Map<String, dynamic>? data}) async {
    String endpoint = "${SAVE_CLIENT_BANK_DETAILS}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> updateClientBankDetails({Map<String, dynamic>? data, @required String? id}) async {
    String endpoint = "${UPDATE_CLIENT_BANK_DETAILS}.json?id=${id}";
    FormData formData = FormData.fromMap(data!);
    formData.fields.add(MapEntry("id", id!));
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> getCustodyStatement({Map<String, dynamic>? filter, @required String? contact}) async {
    String endpoint = "${CUSTODY_STATEMENT}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> getTransactionStatement({Map<String, dynamic>? filter, @required String? contact}) async {
    String endpoint = "${TRANSACTION_STATEMENT}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> downloadCustodyStatement({Map<String, dynamic>? filter, @required String? contact, @required String? saveLocation}) async {
    String endpoint = "${CUSTODY_STATEMENT}.pdf";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.download(endpoint: endpoint, savePath: saveLocation!);
  }

  Future<SDKServiceResponse<dynamic>> downloadTransactionStatement({Map<String, dynamic>? filter, @required String? contact}) async {
    String endpoint = "${TRANSACTION_STATEMENT}.pdf";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> downloadSoupLink({Map<String, dynamic>? filter, @required String? contact}) async {
    String endpoint = "${DOWNLOAD_LINK_SOUPLINK}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> showClientEmergencyContact({String? id, String? contact}) async {
    String endpoint = "${SHOW_CLIENT_EMERGENCY_CONTACT}$id.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> saveClientEmergencyContact({Map<String, dynamic>? data}) async {
    String endpoint = "${SAVE_CLIENT_EMERGENCY_CONTACT}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> updateClientEmergencyContact({Map<String, dynamic>? data, @required String? id}) async {
    String endpoint = "${UPDATE_CLIENT_EMERGENCY_CONTACT}/${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> loadAllRiskAssessmentQuestions({String? contact, Map<String, dynamic>? filter}) async {
    String endpoint = "${LOAD_ALL_RISK_ASSESSMENT_QUESTIONS}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> loadAllRiskAssessmentAnswers({String? contact, Map<String, dynamic>? filter}) async {
    String endpoint = "${LOAD_ALL_RISK_ASSESSMENT_ANSWERS}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

}