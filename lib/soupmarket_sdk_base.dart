import 'package:dio/dio.dart';
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


  Future<SDKServiceResponse<Map<String, dynamic>>> pinResetQuestion(String searchWord) async {
    String endpoint = SEARCH_PIN_RESET_QUESTION+"?search="+searchWord;

    return _sdkServiceRequest.get(endpoint: endpoint);
  }

//TODO
// COMPLETE ALL THE SERVICE CALLS THAT THE API MAKES. FOLLOW THE COMMENTED LINES BELOW FOR MORE INSIGHT

  /*public SoupMarketApiResponseService findClientAccountServicesByContact(String contact) throws IOException {
  String endpoint = "${CLIENT_ACCOUNT_SERVICE+contact}.json"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService findIndividualBasicInfoById(String id) throws IOException {
  String endpoint = INDIVIDUAL_BASIC_INFORMATION_SHOW+"${id}.json"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService allIndividualList(String id) throws IOException {
  String endpoint = ALL_INDIVIDUAL+"${id}.json"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService saveIndividualBasicInfo(Map data) throws IOException {
  String endpoint = INDIVIDUAL_BASIC_INFORMATION_SAVE
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService updateIndividualBasicInfo(String id, Map data) throws IOException {
  String endpoint = "${INDIVIDUAL_BASIC_INFORMATION_UPDATE}${id}.json"
  return new SoupMarketApiResponseService(soupBrokerApiClient.put(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService showIndividualIdentityInfo(String id) throws IOException {
  String endpoint = "${INDIVIDUAL_IDENTITY_INFORMATION_SHOW}${id}.json"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService saveIndividualIdentityInfo(Map data) throws IOException {
  String endpoint = INDIVIDUAL_IDENTITY_INFORMATION_SAVE
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService updateIndividualIdentityInfo(String id, Map data) throws IOException {
  String endpoint = "${INDIVIDUAL_IDENTITY_INFORMATION_UPDATE}${id}.json"
  return new SoupMarketApiResponseService(soupBrokerApiClient.put(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService showIndividualAddressInfo(String id) throws IOException {
  String endpoint = "${INDIVIDUAL_ADDRESS_INFORMATION_SHOW}${id}.json"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService saveIndividualAddressInfo(Map data) throws IOException {
  String endpoint = INDIVIDUAL_ADDRESS_INFORMATION_SAVE
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService updateIndividualAddressInfo(String id, Map data) throws IOException {
  String endpoint = "${INDIVIDUAL_ADDRESS_INFORMATION_UPDATE}${id}.json"
  return new SoupMarketApiResponseService(soupBrokerApiClient.put(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService showIndividualEmploymentInfo(String id) throws IOException {
  String endpoint = "${INDIVIDUAL_EMPLOYMENT_INFORMATION_SHOW}${id}.json"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService saveIndividualEmploymentInfo(Map data) throws IOException {
  String endpoint = INDIVIDUAL_EMPLOYMENT_INFORMATION_SAVE
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService updateIndividualEmploymentInfo(String id, Map data) throws IOException {
  String endpoint = "${INDIVIDUAL_EMPLOYMENT_INFORMATION_UPDATE}${id}.json"
  return new SoupMarketApiResponseService(soupBrokerApiClient.put(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService showIndividualUSA_FATCA_ComplianceInfo(String id) throws IOException {
  String endpoint = "${INDIVIDUAL_USA_FATCA_INFORMATION_SHOW}${id}.json"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService saveIndividualUSA_FATCA_ComplianceInfo(Map data) throws IOException {
  String endpoint = INDIVIDUAL_USA_FATCA_INFORMATION_SAVE
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService updateIndividualUSA_FATCA_ComplianceInfo(String id, Map data) throws IOException {
  String endpoint = "${INDIVIDUAL_USA_FATCA_INFORMATION_UPDATE}${id}.json"
  return new SoupMarketApiResponseService(soupBrokerApiClient.put(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService showIndividualNextOfKinInfo(String id) throws IOException {
  String endpoint = "${INDIVIDUAL_NEXT_OF_KIN_INFORMATION_SHOW}${id}.json"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService saveIndividualNextOfKinInfo(Map data) throws IOException {
  String endpoint = INDIVIDUAL_NEXT_OF_KIN_INFORMATION_SAVE
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService updateIndividualNextOfKinInfo(String id, Map data) throws IOException {
  String endpoint = "${INDIVIDUAL_NEXT_OF_KIN_INFORMATION_UPDATE}${id}.json"
  return new SoupMarketApiResponseService(soupBrokerApiClient.put(endpoint, data.toString()))
  }

  ////////////////////////Order Management//////////////
  public SoupMarketApiResponseService fundsUnderManagement() throws IOException {
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(FUND_UNDER_MANAGEMENT))
  }

  public SoupMarketApiResponseService orderRequestStatus(String id, String contact) throws IOException {
  String endpoint = "${ORDER_REQUEST_STATUS}${id}.json?contact=${contact}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService createOrderRequest(Map data) throws IOException {
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(CREATE_ORDER_REQUEST, data.toString()))
  }

  public SoupMarketApiResponseService custodyStatement(Map data) throws IOException {
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(CLIENT_CUSTODY_STATEMENT, data.toString()))
  }

  public SoupMarketApiResponseService orderRequestHistory(String contact, Map data) throws IOException {
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(ORDER_REQUEST_HISTORY, data.toString()))
  }

  public SoupMarketApiResponseService saveAccountServices(String contact, Map data) throws IOException {
  String endpoint = "${SAVE_ACCOUNT_SERVICE}?contact=${contact}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService updateAccountServices(String contact, Map data) throws IOException {
  String endpoint = "${UPDATE_ACCOUNT_SERVICE}?contact=${contact}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.put(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService checkDepositProcess(String contact) throws IOException {
  String endpoint = "${CHECK_DEPOSIT_AND_WITHDRAWAL_PROCESS}?contact=${contact}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  *//*PIN MANAGEMENT*//*
  public SoupMarketApiResponseService getPinResetQuestions(Integer max = 100) throws IOException {
  String endpoint = "${PIN_RESET_QUESTIONS}?max=${max}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService requestPinReset(String contact) throws IOException {
  String endpoint = "${REQUEST_PIN_RESET}?contact=${contact}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService savePinReset(String contact, Map data) throws IOException {
  String endpoint = "${REQUEST_PIN_RESET}?contact=${contact}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService confirmResetPin(String contact, Map data) throws IOException {
  String endpoint = "${CONFIRM_PIN_RESET}?contact=${contact}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService changePin(String contact, Map data) throws IOException {
  String endpoint = "${CHANGE_PIN_RESET}?contact=${contact}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService createPin(String contact, Map data) throws IOException {
  String endpoint = "${CREATE_PIN_RESET}?contact=${contact}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(endpoint, data.toString()))
  }

  *//**Security & Asset management**//*

  public SoupMarketApiResponseService createSecuritySubTypeAssetAllocation(String contact, Map data) throws IOException {
  String endpoint = "${CREATE_SECURITY_SUB_TYPE_ASSET_ALLOCATION}?contact=${contact}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService getSecurityFlow(String security) throws IOException {
  String endpoint = "${SECURITY_FLOWS}?security=${security}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService createSecurityAssetAllocation(String contact, Map data) throws IOException {
  String endpoint = "${SECURITY_ASSET_ALLOCATION}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService smsNumber(String smsNumber, String smsContent) throws IOException {
  String endpoint = "${SEND_SMS_MESSAGE}${smsNumber}&smsContent=${smsContent}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService annualGrossIncome(Integer maxPage = 100) throws IOException {
  String endpoint = "${LOAD_ALL_ANNUAL_GROSS_INCOME}?max=$maxPage"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService monthlyGrossIncome(Integer maxPage = 100) throws IOException {
  String endpoint = "${LOAD_ALL_MONTHLY_INCOME}?max=${maxPage}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService clientIndustry(Integer maxPage = 100) throws IOException {
  String endpoint = "${CLIENT_INDUSTRY}?max=${maxPage}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService enumUtility(Integer maxPage = 100) throws IOException {
  String endpoint = "${LOAD_ENUM_UTILITIES}?max=${maxPage}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService annualTurnOver(Integer maxPage = 100) throws IOException {
  String endpoint = "${LOAD_ANNUAL_TURN_OVER}?max=${maxPage}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.get(endpoint))
  }

  public SoupMarketApiResponseService saveClientBankDetails(Map data) throws IOException {
  String endpoint = "${SAVE_CLIENT_BANK_DETAILS}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.post(endpoint, data.toString()))
  }

  public SoupMarketApiResponseService updateClientBankDetails(String id, Map data) throws IOException {
  String endpoint = "${UPDATE_CLIENT_BANK_DETAILS}${id}"
  return new SoupMarketApiResponseService(soupBrokerApiClient.put(endpoint, data.toString()))
  }*/
}