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
  bool _isTest = false;

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

  void setTestMode({bool isTest = false}) {
    _isTest = isTest;
  }

  Future<SDKServiceResponse<dynamic>> authenticate({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{}
      );
    }
    String endpoint = CLIENT_AUTHENTICATE+".json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> saveClientRegister({Map<String, dynamic>? map}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "client":{
              "id": "ff8081818dd4e8f0018dd5e4d5ce0009",
              "bankDetailsList": [],
              "dateCreated": "2024-02-23T12:16:13Z",
              "USA_FATCA_ComplianceInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000a",
                "dateCreated": "2024-02-23T12:16:11Z",
                "percentageOwned": 0,
                "confirmNotifications": false,
                "lastUpdated": "2024-02-23T12:16:11Z",
                "serialised": "IndividualUSA_FATCA_ComplianceInformation()",
                "confirmConsent": false,
                "confirmInfo": false,
                "archived": false,
                "confirmWithholdAmount": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000A",
                "class": "soupbroker.kyc.IndividualUSA_FATCA_ComplianceInformation"
              },
              "proprietaryAgentAccount": false,
              "pinCode": "cbfad02f9ed2a8d1e08d8f74f5303e9eb93637d47f82ab6f1c15871cf8dd0481",
              "state": "PENDING",
              "pinResetAnswer": {
                "id": "ff8081818dd4e8f0018dd5e4d6430012",
                "dateCreated": "2024-02-23T12:16:14Z",
                "lastUpdated": "2024-02-23T12:16:14Z",
                "serialised": "What is your favourite food - s***p",
                "archived": false,
                "description": "What is your favourite food - s***p",
                "client": ["Object"],
                "pinResetQuestion": ["Object"],
                "baseCurrency": null,
                "quickReference": "D6430012",
                "class": "soupbroker.kyc.PinResetAnswer"
              },
              "kycClientGroupList": [ ["Object"] ],
              "addressInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000b",
                "dateCreated": "2024-02-23T12:16:12Z",
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualAddressInformation()",
                "archived": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000B",
                "class": "soupbroker.kyc.IndividualAddressInformation"
              },
              "employmentInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000c",
                "dateCreated": "2024-02-23T12:16:12Z",
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualEmploymentInformation()",
                "archived": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000C",
                "class": "soupbroker.kyc.IndividualEmploymentInformation"
              },
              "basicInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000d",
                "dateCreated": "2024-02-23T12:16:12Z",
                "firstName": "Edwin",
                "lastName": "User",
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualBasicInformation(Edwin, User)",
                "archived": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000D",
                "class": "soupbroker.kyc.IndividualBasicInformation"
              },
              "lastUpdated": "2024-03-01T09:03:18Z",
              "digitalAddressState": "PENDING",
              "serialised": "Individual(Edwin User)",
              "deleted": false,
              "identityInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000e",
                "dateCreated": "2024-02-23T12:16:12Z",
                "verified": false,
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualIdentityInformation()",
                "archived": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000E",
                "class": "soupbroker.kyc.IndividualIdentityInformation"
              },
              "isOrRelatedToPersonHoldingGovOffice": false,
              "emailContacts": [],
              "archived": false,
              "nextOfKin": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000f",
                "dateCreated": "2024-02-23T12:16:13Z",
                "lastUpdated": "2024-02-23T12:16:13Z",
                "serialised": "IndividualNextOfKin()",
                "archived": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000F",
                "class": "soupbroker.kyc.IndividualNextOfKin"
              },
              "isOrRelatedToPoliticalOffice": false,
              "accountServicesList": [ ["Object"] ],
              "isFATCA_Applicable": false,
              "account": { "id": "ff8081817217e9f3017217f19ccc0000" },
              "phoneContacts": [ ["Object"] ],
              "currency": "GHS",
              "baseCurrency": "GHS",
              "quickReference": "D5CE0009",
              "simpleID": "Edwin User",
              "class": "soupbroker.kyc.Individual"
            },
            "accountServicesList": [
              {
                "id": "ff8081818dd4e8f0018dd5e4d6160011",
                "propLedgerTarget": "CLIENT_INVESTMENT_LIABILITY",
                "emailClientCustodyStatement": true,
                "dateCreated": "2024-02-23T12:16:14Z",
                "emailClientValuationStatement": true,
                "emailClientSummaryStatement": true,
                "defaultAccountServices": false,
                "lastUpdated": "2024-02-26T19:48:03Z",
                "collectionRuleSet": [],
                "simpleNameWithoutIo": "Edwin User",
                "investmentTenor": 0,
                "bankDetailsList": [],
                "emailStatements": false,
                "emailClientTransactionStatement": true,
                "simpleName": "Edwin User",
                "serialised": "Direct \"Account \": Individual(Edwin User)",
                "archived": false,
                "collectStatements": false,
                "investmentFundAccount": ["Object"],
                "client": ["Object"],
                "currency": "GHS",
                "baseCurrency": "GHS",
                "quickReference": "D6160011",
                "class": "soupbroker.kyc.AccountServices"
              }
            ],
            "phoneContactList": [
              {
                "id": "ff8081818dd4e8f0018dd5e4d5ec0010",
                "dateCreated": "2024-02-23T12:16:13Z",
                "verified": false,
                "phone": "233207727274",
                "sourceName": "soupbroker.kyc.Individual",
                "lastUpdated": "2024-03-01T09:08:16Z",
                "serialised": "Tel: 233207727274 | PRIMARY | Individual(Edwin User)",
                "archived": false,
                "sourceId": "ff8081818dd4e8f0018dd5e4d5ce0009",
                "sourceProperty": "phoneContacts",
                "priority": "PRIMARY",
                "baseCurrency": null,
                "quickReference": "D5EC0010",
                "simpleID": "Tel: 233207727274 | PRIMARY | Individual(Edwin User)",
                "class": "soupbroker.PhoneContact"
              }
            ],
            "emailContactList": [],
            "securityList": [
              {
                "id": "ff8081818b41bae0018b4223bf7007a7",
                "dateCreated": "2023-10-18T09:35:20Z",
                "floatingCouponList": [],
                "lastUpdated": "2024-02-27T17:38:38Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 5,
                "faceValueType": "INTEGER",
                "isin": "SYS-ADPFOSE923",
                "enableRetail": true,
                "privateResource": false,
                "serialised": "Adepa Fund-[LONG_TERM]ADPF | Ordinary Shares - Equity - Equity & Shares - EQUITY",
                "archived": false,
                "issuer": ["Object"],
                "subType": ["Object"],
                "currency": "GHS",
                "baseCurrency": "GHS",
                "quickReference": "BF7007A7",
                "simpleID": "Adepa Fund-[LONG_TERM]ADPF",
                "class": "soupbroker.trading.Security"
              },
              {
                "id": "ff808181762d3b5f01762d6905f90003",
                "dateCreated": "2020-12-04T11:00:26Z",
                "floatingCouponList": [],
                "lastUpdated": "2023-11-08T11:08:32Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 0,
                "faceValueType": "DECIMAL",
                "isin": "AIMFC986",
                "enableRetail": false,
                "privateResource": false,
                "coupon": 0,
                "serialised": "Freedom Fund Unit Trust-FFUT | Mutual Fund - CIS - Collective Investment Schemes - EQUITY",
                "archived": false,
                "issuer": ["Object"],
                "subType": ["Object"],
                "currency": "GHS",
                "baseCurrency": "GHS",
                "quickReference": "05F90003",
                "simpleID": "Freedom Fund Unit Trust-FFUT",
                "class": "soupbroker.trading.Security"
              },
              {
                "id": "ff8081818b46e138018b4825be3a1787",
                "dateCreated": "2023-10-19T13:35:15Z",
                "floatingCouponList": ["Array"],
                "lastUpdated": "2023-12-04T11:02:02Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 0,
                "faceValueType": "INTEGER",
                "isin": "SYS-TMFMFC651",
                "enableRetail": false,
                "privateResource": false,
                "serialised": "Test Mutual Fund-[MEDIUM_TERM]TMF | Mutual Fund - CIS - Collective Investment Schemes - EQUITY",
                "archived": false,
                "issuer": ["Object"],
                "subType": ["Object"],
                "currency": null,
                "baseCurrency": "GHS",
                "quickReference": "BE3A1787",
                "simpleID": "Test Mutual Fund-[MEDIUM_TERM]TMF",
                "class": "soupbroker.trading.Security"
              }]
          }
      );
    }
    FormData formData = FormData.fromMap(map!);
    return _sdkServiceRequest.post<Map<String, dynamic>>(
        endpoint: "${CLIENT_REGISTER}.json",
        data: formData
    );
  }

  Future<SDKServiceResponse<dynamic>> getClientAccountService({String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "success": "Found client with requested contact",
            "client": {
              "id": "ff8081818dd4e8f0018dd5e4d5ce0009",
              "bankDetailsList": [],
              "dateCreated": "2024-02-23T12:16:13Z",
              "USA_FATCA_ComplianceInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000a",
                "dateCreated": "2024-02-23T12:16:11Z",
                "percentageOwned": 0,
                "confirmNotifications": false,
                "lastUpdated": "2024-02-23T12:16:11Z",
                "serialised": "IndividualUSA_FATCA_ComplianceInformation()",
                "confirmConsent": false,
                "confirmInfo": false,
                "archived": false,
                "confirmWithholdAmount": false,
                "individual": "[Object]",
                "baseCurrency": null,
                "quickReference": "D5CE000A",
                "class": "soupbroker.kyc.IndividualUSA_FATCA_ComplianceInformation"
              },
              "proprietaryAgentAccount": false,
              "pinCode": "79f06f8fde333461739f220090a23cb2a79f6d714bee100d0e4b4af249294619",
              "state": "PENDING",
              "pinResetAnswer": {
                "id": "ff8081818dd4e8f0018dd5e4d6430012",
                "dateCreated": "2024-02-23T12:16:14Z",
                "lastUpdated": "2024-03-27T16:16:02Z",
                "serialised": "What is your favourite food - s***p",
                "archived": false,
                "description": "What is your favourite food - s***p",
                "client": "[Object]",
                "pinResetQuestion": "[Object]",
                "baseCurrency": null,
                "quickReference": "D6430012",
                "class": "soupbroker.kyc.PinResetAnswer"
              },
              "kycClientGroupList": [
                [
                  "Object"
                ]
              ],
              "addressInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000b",
                "dateCreated": "2024-02-23T12:16:12Z",
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualAddressInformation()",
                "archived": false,
                "individual": "[Object]",
                "baseCurrency": null,
                "quickReference": "D5CE000B",
                "class": "soupbroker.kyc.IndividualAddressInformation"
              },
              "employmentInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000c",
                "dateCreated": "2024-02-23T12:16:12Z",
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualEmploymentInformation()",
                "archived": false,
                "individual": "[Object]",
                "baseCurrency": null,
                "quickReference": "D5CE000C",
                "class": "soupbroker.kyc.IndividualEmploymentInformation"
              },
              "basicInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000d",
                "dateCreated": "2024-02-23T12:16:12Z",
                "firstName": "Edwin",
                "dateOfBirth": "2003-07-14T00:00:00Z",
                "lastName": "User",
                "lastUpdated": "2024-03-26T10:57:10Z",
                "serialised": "IndividualBasicInformation(Edwin, User, MALE)",
                "gender": "MALE",
                "archived": false,
                "individual": "[Object]",
                "baseCurrency": null,
                "quickReference": "D5CE000D",
                "class": "soupbroker.kyc.IndividualBasicInformation"
              },
              "lastUpdated": "2024-03-26T10:57:10Z",
              "digitalAddressState": "PENDING",
              "serialised": "Individual(Edwin User)",
              "deleted": false,
              "identityInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000e",
                "dateCreated": "2024-02-23T12:16:12Z",
                "verified": false,
                "ID_Number": "GHA-123456789-9",
                "lastUpdated": "2024-03-25T15:23:49Z",
                "serialised": "IndividualIdentityInformation(National ID, GHA-123456789-9)",
                "archived": false,
                "individual": "[Object]",
                "identityType": "[Object]",
                "baseCurrency": null,
                "quickReference": "D5CE000E",
                "class": "soupbroker.kyc.IndividualIdentityInformation"
              },
              "isOrRelatedToPersonHoldingGovOffice": false,
              "emailContacts": [],
              "archived": false,
              "nextOfKin": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000f",
                "dateCreated": "2024-02-23T12:16:13Z",
                "lastUpdated": "2024-02-23T12:16:13Z",
                "serialised": "IndividualNextOfKin()",
                "archived": false,
                "individual": "[Object]",
                "baseCurrency": null,
                "quickReference": "D5CE000F",
                "class": "soupbroker.kyc.IndividualNextOfKin"
              },
              "isOrRelatedToPoliticalOffice": false,
              "accountServicesList": [
                [
                  "Object"
                ]
              ],
              "isFATCA_Applicable": false,
              "account": {
                "id": "ff8081817217e9f3017217f19ccc0000"
              },
              "phoneContacts": [
                [
                  "Object"
                ]
              ],
              "currency": "GHS",
              "baseCurrency": "GHS",
              "quickReference": "D5CE0009",
              "simpleID": "Edwin User",
              "class": "soupbroker.kyc.Individual"
            },
            "accountServicesList": [
              {
                "id": "ff8081818dd4e8f0018dd5e4d6160011",
                "propLedgerTarget": "CLIENT_INVESTMENT_LIABILITY",
                "emailClientCustodyStatement": true,
                "dateCreated": "2024-02-23T12:16:14Z",
                "emailClientValuationStatement": true,
                "emailClientSummaryStatement": true,
                "defaultAccountServices": false,
                "lastUpdated": "2024-02-26T19:48:03Z",
                "collectionRuleSet": [],
                "simpleNameWithoutIo": "Edwin User",
                "investmentTenor": 0,
                "bankDetailsList": [],
                "emailStatements": false,
                "emailClientTransactionStatement": true,
                "simpleName": "Edwin User",
                "serialised": "Direct Account : Individual(Edwin User)",
                "archived": false,
                "collectStatements": false,
                "investmentFundAccount": "[Object]",
                "client": "[Object]",
                "currency": "GHS",
                "baseCurrency": "GHS",
                "quickReference": "D6160011",
                "class": "soupbroker.kyc.AccountServices"
              }
            ],
            "phoneContactList": [
              {
                "id": "ff8081818dd4e8f0018dd5e4d5ec0010",
                "dateCreated": "2024-02-23T12:16:13Z",
                "verified": false,
                "phone": "233207727274",
                "sourceName": "soupbroker.kyc.Individual",
                "lastUpdated": "2024-03-23T13:29:57Z",
                "serialised": "Tel: 233207727274 | PRIMARY | Individual(Edwin User)",
                "archived": false,
                "sourceId": "ff8081818dd4e8f0018dd5e4d5ce0009",
                "sourceProperty": "phoneContacts",
                "priority": "PRIMARY",
                "baseCurrency": null,
                "quickReference": "D5EC0010",
                "simpleID": "Tel: 233207727274 | PRIMARY | Individual(Edwin User)",
                "class": "soupbroker.common.PhoneContact"
              }
            ],
            "emailContactList": [],
            "securityList": [
              {
                "id": "ff8081818b41bae0018b4223bf7007a7",
                "dateCreated": "2023-10-18T09:35:20Z",
                "floatingCouponList": [],
                "lastUpdated": "2024-02-27T17:38:38Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 5,
                "faceValueType": "INTEGER",
                "isin": "SYS-ADPFOSE923",
                "enableRetail": true,
                "privateResource": false,
                "serialised": "Adepa Fund-[LONG_TERM]ADPF | Ordinary Shares - Equity - Equity & Shares - EQUITY",
                "archived": false,
                "issuer": "[Object]",
                "subType": "[Object]",
                "currency": "GHS",
                "baseCurrency": "GHS",
                "quickReference": "BF7007A7",
                "simpleID": "Adepa Fund-[LONG_TERM]ADPF",
                "class": "soupbroker.trading.Security"
              },
              {
                "id": "ff808181762d3b5f01762d6905f90003",
                "dateCreated": "2020-12-04T11:00:26Z",
                "floatingCouponList": [],
                "lastUpdated": "2023-11-08T11:08:32Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 0,
                "faceValueType": "DECIMAL",
                "isin": "AIMFC986",
                "enableRetail": false,
                "privateResource": false,
                "coupon": 0,
                "serialised": "Freedom Fund Unit Trust-FFUT | Mutual Fund - CIS - Collective Investment Schemes - EQUITY",
                "archived": false,
                "issuer": "[Object]",
                "subType": "[Object]",
                "currency": "GHS",
                "baseCurrency": "GHS",
                "quickReference": "05F90003",
                "simpleID": "Freedom Fund Unit Trust-FFUT",
                "class": "soupbroker.trading.Security"
              },
              {
                "id": "ff8081818b46e138018b4825be3a1787",
                "dateCreated": "2023-10-19T13:35:15Z",
                "floatingCouponList": "[Array]",
                "lastUpdated": "2023-12-04T11:02:02Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 0,
                "faceValueType": "INTEGER",
                "isin": "SYS-TMFMFC651",
                "enableRetail": false,
                "privateResource": false,
                "serialised": "Test Mutual Fund-[MEDIUM_TERM]TMF | Mutual Fund - CIS - Collective Investment Schemes - EQUITY",
                "archived": false,
                "issuer": "[Object]",
                "subType": "[Object]",
                "currency": null,
                "baseCurrency": "GHS",
                "quickReference": "BE3A1787",
                "simpleID": "Test Mutual Fund-[MEDIUM_TERM]TMF",
                "class": "soupbroker.trading.Security"
              }
            ]
          }
      );
    }
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get<Map<String, dynamic>>(
        endpoint: "${CLIENT_ACCOUNT_SERVICE}.json",
        queryParameters: queryParameters
    );
  }

  Future<SDKServiceResponse<dynamic>> searchPinResetQuestion({String? searchWord, String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:[
            {
              "id": "ff8081817c94fef0017c95065f8f0004",
              "dateCreated": "2021-10-18T20:09:55Z",
              "lastUpdated": "2024-02-23T12:15:54Z",
              "serialised": "What is your favourite food",
              "archived": false,
              "priority": 4,
              "description": "What is your favourite food",
              "account": {
                "id": "ff8081817217e9f3017217f19ccc0000",
                "class": "soupbroker.Account",
                "serialised": "Account(Demo Securities & Asset Limited, Licensed Broker-Dealer)"
              },
              "totalCount": 5,
              "baseCurrency": null,
              "quickReference": "5F8F0004",
              "class": "soupbroker.kyc.PinResetQuestion"
            },
            {
              "id": "ff8081817c94fef0017c9505b0930003",
              "dateCreated": "2021-10-18T20:09:10Z",
              "lastUpdated": "2021-11-21T20:24:02Z",
              "serialised": "Where did you meet your spouse",
              "archived": false,
              "priority": 5,
              "description": "Where did you meet your spouse",
              "account": {
                "id": "ff8081817217e9f3017217f19ccc0000",
                "class": "soupbroker.Account",
                "serialised": "Account(Demo Securities & Asset Limited, Licensed Broker-Dealer)"
              },
              "totalCount": 5,
              "baseCurrency": null,
              "quickReference": "B0930003",
              "class": "soupbroker.kyc.PinResetQuestion"
            },
            {
              "id": "ff8081817c94fef0017c95049c2e0002",
              "dateCreated": "2021-10-18T20:07:59Z",
              "lastUpdated": "2024-02-20T14:49:23Z",
              "serialised": "What is the name of the area you grew up",
              "archived": false,
              "priority": 3,
              "description": "What is the name of the area you grew up",
              "account": {
                "id": "ff8081817217e9f3017217f19ccc0000",
                "class": "soupbroker.Account",
                "serialised": "Account(Demo Securities & Asset Limited, Licensed Broker-Dealer)"
              },
              "totalCount": 5,
              "baseCurrency": null,
              "quickReference": "9C2E0002",
              "class": "soupbroker.kyc.PinResetQuestion"
            },
            {
              "id": "ff8081817c94fef0017c95044edf0001",
              "dateCreated": "2021-10-18T20:07:39Z",
              "lastUpdated": "2024-02-28T17:05:21Z",
              "serialised": "What is your favourite subject in primary school",
              "archived": false,
              "priority": 2,
              "description": "What is your favourite subject in primary school",
              "account": {
                "id": "ff8081817217e9f3017217f19ccc0000",
                "class": "soupbroker.Account",
                "serialised": "Account(Demo Securities & Asset Limited, Licensed Broker-Dealer)"
              },
              "totalCount": 5,
              "baseCurrency": null,
              "quickReference": "4EDF0001",
              "class": "soupbroker.kyc.PinResetQuestion"
            },
            {
              "id": "ff8081817c94fef0017c9503d5050000",
              "dateCreated": "2021-10-18T20:07:08Z",
              "lastUpdated": "2021-11-21T20:23:32Z",
              "serialised": "What is the name of your first boss at work",
              "archived": false,
              "priority": 1,
              "description": "What is the name of your first boss at work",
              "account": {
                "id": "ff8081817217e9f3017217f19ccc0000",
                "class": "soupbroker.Account",
                "serialised": "Account(Demo Securities & Asset Limited, Licensed Broker-Dealer)"
              },
              "totalCount": 5,
              "baseCurrency": null,
              "quickReference": "D5050000",
              "class": "soupbroker.kyc.PinResetQuestion"
            }
          ]
      );
    }
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
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818dd4e8f0018dd5e4d5ce000d',
            "dateCreated": '2024-02-23T12:16:12Z',
            "firstName": 'Edwin',
            "dateOfBirth": '2003-07-14T00:00:00Z',
            "lastName": 'User',
            "lastUpdated": '2024-03-26T10:57:10Z',
            "serialised": 'IndividualBasicInformation(Edwin, User, MALE)',
            "gender": 'MALE',
            "archived": false,
            "individual": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce0009',
              "class": 'soupbroker.kyc.Individual',
              "serialised": 'Individual(Edwin User)'
            },
            "baseCurrency": null,
            "quickReference": 'D5CE000D',
            "class": 'soupbroker.kyc.IndividualBasicInformation'
          }
      );
    }
    final queryParameters = {
      'contact': contact,
    };
    String endpoint = INDIVIDUAL_BASIC_INFORMATION_SHOW+"${id}.json";
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> getAllIndividualList({String? id, String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:[{
            "id": 'ff8081818dd4e8f0018dd5e4d5ce0009',
            "bankDetailsList": [],
            "dateCreated": '2024-02-23T12:16:13Z',
            "USA_FATCA_ComplianceInformation": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce000a',
              "dateCreated": '2024-02-23T12:16:11Z',
              "percentageOwned": 0,
              "confirmNotifications": false,
              "lastUpdated": '2024-02-23T12:16:11Z',
              "serialised": 'IndividualUSA_FATCA_ComplianceInformation()',
              "confirmConsent": false,
              "confirmInfo": false,
              "archived": false,
              "confirmWithholdAmount": false,
              "individual": [Object],
              "baseCurrency": null,
              "quickReference": 'D5CE000A',
              "class": 'soupbroker.kyc.IndividualUSA_FATCA_ComplianceInformation'
            },
            "proprietaryAgentAccount": false,
            "pinCode": '79f06f8fde333461739f220090a23cb2a79f6d714bee100d0e4b4af249294619',
            "state": 'PENDING',
            "pinResetAnswer": {
              "id": 'ff8081818dd4e8f0018dd5e4d6430012',
              "dateCreated": '2024-02-23T12:16:14Z',
              "lastUpdated": '2024-02-23T12:16:14Z',
              "serialised": 'What is your favourite food - s***p',
              "archived": false,
              "description": 'What is your favourite food - s***p',
              "client": [Object],
              "pinResetQuestion": [Object],
              "baseCurrency": null,
              "quickReference": 'D6430012',
              "class": 'soupbroker.kyc.PinResetAnswer'
            },
            "kycClientGroupList": [ [Object] ],
            "addressInformation": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce000b',
              "dateCreated": '2024-02-23T12:16:12Z',
              "lastUpdated": '2024-02-23T12:16:12Z',
              "serialised": 'IndividualAddressInformation()',
              "archived": false,
              "individual": [Object],
              "baseCurrency": null,
              "quickReference": 'D5CE000B',
              "class": 'soupbroker.kyc.IndividualAddressInformation'
            },
            "employmentInformation": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce000c',
              "dateCreated": '2024-02-23T12:16:12Z',
              "lastUpdated": '2024-02-23T12:16:12Z',
              "serialised": 'IndividualEmploymentInformation()',
              "archived": false,
              "individual": [Object],
              "baseCurrency": null,
              "quickReference": 'D5CE000C',
              "class": 'soupbroker.kyc.IndividualEmploymentInformation'
            },
            "basicInformation": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce000d',
              "dateCreated": '2024-02-23T12:16:12Z',
              "firstName": 'Edwin',
              "lastName": 'User',
              "lastUpdated": '2024-02-23T12:16:12Z',
              "serialised": 'IndividualBasicInformation(Edwin, User)',
              "archived": false,
              "individual": [Object],
              "baseCurrency": null,
              "quickReference": 'D5CE000D',
              "class": 'soupbroker.kyc.IndividualBasicInformation'
            },
            "lastUpdated": '2024-03-08T11:31:37Z',
            "digitalAddressState": 'PENDING',
            "serialised": 'Individual(Edwin User)',
            "deleted": false,
            "identityInformation": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce000e',
              "dateCreated": '2024-02-23T12:16:12Z',
              "verified": false,
              "lastUpdated": '2024-02-23T12:16:12Z',
              "serialised": 'IndividualIdentityInformation()',
              "archived": false,
              "individual": [Object],
              "baseCurrency": null,
              "quickReference": 'D5CE000E',
              "class": 'soupbroker.kyc.IndividualIdentityInformation'
            },
            "isOrRelatedToPersonHoldingGovOffice": false,
            "emailContacts": [],
            "archived": false,
            "nextOfKin": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce000f',
              "dateCreated": '2024-02-23T12:16:13Z',
              "lastUpdated": '2024-02-23T12:16:13Z',
              "serialised": 'IndividualNextOfKin()',
              "archived": false,
              "individual": [Object],
              "baseCurrency": null,
              "quickReference": 'D5CE000F',
              "class": 'soupbroker.kyc.IndividualNextOfKin'
            },
            "isOrRelatedToPoliticalOffice": false,
            "isFATCA_Applicable": false,
            "account": { "id": 'ff8081817217e9f3017217f19ccc0000' },
            "phoneContacts": [ [Object] ],
            "totalCount": 1,
            "currency": 'GHS',
            "baseCurrency": 'GHS',
            "quickReference": 'D5CE0009',
            "simpleID": 'Edwin User',
            "class": 'soupbroker.kyc.Individual'
          }]
      );
    }
    String endpoint = "${ALL_INDIVIDUAL}.json";
    final queryParameters = {
      'contact': contact,
      'id': id,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> individualBasicInformationSave({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818dd4e8f0018dd5e4d5ce000d',
            "dateCreated": '2024-02-23T12:16:12Z',
            "firstName": 'Edwin',
            "dateOfBirth": '2003-07-14T00:00:00Z',
            "lastName": 'User',
            "lastUpdated": '2024-03-26T10:57:10Z',
            "serialised": 'IndividualBasicInformation(Edwin, User, MALE)',
            "gender": 'MALE',
            "archived": false,
            "individual": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce0009',
              "class": 'soupbroker.kyc.Individual',
              "serialised": 'Individual(Edwin User)'
            },
            "baseCurrency": null,
            "quickReference": 'D5CE000D',
            "class": 'soupbroker.kyc.IndividualBasicInformation'
          }
      );
    }
    String endpoint = INDIVIDUAL_BASIC_INFORMATION_SAVE+".json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualBasicInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818dd4e8f0018dd5e4d5ce000d',
            "dateCreated": '2024-02-23T12:16:12Z',
            "firstName": 'Edwin',
            "dateOfBirth": '2003-07-14T00:00:00Z',
            "lastName": 'User',
            "lastUpdated": '2024-03-26T10:57:10Z',
            "serialised": 'IndividualBasicInformation(Edwin, User, MALE)',
            "gender": 'MALE',
            "archived": false,
            "individual": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce0009',
              "class": 'soupbroker.kyc.Individual',
              "serialised": 'Individual(Edwin User)'
            },
            "baseCurrency": null,
            "quickReference": 'D5CE000D',
            "class": 'soupbroker.kyc.IndividualBasicInformation'
          }
      );
    }
    String endpoint = "${INDIVIDUAL_BASIC_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualIdentityInformationShow({String? id, String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818dd4e8f0018dd5e4d5ce000e',
            "dateCreated": '2024-02-23T12:16:12Z',
            "verified": false,
            "ID_Number": 'GHA-123456789-9',
            "lastUpdated": '2024-03-25T15:23:49Z',
            "serialised": 'IndividualIdentityInformation(National ID, GHA-123456789-9)',
            "archived": false,
            "individual": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce0009',
              "class": 'soupbroker.kyc.Individual',
              "serialised": 'Individual(Edwin User)'
            },
            "identityType": {
              "id": 'ecbd5d077035552d017035a873b5000b',
              "class": 'soupbroker.setting.IdentityType',
              "serialised": 'National ID'
            },
            "baseCurrency": null,
            "quickReference": 'D5CE000E',
            "class": 'soupbroker.kyc.IndividualIdentityInformation'
          }
      );
    }
    String endpoint = "${INDIVIDUAL_IDENTITY_INFORMATION_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> individualIdentityInformationSave({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818dd4e8f0018dd5e4d5ce000e',
            "dateCreated": '2024-02-23T12:16:12Z',
            "verified": false,
            "ID_Number": 'GHA-123456789-9',
            "lastUpdated": '2024-03-25T15:23:49Z',
            "serialised": 'IndividualIdentityInformation(National ID, GHA-123456789-9)',
            "archived": false,
            "individual": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce0009',
              "class": 'soupbroker.kyc.Individual',
              "serialised": 'Individual(Edwin User)'
            },
            "identityType": {
              "id": 'ecbd5d077035552d017035a873b5000b',
              "class": 'soupbroker.setting.IdentityType',
              "serialised": 'National ID'
            },
            "baseCurrency": null,
            "quickReference": 'D5CE000E',
            "class": 'soupbroker.kyc.IndividualIdentityInformation'
          }
      );
    }
    String endpoint = "${INDIVIDUAL_IDENTITY_INFORMATION_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualIdentityInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818dd4e8f0018dd5e4d5ce000e',
            "dateCreated": '2024-02-23T12:16:12Z',
            "verified": false,
            "ID_Number": 'GHA-123456789-9',
            "lastUpdated": '2024-03-25T15:23:49Z',
            "serialised": 'IndividualIdentityInformation(National ID, GHA-123456789-9)',
            "archived": false,
            "individual": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce0009',
              "class": 'soupbroker.kyc.Individual',
              "serialised": 'Individual(Edwin User)'
            },
            "identityType": {
              "id": 'ecbd5d077035552d017035a873b5000b',
              "class": 'soupbroker.setting.IdentityType',
              "serialised": 'National ID'
            },
            "baseCurrency": null,
            "quickReference": 'D5CE000E',
            "class": 'soupbroker.kyc.IndividualIdentityInformation'
          }
      );
    }
    String endpoint = "${INDIVIDUAL_IDENTITY_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualAddressInformationShow({String? id, String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818dd4e8f0018dd5e4d5ce000b',
            "dateCreated": '2024-02-23T12:16:12Z',
            "lastUpdated": '2024-02-23T12:16:12Z',
            "serialised": 'IndividualAddressInformation()',
            "archived": false,
            "individual": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce0009',
              "class": 'soupbroker.kyc.Individual',
              "serialised": 'Individual(Edwin King)'
            },
            "baseCurrency": null,
            "quickReference": 'D5CE000B',
            "class": 'soupbroker.kyc.IndividualAddressInformation'
          }
      );
    }
    String endpoint = "${INDIVIDUAL_ADDRESS_INFORMATION_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> individualAddressInformationSave({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818dd4e8f0018dd5e4d5ce000b',
            "dateCreated": '2024-02-23T12:16:12Z',
            "digitalAddress": 'GZ-677679-99',
            "countryOfResidence": 'gha,Ghana',
            "nationality": 'GHA',
            "countryOfOrigin": 'gha,Ghana',
            "lastUpdated": '2024-04-09T14:02:03Z',
            "serialised": 'IndividualAddressInformation(P.O Box AN 11384, C26 Spintex, gha,Ghana, gha,Ghana, GHA, GZ-677679-99)',
            "postalAddress": 'P.O Box AN 11384',
            "archived": false,
            "residentialAddress": 'C26 Manet Court, Spintex',
            "residentialRegion": {
              "id": 'ff80818178607b6d0178607bd70f001d',
              "class": 'soupbroker.setting.DomesticRegion',
              "serialised": 'Greater Accra Region'
            },
            "residentialSubRegion": {
              "id": 'ff8081817e8d714b017e8dd94c500005',
              "class": 'soupbroker.setting.DomesticSubRegion',
              "serialised": 'Ayawaso West'
            },
            "individual": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce0009',
              "class": 'soupbroker.kyc.Individual',
              "serialised": 'Individual(Edwin King)'
            },
            "baseCurrency": null,
            "quickReference": 'D5CE000B',
            "class": 'soupbroker.kyc.IndividualAddressInformation'
          }
      );
    }
    String endpoint = "${INDIVIDUAL_ADDRESS_INFORMATION_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualAddressInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818dd4e8f0018dd5e4d5ce000b',
            "dateCreated": '2024-02-23T12:16:12Z',
            "digitalAddress": 'GZ-677679-99',
            "countryOfResidence": 'gha,Ghana',
            "nationality": 'GHA',
            "countryOfOrigin": 'gha,Ghana',
            "lastUpdated": '2024-04-09T14:02:03Z',
            "serialised": 'IndividualAddressInformation(P.O Box AN 11384, C26 Spintex, gha,Ghana, gha,Ghana, GHA, GZ-677679-99)',
            "postalAddress": 'P.O Box AN 11384',
            "archived": false,
            "residentialAddress": 'C26 Manet Court, Spintex',
            "residentialRegion": {
              "id": 'ff80818178607b6d0178607bd70f001d',
              "class": 'soupbroker.setting.DomesticRegion',
              "serialised": 'Greater Accra Region'
            },
            "residentialSubRegion": {
              "id": 'ff8081817e8d714b017e8dd94c500005',
              "class": 'soupbroker.setting.DomesticSubRegion',
              "serialised": 'Ayawaso West'
            },
            "individual": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce0009',
              "class": 'soupbroker.kyc.Individual',
              "serialised": 'Individual(Edwin King)'
            },
            "baseCurrency": null,
            "quickReference": 'D5CE000B',
            "class": 'soupbroker.kyc.IndividualAddressInformation'
          }
      );
    }
    String endpoint = "${INDIVIDUAL_ADDRESS_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualEmploymentInformationShow({String? id, String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818dd4e8f0018dd5e4d5ce000c',
            "employerName": 'Airways',
            "dateCreated": '2024-02-23T12:16:12Z',
            "employerContact": '233303234672',
            "yearsOfHistoricalEmployment": 2,
            "yearsOfCurrentEmployment": 2,
            "lastUpdated": '2024-04-09T16:41:33Z',
            "serialised": 'IndividualEmploymentInformation(EMPLOYED, Software Developer, Computer Engineer, Airways, 233303234672, Airport)',
            "employmentStatus": 'EMPLOYED',
            "archived": false,
            "employerAddress": 'Airport',
            "occupation": 'Software Developer',
            "profession": 'Computer Engineer',
            "sourceOfIncomeForOtherOption": '1',
            "annualGrossIncome": {
              "id": 'ff8081818ec3a064018ec3a2ade6001f',
              "class": 'soupbroker.kyc.AnnualGrossIncome',
              "serialised": 'AnnualGrossIncome(Below GHS 100)'
            },
            "monthlyGrossIncome": {
              "id": 'ff808181708af4cc01708af521450005',
              "class": 'soupbroker.kyc.MonthlyGrossIncome',
              "serialised": 'MonthlyGrossIncome(Between GHS 1,000 - GHS 5,000)'
            },
            "individual": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce0009',
              "class": 'soupbroker.kyc.Individual',
              "serialised": 'Individual(Edwin King)'
            },
            "clientIndustry": {
              "id": 'ff8081817283659401728663bc2c003e',
              "class": 'soupbroker.setting.ClientIndustry',
              "serialised": 'Airport Services'
            },
            "baseCurrency": null,
            "quickReference": 'D5CE000C',
            "class": 'soupbroker.kyc.IndividualEmploymentInformation'
          }
      );
    }
    String endpoint = "${INDIVIDUAL_EMPLOYMENT_INFORMATION_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> individualEmploymentInformationSave({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818dd4e8f0018dd5e4d5ce000c',
            "employerName": 'Airways',
            "dateCreated": '2024-02-23T12:16:12Z',
            "employerContact": '233303234672',
            "yearsOfHistoricalEmployment": 2,
            "yearsOfCurrentEmployment": 2,
            "lastUpdated": '2024-04-09T16:41:33Z',
            "serialised": 'IndividualEmploymentInformation(EMPLOYED, Software Developer, Computer Engineer, Airways, 233303234672, Airport)',
            "employmentStatus": 'EMPLOYED',
            "archived": false,
            "employerAddress": 'Airport',
            "occupation": 'Software Developer',
            "profession": 'Computer Engineer',
            "sourceOfIncomeForOtherOption": '1',
            "annualGrossIncome": {
              "id": 'ff8081818ec3a064018ec3a2ade6001f',
              "class": 'soupbroker.kyc.AnnualGrossIncome',
              "serialised": 'AnnualGrossIncome(Below GHS 100)'
            },
            "monthlyGrossIncome": {
              "id": 'ff808181708af4cc01708af521450005',
              "class": 'soupbroker.kyc.MonthlyGrossIncome',
              "serialised": 'MonthlyGrossIncome(Between GHS 1,000 - GHS 5,000)'
            },
            "individual": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce0009',
              "class": 'soupbroker.kyc.Individual',
              "serialised": 'Individual(Edwin King)'
            },
            "clientIndustry": {
              "id": 'ff8081817283659401728663bc2c003e',
              "class": 'soupbroker.setting.ClientIndustry',
              "serialised": 'Airport Services'
            },
            "baseCurrency": null,
            "quickReference": 'D5CE000C',
            "class": 'soupbroker.kyc.IndividualEmploymentInformation'
          }
      );
    }
    String endpoint = "${INDIVIDUAL_EMPLOYMENT_INFORMATION_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualEmploymentInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818dd4e8f0018dd5e4d5ce000c',
            "employerName": 'Airways',
            "dateCreated": '2024-02-23T12:16:12Z',
            "employerContact": '233303234672',
            "yearsOfHistoricalEmployment": 2,
            "yearsOfCurrentEmployment": 2,
            "lastUpdated": '2024-04-09T16:41:33Z',
            "serialised": 'IndividualEmploymentInformation(EMPLOYED, Software Developer, Computer Engineer, Airways, 233303234672, Airport)',
            "employmentStatus": 'EMPLOYED',
            "archived": false,
            "employerAddress": 'Airport',
            "occupation": 'Software Developer',
            "profession": 'Computer Engineer',
            "sourceOfIncomeForOtherOption": '1',
            "annualGrossIncome": {
              "id": 'ff8081818ec3a064018ec3a2ade6001f',
              "class": 'soupbroker.kyc.AnnualGrossIncome',
              "serialised": 'AnnualGrossIncome(Below GHS 100)'
            },
            "monthlyGrossIncome": {
              "id": 'ff808181708af4cc01708af521450005',
              "class": 'soupbroker.kyc.MonthlyGrossIncome',
              "serialised": 'MonthlyGrossIncome(Between GHS 1,000 - GHS 5,000)'
            },
            "individual": {
              "id": 'ff8081818dd4e8f0018dd5e4d5ce0009',
              "class": 'soupbroker.kyc.Individual',
              "serialised": 'Individual(Edwin King)'
            },
            "clientIndustry": {
              "id": 'ff8081817283659401728663bc2c003e',
              "class": 'soupbroker.setting.ClientIndustry',
              "serialised": 'Airport Services'
            },
            "baseCurrency": null,
            "quickReference": 'D5CE000C',
            "class": 'soupbroker.kyc.IndividualEmploymentInformation'
          }
      );
    }
    String endpoint = "${INDIVIDUAL_EMPLOYMENT_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individuaFatcaInformationShow({String? id, String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${INDIVIDUAL_USA_FATCA_INFORMATION_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> individuaFatcaInformationSave({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${INDIVIDUAL_USA_FATCA_INFORMATION_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individuaFatcaInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${INDIVIDUAL_USA_FATCA_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualNextOfKinInformationShow({String? id, String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818deea8bb018df0ad8bc80098',
            "dateCreated": '2024-02-28T17:05:33Z',
            "individual": {
              "id": 'ff8081818deea8bb018df0ad8bc80092',
              "class": 'soupbroker.kyc.Individual',
              "serialised": 'Individual(New Comer)',
              "totalCount": null
            },
            "lastUpdated": '2024-02-28T17:05:33Z',
            "serialised": 'IndividualNextOfKin()',
            "archived": false,
            "baseCurrency": null,
            "quickReference": '8BC80098',
            "class": 'soupbroker.kyc.IndividualNextOfKin'
          }
      );
    }
    String endpoint = "${INDIVIDUAL_NEXT_OF_KIN_INFORMATION_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> individualNextOfKinInformationSave({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818deea8bb018df0ad8bc80098',
            "relationshipForOtherOption": '3',
            "dateCreated": '2024-02-28T17:05:33Z',
            "relationship": 'SIBLING',
            "fullName": 'Edwin Jones',
            "individual": {
              "id": 'ff8081818deea8bb018df0ad8bc80092',
              "class": 'soupbroker.kyc.Individual',
              "serialised": 'Individual(New Comer)',
              "totalCount": null
            },
            "lastUpdated": '2024-11-07T17:06:23Z',
            "serialised": 'IndividualNextOfKin(Edwin Jones, 16 Noi, Enscript, SIBLING, 3)',
            "archived": false,
            "address": '16 Noi, Enscript',
            "email": 'edwin.kobbey@enscriptgh.com',
            "baseCurrency": null,
            "quickReference": '8BC80098',
            "class": 'soupbroker.kyc.IndividualNextOfKin'
          }
      );
    }
    String endpoint = "${INDIVIDUAL_NEXT_OF_KIN_INFORMATION_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualNextOfKinInformationUpdate({String? id, Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818deea8bb018df0ad8bc80098',
            "relationshipForOtherOption": '3',
            "dateCreated": '2024-02-28T17:05:33Z',
            "relationship": 'SIBLING',
            "fullName": 'Edwin Jones',
            "individual": {
              "id": 'ff8081818deea8bb018df0ad8bc80092',
              "class": 'soupbroker.kyc.Individual',
              "serialised": 'Individual(New Comer)',
              "totalCount": null
            },
            "lastUpdated": '2024-11-07T17:06:23Z',
            "serialised": 'IndividualNextOfKin(Edwin Jones, 16 Noi, Enscript, SIBLING, 3)',
            "archived": false,
            "address": '16 Noi, Enscript',
            "email": 'edwin.kobbey@enscriptgh.com',
            "baseCurrency": null,
            "quickReference": '8BC80098',
            "class": 'soupbroker.kyc.IndividualNextOfKin'
          }
      );
    }
    String endpoint = "${INDIVIDUAL_NEXT_OF_KIN_INFORMATION_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualRiskAssessmentShow({String? id, String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${INDIVIDUAL_RISK_ASSESSMENT_SHOW}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> individualRiskAssessmentSave({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${INDIVIDUAL_RISK_ASSESSMENT_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> individualRiskAssessmentUpdate({String? id, Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${INDIVIDUAL_RISK_ASSESSMENT_UPDATE}${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  ////////////////////////Order Management//////////////

  // Future<SDKServiceResponse<dynamic>> fundsUnderManagement({String? contact, Map<String, dynamic>? filter}) async {
  Future<SDKServiceResponse<dynamic>> fundsUnderManagement({String? contact, Map<String, dynamic>? filter}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:[
            {
              "id": "ff8081818b46e138018b4825be3a1787",
              "dateCreated": "2023-10-19T13:35:15Z",
              "floatingCouponList": [ ["Object"] ],
              "lastUpdated": "2023-12-04T11:02:02Z",
              "cleanPricePrecisionRounding": 0,
              "tenor": 0,
              "faceValueType": "INTEGER",
              "isin": "SYS-TMFMFC651",
              "enableRetail": false,
              "privateResource": false,
              "serialised": "Test Mutual Fund-[MEDIUM_TERM]TMF | Mutual Fund - CIS - Collective Investment Schemes - EQUITY",
              "archived": false,
              "issuer": {
                "id": "ff8081818b46e138018b4825bdfc1786",
                "class": "soupbroker.trading.Issuer",
                "serialised": "TMF"
              },
              "subType": {
                "id": "ff8081817060230901706023a15d0000",
                "class": "soupbroker.setting.SecuritySubType",
                "serialised": "Mutual Fund - CIS - Collective Investment Schemes - EQUITY"
              },
              "bestBid": 0.55,
              "bestBidPrice": 0.55,
              "bestAsk": 0.55,
              "bestAskPrice": 0.55,
              "bidPricingDate": "2023-10-01T00:00:00Z",
              "askPricingDate": "2023-10-01T00:00:00Z",
              "DTM": -1,
              "totalCount": 3,
              "currency": null,
              "baseCurrency": "GHS",
              "quickReference": "BE3A1787",
              "simpleID": "Test Mutual Fund-[MEDIUM_TERM]TMF",
              "class": "soupbroker.trading.Security$HibernateProxy$0kUa7Srt"
            },
            {
              "id": "ff8081818b41bae0018b4223bf7007a7",
              "dateCreated": "2023-10-18T09:35:20Z",
              "floatingCouponList": [],
              "lastUpdated": "2024-02-27T17:38:38Z",
              "cleanPricePrecisionRounding": 0,
              "tenor": 5,
              "faceValueType": "INTEGER",
              "isin": "SYS-ADPFOSE923",
              "enableRetail": true,
              "privateResource": false,
              "serialised": "Adepa Fund-[LONG_TERM]ADPF | Ordinary Shares - Equity - Equity & Shares - EQUITY",
              "archived": false,
              "issuer": {
                "id": "ff8081818b41bae0018b421d6bfa0704",
                "class": "soupbroker.trading.Issuer",
                "serialised": "ADPF"
              },
              "subType": {
                "id": "2c9181826fd02a4b016fd02af9c5000e",
                "class": "soupbroker.setting.SecuritySubType",
                "serialised": "Ordinary Shares - Equity - Equity & Shares - EQUITY"
              },
              "bestBid": 2,
              "bestBidPrice": 2,
              "bestAsk": 1.5,
              "bestAskPrice": 1.5,
              "bidPricingDate": "2024-03-04T00:00:00Z",
              "askPricingDate": "2024-03-04T00:00:00Z",
              "DTM": -1,
              "totalCount": 3,
              "currency": "GHS",
              "baseCurrency": "GHS",
              "quickReference": "BF7007A7",
              "simpleID": "Adepa Fund-[LONG_TERM]ADPF",
              "class": "soupbroker.trading.Security$HibernateProxy$0kUa7Srt"
            },
            {
              "id": "ff808181762d3b5f01762d6905f90003",
              "dateCreated": "2020-12-04T11:00:26Z",
              "floatingCouponList": [],
              "lastUpdated": "2023-11-08T11:08:32Z",
              "cleanPricePrecisionRounding": 0,
              "tenor": 0,
              "faceValueType": "DECIMAL",
              "isin": "AIMFC986",
              "enableRetail": false,
              "privateResource": false,
              "coupon": 0,
              "serialised": "Freedom Fund Unit Trust-FFUT | Mutual Fund - CIS - Collective Investment Schemes - EQUITY",
              "archived": false,
              "issuer": {
                "id": "ff80818176247126017624d2ad650004",
                "class": "soupbroker.trading.Issuer",
                "serialised": "FFUT"
              },
              "subType": {
                "id": "ff8081817060230901706023a15d0000",
                "class": "soupbroker.setting.SecuritySubType",
                "serialised": "Mutual Fund - CIS - Collective Investment Schemes - EQUITY"
              },
              "DTM": -1,
              "totalCount": 3,
              "currency": "GHS",
              "baseCurrency": "GHS",
              "quickReference": "05F90003",
              "simpleID": "Freedom Fund Unit Trust-FFUT",
              "class": "soupbroker.trading.SecurityHibernateProxy0kUa7Srt"
            },
            {
              "id": "ff808181846315370184631b942800a9",
              "dateCreated": "2022-11-10T19:54:22Z",
              "DTM": -1,
              "accruedDays": 152,
              "archived": false,
              "baseCurrency": "GHS",
              "class": "soupbroker.trading.Security",
              "cleanPricePrecisionRounding": 0,
              "coupon": 30,
              "couponFrequency": "SEMI_ANNUAL",
              "currency": "NGN",
              "enableRetail": false,
              "faceValueType": "INTEGER",
              "floatingCouponList": [],
              "isin": "nf4d2d2d4d44s",
              "issuer": {
                "id": "ff8081818462f01c0184630c799201f3",
                "class": "soupbroker.trading.Issuer",
                "serialised": "NG"
              },
              "lastUpdated": "2023-04-05T18:03:22Z",
              "market": {
                "id": "ff808181721bd8c101721e0cc3930007",
                "class": "soupbroker.trading.Market"
              },
              "pricingDate": "2022-11-14T00:00:00Z",
              "privateResource": false,
              "quickReference": "942800A9",
              "serialised": "NG-3yrs-BD-123-13a-30.00 | 10 YEAR FXR BOND - BD - Bond - DEBT",
              "simpleID": "NG-3yrs-BD-123-13a-30.00",
              "subType": {
                "id": "ff808181708af4cc01708af6e8f50013",
                "class": "soupbroker.setting.SecuritySubType"
              }
            }
          ]
      );
    }
    String endpoint = "${FUND_UNDER_MANAGEMENT}.json";
    final queryParameters = {
      'contact': contact,
      "enableFundManagement": true,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> orderRequestStatus({String? id, String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "id": 'ff8081818e9dc0fa018e9e81019000ef',
            "securityTypes": [],
            "cashOrReceivable": 'CASH',
            "dateCreated": '2024-04-02T11:10:38Z',
            "cashMargin": false,
            "securitySettlementType": 'OMNIBUS_SETTLEMENT',
            "orderDate": '2024-04-02T11:10:00Z',
            "consumeBalance": false,
            "volume": 0,
            "targetComputation": 'VOLUME',
            "orderType": 'PURCHASE',
            "lastUpdated": '2024-04-02T11:10:40Z',
            "amountFromClientSettlement": false,
            "channel": 'VODAFONE',
            "notes": 'from Enscript USSD App',
            "externalTxnId": 'ff8081818dabb615018dac0bc3d2000b-c3d2000bd61600111110',
            "exchangeRate": 1,
            "commission": 0,
            "collectionRuleSet": [],
            "bestEffort": false,
            "tradeTicketList": [],
            "amount": 1,
            "fillStateHistoryList": [ { id: 'ff8081818e9dc0fa018e9e81019000f0' } ],
            "exemptionList": [],
            "approvalList": [ { id: 'ff8081818e9dc0fa018e9e81019600f1' } ],
            "fillState": 'PENDING',
            "createClientDepositLedgerTransaction": true,
            "serialised": 'PURCHASE for Edwin User with 1 of 0 on 02/04/2024 for [Test Mutual Fund-[MEDIUM_TERM]TMF]',
            "archived": false,
            "transactionDate": '2024-04-02T11:10:00Z',
            "securities": [ { id: 'ff8081818b46e138018b4825be3a1787' } ],
            "spread": 0,
            "accountServices": {
              "id": 'ff8081818dd4e8f0018dd5e4d6160011',
              "class": 'soupbroker.kyc.AccountServices',
              "serialised": 'Direct Account : Individual(Edwin User)'
            },
            "settlementAccount": {
              "id": 'ff8081818dabb615018dac0a7d770008',
              "class": 'soupbroker.finance.LedgerAccount',
              "serialised": 'Enscript USSD App[ Account Receivable < ASSET ] - GHS'
            },
            "requestChannel": {
              "id": 'ff8081818dabb615018dac0aefc70009',
              "class": 'soupbroker.setting.RequestChannel',
              "serialised": 'Enscript USSD App'
            },
            "paymentMethod": {
              "id": 'ff80818173b1adab0173b1ae3b3c0005',
              "class": 'soupbroker.finance.PaymentMethod',
              "serialised": 'MoMo'
            },
            "security": {
              "id": 'ff8081818b46e138018b4825be3a1787',
              "class": 'soupbroker.trading.Security',
              "serialised": 'Test Mutual Fund-[MEDIUM_TERM]TMF | Mutual Fund - CIS - Collective Investment Schemes - EQUITY'
            },
            "currency": null,
            "baseCurrency": 'GHS',
            "quickReference": '019000EF',
            "simpleID": 'PURCHASE for Edwin User with 1 of 0 on 02/04/2024 for [Test Mutual Fund-[MEDIUM_TERM]TMF]',
            "class": 'soupbroker.trading.OrderRequest'
          }
      );
    }
    String endpoint = "${ORDER_REQUEST_STATUS}${id}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> createOrderRequest({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "success": true,
            "message": "Successfully created orderRequest for account",
            "orderRequest": {
              "id": "ff8081818e617ac0018e61f4565100af",
              "securityTypes": null,
              "cashOrReceivable": {
                "enumType": "soupbroker.trading.CashOrReceivableType",
                "name": "CASH"
              },
              "dateCreated": "2024-03-21T16:59:46Z",
              "receivedBy": null,
              "cashMargin": false,
              "requestChannel": { "id": "ff8081818dabb615018dac0aefc70009" },
              "relatedOrderRequestList": null,
              "securitySettlementType": {
                "enumType": "soupbroker.trading.SecuritySettlementType",
                "name": "OMNIBUS_SETTLEMENT"
              },
              "state": null,
              "orderDate": "2024-03-21T16:59:00Z",
              "consumeBalance": false,
              "volume": 0,
              "currency": null,
              "termToMaturity": null,
              "client": null,
              "targetComputation": {
                "enumType": "soupbroker.trading.TargetComputation",
                "name": "VOLUME"
              },
              "orderType": { "enumType": "soupbroker.trading.OrderType", "name": "PURCHASE" },
              "couponState": null,
              "price": null,
              "lastUpdated": "2024-03-21T16:59:47Z",
              "amountFromClientSettlement": false,
              "channel": "VODAFONE",
              "notes": "from Enscript USSD App",
              "externalTxnId": "ff8081818dabb615018dac0bc3d2000b-c3d2000bd61600111659",
              "exchangeRate": 1,
              "commission": 0,
              "settlementBankAccount": null,
              "collectionRuleSet": null,
              "bestEffort": false,
              "tradeTicketList": null,
              "amount": 300,
              "paymentStatusList": null,
              "fillStateHistoryList": [ ["Object"] ],
              "exemptionList": [],
              "authorizedBy": null,
              "ledgerTransaction": null,
              "securityTemplate": null,
              "approvalList": [ ["Object"] ],
              "parentOrderRequest": null,
              "fillState": { "enumType": "soupbroker.FillState", "name": "PENDING" },
              "lastSent": null,
              "createClientDepositLedgerTransaction": true,
              "brokeringAgent": null,
              "callback": null,
              "paymentMethod": { "id": "ff80818173b1adab0173b1ae3b3c0005" },
              "serialised": "PURCHASE for Edwin User with 300 of 0 on 21/03/2024 for [Test Mutual Fund-[MEDIUM_TERM]TMF]",
              "settlementAccount": { "id": "ff8081818dabb615018dac0a7d770008" },
              "goodUntil": null,
              "archived": false,
              "transactionDate": "2024-03-21T16:59:00Z",
              "accountServices": { "id": "ff8081818dd4e8f0018dd5e4d6160011" },
              "securities": [ ["Object"] ],
              "orderRequestFileList": null,
              "spread": 0
            },
            "payment": {
              "error": true,
              "message": "Could not process payment since conditions didn't pass"
            }
          }
      );
    }
    String endpoint = "${CREATE_ORDER_REQUEST}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> custodyStatement({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:[
            {
              "clientAccount": "Direct Account : Individual(Edwin User)",
              "clientList": [ ["Object"] ],
              "accountServices": {
                "id": "ff8081818dd4e8f0018dd5e4d6160011",
                "investmentObjective": null,
                "modelPortfolio": null
              },
              "issuer": "TMF",
              "security": {
                "id": "ff8081818b46e138018b4825be3a1787",
                "dateCreated": "2023-10-19T13:35:15Z",
                "floatingCouponList": ["Array"],
                "lastUpdated": "2023-12-04T11:02:02Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 0,
                "faceValueType": "INTEGER",
                "isin": "SYS-TMFMFC651",
                "enableRetail": false,
                "privateResource": false,
                "serialised": "Test Mutual Fund-[MEDIUM_TERM]TMF | Mutual Fund - CIS - Collective Investment Schemes - EQUITY",
                "archived": false,
                "issuer": ["Object"],
                "subType": ["Object"],
                "currency": null,
                "baseCurrency": "GHS",
                "quickReference": "BE3A1787",
                "simpleID": "Test Mutual Fund-[MEDIUM_TERM]TMF",
                "class": "soupbroker.trading.Security"
              },
              "coupon": null,
              "volume": 963,
              "accruedDaysToday": 0,
              "interestCollected": 0,
              "marketPrice": 0.55,
              "marketValue": 529.65,
              "totalDeposits": 500,
              "totalWithdrawals": null
            }
          ]
      );
    }
    String endpoint = "${CLIENT_CUSTODY_STATEMENT}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> orderRequestHistory({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:[
            {
              "id": "ff8081818dea5e2f018dea687c440018",
              "securityTypes": [],
              "cashOrReceivable": "CASH",
              "dateCreated": "2024-02-27T11:52:12Z",
              "cashMargin": false,
              "securitySettlementType": "HOUSE_SETTLEMENT",
              "state": "APPROVED",
              "orderDate": "2024-02-27T11:52:00Z",
              "consumeBalance": false,
              "volume": 600,
              "targetComputation": "VOLUME",
              "orderType": "PURCHASE",
              "price": 0.5,
              "lastUpdated": "2024-02-27T19:44:48Z",
              "amountFromClientSettlement": false,
              "channel": "VODAFONE",
              "notes": "from Enscript USSD App",
              "externalTxnId": "ff8081818dabb615018dac0bc3d2000b-c3d2000bd61600110652",
              "exchangeRate": 1,
              "commission": 0,
              "collectionRuleSet": [],
              "bestEffort": false,
              "tradeTicketList": [ ["Object"] ],
              "amount": 300,
              "fillStateHistoryList": [ ["Object"], ["Object"], ["Object"] ],
              "exemptionList": [],
              "approvalList": [ ["Object"], ["Object"] ],
              "fillState": "FILLED",
              "createClientDepositLedgerTransaction": true,
              "serialised": "PURCHASE for Edwin User with 300 of 600 on 27/02/2024 for [Test Mutual Fund-[MEDIUM_TERM]TMF]",
              "archived": true,
              "transactionDate": "2024-02-27T11:52:00Z",
              "securities": [ ["Object"] ],
              "spread": 0,
              "accountServices": {
                "id": "ff8081818dd4e8f0018dd5e4d6160011",
                "class": "soupbroker.kyc.AccountServices",
                "serialised": "Direct Account : Individual(Edwin User)"
              },
              "settlementAccount": {
                "id": "ff8081818dabb615018dac0a7d770008",
                "class": "soupbroker.finance.LedgerAccount",
                "serialised": "Enscript USSD App[ Account Receivable < ASSET ] - GHS"
              },
              "requestChannel": {
                "id": "ff8081818dabb615018dac0aefc70009",
                "class": "soupbroker.setting.RequestChannel",
                "serialised": "Enscript USSD App"
              },
              "paymentMethod": {
                "id": "ff80818173b1adab0173b1ae3b3c0005",
                "class": "soupbroker.finance.PaymentMethod",
                "serialised": "MoMo"
              },
              "security": {
                "id": "ff8081818b46e138018b4825be3a1787",
                "class": "soupbroker.trading.Security",
                "serialised": "Test Mutual Fund-[MEDIUM_TERM]TMF | Mutual Fund - CIS - Collective Investment Schemes - EQUITY"
              },
              "currency": null,
              "baseCurrency": "GHS",
              "quickReference": "7C440018",
              "simpleID": "PURCHASE for Edwin User with 300 of 600 on 27/02/2024 for [Test Mutual Fund-[MEDIUM_TERM]TMF]",
              "class": "soupbroker.trading.OrderRequest"
            }
          ]
      );
    }
    final queryParameters = { 'fields': currentFillState};
    String endpoint = "${ORDER_REQUEST_HISTORY}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, queryParameters: queryParameters, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> saveAccountServices({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "client":{
              "id": "ff8081818dd4e8f0018dd5e4d5ce0009",
              "bankDetailsList": [],
              "dateCreated": "2024-02-23T12:16:13Z",
              "USA_FATCA_ComplianceInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000a",
                "dateCreated": "2024-02-23T12:16:11Z",
                "percentageOwned": 0,
                "confirmNotifications": false,
                "lastUpdated": "2024-02-23T12:16:11Z",
                "serialised": "IndividualUSA_FATCA_ComplianceInformation()",
                "confirmConsent": false,
                "confirmInfo": false,
                "archived": false,
                "confirmWithholdAmount": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000A",
                "class": "soupbroker.kyc.IndividualUSA_FATCA_ComplianceInformation"
              },
              "proprietaryAgentAccount": false,
              "pinCode": "cbfad02f9ed2a8d1e08d8f74f5303e9eb93637d47f82ab6f1c15871cf8dd0481",
              "state": "PENDING",
              "pinResetAnswer": {
                "id": "ff8081818dd4e8f0018dd5e4d6430012",
                "dateCreated": "2024-02-23T12:16:14Z",
                "lastUpdated": "2024-02-23T12:16:14Z",
                "serialised": "What is your favourite food - s***p",
                "archived": false,
                "description": "What is your favourite food - s***p",
                "client": ["Object"],
                "pinResetQuestion": ["Object"],
                "baseCurrency": null,
                "quickReference": "D6430012",
                "class": "soupbroker.kyc.PinResetAnswer"
              },
              "kycClientGroupList": [ ["Object"] ],
              "addressInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000b",
                "dateCreated": "2024-02-23T12:16:12Z",
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualAddressInformation()",
                "archived": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000B",
                "class": "soupbroker.kyc.IndividualAddressInformation"
              },
              "employmentInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000c",
                "dateCreated": "2024-02-23T12:16:12Z",
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualEmploymentInformation()",
                "archived": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000C",
                "class": "soupbroker.kyc.IndividualEmploymentInformation"
              },
              "basicInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000d",
                "dateCreated": "2024-02-23T12:16:12Z",
                "firstName": "Edwin",
                "lastName": "User",
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualBasicInformation(Edwin, User)",
                "archived": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000D",
                "class": "soupbroker.kyc.IndividualBasicInformation"
              },
              "lastUpdated": "2024-03-01T09:03:18Z",
              "digitalAddressState": "PENDING",
              "serialised": "Individual(Edwin User)",
              "deleted": false,
              "identityInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000e",
                "dateCreated": "2024-02-23T12:16:12Z",
                "verified": false,
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualIdentityInformation()",
                "archived": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000E",
                "class": "soupbroker.kyc.IndividualIdentityInformation"
              },
              "isOrRelatedToPersonHoldingGovOffice": false,
              "emailContacts": [],
              "archived": false,
              "nextOfKin": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000f",
                "dateCreated": "2024-02-23T12:16:13Z",
                "lastUpdated": "2024-02-23T12:16:13Z",
                "serialised": "IndividualNextOfKin()",
                "archived": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000F",
                "class": "soupbroker.kyc.IndividualNextOfKin"
              },
              "isOrRelatedToPoliticalOffice": false,
              "accountServicesList": [ ["Object"] ],
              "isFATCA_Applicable": false,
              "account": { "id": "ff8081817217e9f3017217f19ccc0000" },
              "phoneContacts": [ ["Object"] ],
              "currency": "GHS",
              "baseCurrency": "GHS",
              "quickReference": "D5CE0009",
              "simpleID": "Edwin User",
              "class": "soupbroker.kyc.Individual"
            },
            "accountServicesList": [
              {
                "id": "ff8081818dd4e8f0018dd5e4d6160011",
                "propLedgerTarget": "CLIENT_INVESTMENT_LIABILITY",
                "emailClientCustodyStatement": true,
                "dateCreated": "2024-02-23T12:16:14Z",
                "emailClientValuationStatement": true,
                "emailClientSummaryStatement": true,
                "defaultAccountServices": false,
                "lastUpdated": "2024-02-26T19:48:03Z",
                "collectionRuleSet": [],
                "simpleNameWithoutIo": "Edwin User",
                "investmentTenor": 0,
                "bankDetailsList": [],
                "emailStatements": false,
                "emailClientTransactionStatement": true,
                "simpleName": "Edwin User",
                "serialised": "Direct \"Account \": Individual(Edwin User)",
                "archived": false,
                "collectStatements": false,
                "investmentFundAccount": ["Object"],
                "client": ["Object"],
                "currency": "GHS",
                "baseCurrency": "GHS",
                "quickReference": "D6160011",
                "class": "soupbroker.kyc.AccountServices"
              }
            ],
            "phoneContactList": [
              {
                "id": "ff8081818dd4e8f0018dd5e4d5ec0010",
                "dateCreated": "2024-02-23T12:16:13Z",
                "verified": false,
                "phone": "233207727274",
                "sourceName": "soupbroker.kyc.Individual",
                "lastUpdated": "2024-03-01T09:08:16Z",
                "serialised": "Tel: 233207727274 | PRIMARY | Individual(Edwin User)",
                "archived": false,
                "sourceId": "ff8081818dd4e8f0018dd5e4d5ce0009",
                "sourceProperty": "phoneContacts",
                "priority": "PRIMARY",
                "baseCurrency": null,
                "quickReference": "D5EC0010",
                "simpleID": "Tel: 233207727274 | PRIMARY | Individual(Edwin User)",
                "class": "soupbroker.PhoneContact"
              }
            ],
            "emailContactList": [],
            "securityList": [
              {
                "id": "ff8081818b41bae0018b4223bf7007a7",
                "dateCreated": "2023-10-18T09:35:20Z",
                "floatingCouponList": [],
                "lastUpdated": "2024-02-27T17:38:38Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 5,
                "faceValueType": "INTEGER",
                "isin": "SYS-ADPFOSE923",
                "enableRetail": true,
                "privateResource": false,
                "serialised": "Adepa Fund-[LONG_TERM]ADPF | Ordinary Shares - Equity - Equity & Shares - EQUITY",
                "archived": false,
                "issuer": ["Object"],
                "subType": ["Object"],
                "currency": "GHS",
                "baseCurrency": "GHS",
                "quickReference": "BF7007A7",
                "simpleID": "Adepa Fund-[LONG_TERM]ADPF",
                "class": "soupbroker.trading.Security"
              },
              {
                "id": "ff808181762d3b5f01762d6905f90003",
                "dateCreated": "2020-12-04T11:00:26Z",
                "floatingCouponList": [],
                "lastUpdated": "2023-11-08T11:08:32Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 0,
                "faceValueType": "DECIMAL",
                "isin": "AIMFC986",
                "enableRetail": false,
                "privateResource": false,
                "coupon": 0,
                "serialised": "Freedom Fund Unit Trust-FFUT | Mutual Fund - CIS - Collective Investment Schemes - EQUITY",
                "archived": false,
                "issuer": ["Object"],
                "subType": ["Object"],
                "currency": "GHS",
                "baseCurrency": "GHS",
                "quickReference": "05F90003",
                "simpleID": "Freedom Fund Unit Trust-FFUT",
                "class": "soupbroker.trading.Security"
              },
              {
                "id": "ff8081818b46e138018b4825be3a1787",
                "dateCreated": "2023-10-19T13:35:15Z",
                "floatingCouponList": ["Array"],
                "lastUpdated": "2023-12-04T11:02:02Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 0,
                "faceValueType": "INTEGER",
                "isin": "SYS-TMFMFC651",
                "enableRetail": false,
                "privateResource": false,
                "serialised": "Test Mutual Fund-[MEDIUM_TERM]TMF | Mutual Fund - CIS - Collective Investment Schemes - EQUITY",
                "archived": false,
                "issuer": ["Object"],
                "subType": ["Object"],
                "currency": null,
                "baseCurrency": "GHS",
                "quickReference": "BE3A1787",
                "simpleID": "Test Mutual Fund-[MEDIUM_TERM]TMF",
                "class": "soupbroker.trading.Security"
              }]
          }
      );
    }
    String endpoint = "${SAVE_ACCOUNT_SERVICE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> updateAccountServices({String? id, Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "client":{
              "id": "ff8081818dd4e8f0018dd5e4d5ce0009",
              "bankDetailsList": [],
              "dateCreated": "2024-02-23T12:16:13Z",
              "USA_FATCA_ComplianceInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000a",
                "dateCreated": "2024-02-23T12:16:11Z",
                "percentageOwned": 0,
                "confirmNotifications": false,
                "lastUpdated": "2024-02-23T12:16:11Z",
                "serialised": "IndividualUSA_FATCA_ComplianceInformation()",
                "confirmConsent": false,
                "confirmInfo": false,
                "archived": false,
                "confirmWithholdAmount": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000A",
                "class": "soupbroker.kyc.IndividualUSA_FATCA_ComplianceInformation"
              },
              "proprietaryAgentAccount": false,
              "pinCode": "cbfad02f9ed2a8d1e08d8f74f5303e9eb93637d47f82ab6f1c15871cf8dd0481",
              "state": "PENDING",
              "pinResetAnswer": {
                "id": "ff8081818dd4e8f0018dd5e4d6430012",
                "dateCreated": "2024-02-23T12:16:14Z",
                "lastUpdated": "2024-02-23T12:16:14Z",
                "serialised": "What is your favourite food - s***p",
                "archived": false,
                "description": "What is your favourite food - s***p",
                "client": ["Object"],
                "pinResetQuestion": ["Object"],
                "baseCurrency": null,
                "quickReference": "D6430012",
                "class": "soupbroker.kyc.PinResetAnswer"
              },
              "kycClientGroupList": [ ["Object"] ],
              "addressInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000b",
                "dateCreated": "2024-02-23T12:16:12Z",
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualAddressInformation()",
                "archived": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000B",
                "class": "soupbroker.kyc.IndividualAddressInformation"
              },
              "employmentInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000c",
                "dateCreated": "2024-02-23T12:16:12Z",
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualEmploymentInformation()",
                "archived": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000C",
                "class": "soupbroker.kyc.IndividualEmploymentInformation"
              },
              "basicInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000d",
                "dateCreated": "2024-02-23T12:16:12Z",
                "firstName": "Edwin",
                "lastName": "User",
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualBasicInformation(Edwin, User)",
                "archived": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000D",
                "class": "soupbroker.kyc.IndividualBasicInformation"
              },
              "lastUpdated": "2024-03-01T09:03:18Z",
              "digitalAddressState": "PENDING",
              "serialised": "Individual(Edwin User)",
              "deleted": false,
              "identityInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000e",
                "dateCreated": "2024-02-23T12:16:12Z",
                "verified": false,
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualIdentityInformation()",
                "archived": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000E",
                "class": "soupbroker.kyc.IndividualIdentityInformation"
              },
              "isOrRelatedToPersonHoldingGovOffice": false,
              "emailContacts": [],
              "archived": false,
              "nextOfKin": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000f",
                "dateCreated": "2024-02-23T12:16:13Z",
                "lastUpdated": "2024-02-23T12:16:13Z",
                "serialised": "IndividualNextOfKin()",
                "archived": false,
                "individual": ["Object"],
                "baseCurrency": null,
                "quickReference": "D5CE000F",
                "class": "soupbroker.kyc.IndividualNextOfKin"
              },
              "isOrRelatedToPoliticalOffice": false,
              "accountServicesList": [ ["Object"] ],
              "isFATCA_Applicable": false,
              "account": { "id": "ff8081817217e9f3017217f19ccc0000" },
              "phoneContacts": [ ["Object"] ],
              "currency": "GHS",
              "baseCurrency": "GHS",
              "quickReference": "D5CE0009",
              "simpleID": "Edwin User",
              "class": "soupbroker.kyc.Individual"
            },
            "accountServicesList": [
              {
                "id": "ff8081818dd4e8f0018dd5e4d6160011",
                "propLedgerTarget": "CLIENT_INVESTMENT_LIABILITY",
                "emailClientCustodyStatement": true,
                "dateCreated": "2024-02-23T12:16:14Z",
                "emailClientValuationStatement": true,
                "emailClientSummaryStatement": true,
                "defaultAccountServices": false,
                "lastUpdated": "2024-02-26T19:48:03Z",
                "collectionRuleSet": [],
                "simpleNameWithoutIo": "Edwin User",
                "investmentTenor": 0,
                "bankDetailsList": [],
                "emailStatements": false,
                "emailClientTransactionStatement": true,
                "simpleName": "Edwin User",
                "serialised": "Direct \"Account \": Individual(Edwin User)",
                "archived": false,
                "collectStatements": false,
                "investmentFundAccount": ["Object"],
                "client": ["Object"],
                "currency": "GHS",
                "baseCurrency": "GHS",
                "quickReference": "D6160011",
                "class": "soupbroker.kyc.AccountServices"
              }
            ],
            "phoneContactList": [
              {
                "id": "ff8081818dd4e8f0018dd5e4d5ec0010",
                "dateCreated": "2024-02-23T12:16:13Z",
                "verified": false,
                "phone": "233207727274",
                "sourceName": "soupbroker.kyc.Individual",
                "lastUpdated": "2024-03-01T09:08:16Z",
                "serialised": "Tel: 233207727274 | PRIMARY | Individual(Edwin User)",
                "archived": false,
                "sourceId": "ff8081818dd4e8f0018dd5e4d5ce0009",
                "sourceProperty": "phoneContacts",
                "priority": "PRIMARY",
                "baseCurrency": null,
                "quickReference": "D5EC0010",
                "simpleID": "Tel: 233207727274 | PRIMARY | Individual(Edwin User)",
                "class": "soupbroker.PhoneContact"
              }
            ],
            "emailContactList": [],
            "securityList": [
              {
                "id": "ff8081818b41bae0018b4223bf7007a7",
                "dateCreated": "2023-10-18T09:35:20Z",
                "floatingCouponList": [],
                "lastUpdated": "2024-02-27T17:38:38Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 5,
                "faceValueType": "INTEGER",
                "isin": "SYS-ADPFOSE923",
                "enableRetail": true,
                "privateResource": false,
                "serialised": "Adepa Fund-[LONG_TERM]ADPF | Ordinary Shares - Equity - Equity & Shares - EQUITY",
                "archived": false,
                "issuer": ["Object"],
                "subType": ["Object"],
                "currency": "GHS",
                "baseCurrency": "GHS",
                "quickReference": "BF7007A7",
                "simpleID": "Adepa Fund-[LONG_TERM]ADPF",
                "class": "soupbroker.trading.Security"
              },
              {
                "id": "ff808181762d3b5f01762d6905f90003",
                "dateCreated": "2020-12-04T11:00:26Z",
                "floatingCouponList": [],
                "lastUpdated": "2023-11-08T11:08:32Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 0,
                "faceValueType": "DECIMAL",
                "isin": "AIMFC986",
                "enableRetail": false,
                "privateResource": false,
                "coupon": 0,
                "serialised": "Freedom Fund Unit Trust-FFUT | Mutual Fund - CIS - Collective Investment Schemes - EQUITY",
                "archived": false,
                "issuer": ["Object"],
                "subType": ["Object"],
                "currency": "GHS",
                "baseCurrency": "GHS",
                "quickReference": "05F90003",
                "simpleID": "Freedom Fund Unit Trust-FFUT",
                "class": "soupbroker.trading.Security"
              },
              {
                "id": "ff8081818b46e138018b4825be3a1787",
                "dateCreated": "2023-10-19T13:35:15Z",
                "floatingCouponList": ["Array"],
                "lastUpdated": "2023-12-04T11:02:02Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 0,
                "faceValueType": "INTEGER",
                "isin": "SYS-TMFMFC651",
                "enableRetail": false,
                "privateResource": false,
                "serialised": "Test Mutual Fund-[MEDIUM_TERM]TMF | Mutual Fund - CIS - Collective Investment Schemes - EQUITY",
                "archived": false,
                "issuer": ["Object"],
                "subType": ["Object"],
                "currency": null,
                "baseCurrency": "GHS",
                "quickReference": "BE3A1787",
                "simpleID": "Test Mutual Fund-[MEDIUM_TERM]TMF",
                "class": "soupbroker.trading.Security"
              }]
          }
      );
    }
    String endpoint = "${UPDATE_ACCOUNT_SERVICE}.json";
    FormData formData = FormData.fromMap(data!);
    formData.fields.add(MapEntry("id", id!));
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> checkDepositProcess({@required String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "success": "Found client with requested contact",
            "client": {
              "id": "ff8081818dd4e8f0018dd5e4d5ce0009",
              "bankDetailsList": [],
              "dateCreated": "2024-02-23T12:16:13Z",
              "USA_FATCA_ComplianceInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000a",
                "dateCreated": "2024-02-23T12:16:11Z",
                "percentageOwned": 0,
                "confirmNotifications": false,
                "lastUpdated": "2024-02-23T12:16:11Z",
                "serialised": "IndividualUSA_FATCA_ComplianceInformation()",
                "confirmConsent": false,
                "confirmInfo": false,
                "archived": false,
                "confirmWithholdAmount": false,
                "individual": "[Object]",
                "baseCurrency": null,
                "quickReference": "D5CE000A",
                "class": "soupbroker.kyc.IndividualUSA_FATCA_ComplianceInformation"
              },
              "proprietaryAgentAccount": false,
              "pinCode": "79f06f8fde333461739f220090a23cb2a79f6d714bee100d0e4b4af249294619",
              "state": "PENDING",
              "pinResetAnswer": {
                "id": "ff8081818dd4e8f0018dd5e4d6430012",
                "dateCreated": "2024-02-23T12:16:14Z",
                "lastUpdated": "2024-03-27T16:16:02Z",
                "serialised": "What is your favourite food - s***p",
                "archived": false,
                "description": "What is your favourite food - s***p",
                "client": "[Object]",
                "pinResetQuestion": "[Object]",
                "baseCurrency": null,
                "quickReference": "D6430012",
                "class": "soupbroker.kyc.PinResetAnswer"
              },
              "kycClientGroupList": [
                [
                  "Object"
                ]
              ],
              "addressInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000b",
                "dateCreated": "2024-02-23T12:16:12Z",
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualAddressInformation()",
                "archived": false,
                "individual": "[Object]",
                "baseCurrency": null,
                "quickReference": "D5CE000B",
                "class": "soupbroker.kyc.IndividualAddressInformation"
              },
              "employmentInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000c",
                "dateCreated": "2024-02-23T12:16:12Z",
                "lastUpdated": "2024-02-23T12:16:12Z",
                "serialised": "IndividualEmploymentInformation()",
                "archived": false,
                "individual": "[Object]",
                "baseCurrency": null,
                "quickReference": "D5CE000C",
                "class": "soupbroker.kyc.IndividualEmploymentInformation"
              },
              "basicInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000d",
                "dateCreated": "2024-02-23T12:16:12Z",
                "firstName": "Edwin",
                "dateOfBirth": "2003-07-14T00:00:00Z",
                "lastName": "User",
                "lastUpdated": "2024-03-26T10:57:10Z",
                "serialised": "IndividualBasicInformation(Edwin, User, MALE)",
                "gender": "MALE",
                "archived": false,
                "individual": "[Object]",
                "baseCurrency": null,
                "quickReference": "D5CE000D",
                "class": "soupbroker.kyc.IndividualBasicInformation"
              },
              "lastUpdated": "2024-03-26T10:57:10Z",
              "digitalAddressState": "PENDING",
              "serialised": "Individual(Edwin User)",
              "deleted": false,
              "identityInformation": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000e",
                "dateCreated": "2024-02-23T12:16:12Z",
                "verified": false,
                "ID_Number": "GHA-123456789-9",
                "lastUpdated": "2024-03-25T15:23:49Z",
                "serialised": "IndividualIdentityInformation(National ID, GHA-123456789-9)",
                "archived": false,
                "individual": "[Object]",
                "identityType": "[Object]",
                "baseCurrency": null,
                "quickReference": "D5CE000E",
                "class": "soupbroker.kyc.IndividualIdentityInformation"
              },
              "isOrRelatedToPersonHoldingGovOffice": false,
              "emailContacts": [],
              "archived": false,
              "nextOfKin": {
                "id": "ff8081818dd4e8f0018dd5e4d5ce000f",
                "dateCreated": "2024-02-23T12:16:13Z",
                "lastUpdated": "2024-02-23T12:16:13Z",
                "serialised": "IndividualNextOfKin()",
                "archived": false,
                "individual": "[Object]",
                "baseCurrency": null,
                "quickReference": "D5CE000F",
                "class": "soupbroker.kyc.IndividualNextOfKin"
              },
              "isOrRelatedToPoliticalOffice": false,
              "accountServicesList": [
                [
                  "Object"
                ]
              ],
              "isFATCA_Applicable": false,
              "account": {
                "id": "ff8081817217e9f3017217f19ccc0000"
              },
              "phoneContacts": [
                [
                  "Object"
                ]
              ],
              "currency": "GHS",
              "baseCurrency": "GHS",
              "quickReference": "D5CE0009",
              "simpleID": "Edwin User",
              "class": "soupbroker.kyc.Individual"
            },
            "accountServicesList": [
              {
                "id": "ff8081818dd4e8f0018dd5e4d6160011",
                "propLedgerTarget": "CLIENT_INVESTMENT_LIABILITY",
                "emailClientCustodyStatement": true,
                "dateCreated": "2024-02-23T12:16:14Z",
                "emailClientValuationStatement": true,
                "emailClientSummaryStatement": true,
                "defaultAccountServices": false,
                "lastUpdated": "2024-02-26T19:48:03Z",
                "collectionRuleSet": [],
                "simpleNameWithoutIo": "Edwin User",
                "investmentTenor": 0,
                "bankDetailsList": [],
                "emailStatements": false,
                "emailClientTransactionStatement": true,
                "simpleName": "Edwin User",
                "serialised": "Direct Account : Individual(Edwin User)",
                "archived": false,
                "collectStatements": false,
                "investmentFundAccount": "[Object]",
                "client": "[Object]",
                "currency": "GHS",
                "baseCurrency": "GHS",
                "quickReference": "D6160011",
                "class": "soupbroker.kyc.AccountServices"
              }
            ],
            "phoneContactList": [
              {
                "id": "ff8081818dd4e8f0018dd5e4d5ec0010",
                "dateCreated": "2024-02-23T12:16:13Z",
                "verified": false,
                "phone": "233207727274",
                "sourceName": "soupbroker.kyc.Individual",
                "lastUpdated": "2024-03-23T13:29:57Z",
                "serialised": "Tel: 233207727274 | PRIMARY | Individual(Edwin User)",
                "archived": false,
                "sourceId": "ff8081818dd4e8f0018dd5e4d5ce0009",
                "sourceProperty": "phoneContacts",
                "priority": "PRIMARY",
                "baseCurrency": null,
                "quickReference": "D5EC0010",
                "simpleID": "Tel: 233207727274 | PRIMARY | Individual(Edwin User)",
                "class": "soupbroker.common.PhoneContact"
              }
            ],
            "emailContactList": [],
            "securityList": [
              {
                "id": "ff8081818b41bae0018b4223bf7007a7",
                "dateCreated": "2023-10-18T09:35:20Z",
                "floatingCouponList": [],
                "lastUpdated": "2024-02-27T17:38:38Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 5,
                "faceValueType": "INTEGER",
                "isin": "SYS-ADPFOSE923",
                "enableRetail": true,
                "privateResource": false,
                "serialised": "Adepa Fund-[LONG_TERM]ADPF | Ordinary Shares - Equity - Equity & Shares - EQUITY",
                "archived": false,
                "issuer": "[Object]",
                "subType": "[Object]",
                "currency": "GHS",
                "baseCurrency": "GHS",
                "quickReference": "BF7007A7",
                "simpleID": "Adepa Fund-[LONG_TERM]ADPF",
                "class": "soupbroker.trading.Security"
              },
              {
                "id": "ff808181762d3b5f01762d6905f90003",
                "dateCreated": "2020-12-04T11:00:26Z",
                "floatingCouponList": [],
                "lastUpdated": "2023-11-08T11:08:32Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 0,
                "faceValueType": "DECIMAL",
                "isin": "AIMFC986",
                "enableRetail": false,
                "privateResource": false,
                "coupon": 0,
                "serialised": "Freedom Fund Unit Trust-FFUT | Mutual Fund - CIS - Collective Investment Schemes - EQUITY",
                "archived": false,
                "issuer": "[Object]",
                "subType": "[Object]",
                "currency": "GHS",
                "baseCurrency": "GHS",
                "quickReference": "05F90003",
                "simpleID": "Freedom Fund Unit Trust-FFUT",
                "class": "soupbroker.trading.Security"
              },
              {
                "id": "ff8081818b46e138018b4825be3a1787",
                "dateCreated": "2023-10-19T13:35:15Z",
                "floatingCouponList": "[Array]",
                "lastUpdated": "2023-12-04T11:02:02Z",
                "cleanPricePrecisionRounding": 0,
                "tenor": 0,
                "faceValueType": "INTEGER",
                "isin": "SYS-TMFMFC651",
                "enableRetail": false,
                "privateResource": false,
                "serialised": "Test Mutual Fund-[MEDIUM_TERM]TMF | Mutual Fund - CIS - Collective Investment Schemes - EQUITY",
                "archived": false,
                "issuer": "[Object]",
                "subType": "[Object]",
                "currency": null,
                "baseCurrency": "GHS",
                "quickReference": "BE3A1787",
                "simpleID": "Test Mutual Fund-[MEDIUM_TERM]TMF",
                "class": "soupbroker.trading.Security"
              }
            ]
          }
      );
    }
    String endpoint = "${CHECK_DEPOSIT_AND_WITHDRAWAL_PROCESS}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  /***PIN MANAGEMENT****/
  Future<SDKServiceResponse<dynamic>> getPinResetQuestions({int max = 100, String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:[
            {
              "id": "ff8081817c94fef0017c95065f8f0004",
              "dateCreated": "2021-10-18T20:09:55Z",
              "lastUpdated": "2024-02-23T12:15:54Z",
              "serialised": "What is your favourite food",
              "archived": false,
              "priority": 4,
              "description": "What is your favourite food",
              "account": {
                "id": "ff8081817217e9f3017217f19ccc0000",
                "class": "soupbroker.Account",
                "serialised": "Account(Demo Securities & Asset Limited, Licensed Broker-Dealer)"
              },
              "totalCount": 5,
              "baseCurrency": null,
              "quickReference": "5F8F0004",
              "class": "soupbroker.kyc.PinResetQuestion"
            },
            {
              "id": "ff8081817c94fef0017c9505b0930003",
              "dateCreated": "2021-10-18T20:09:10Z",
              "lastUpdated": "2021-11-21T20:24:02Z",
              "serialised": "Where did you meet your spouse",
              "archived": false,
              "priority": 5,
              "description": "Where did you meet your spouse",
              "account": {
                "id": "ff8081817217e9f3017217f19ccc0000",
                "class": "soupbroker.Account",
                "serialised": "Account(Demo Securities & Asset Limited, Licensed Broker-Dealer)"
              },
              "totalCount": 5,
              "baseCurrency": null,
              "quickReference": "B0930003",
              "class": "soupbroker.kyc.PinResetQuestion"
            },
            {
              "id": "ff8081817c94fef0017c95049c2e0002",
              "dateCreated": "2021-10-18T20:07:59Z",
              "lastUpdated": "2024-02-20T14:49:23Z",
              "serialised": "What is the name of the area you grew up",
              "archived": false,
              "priority": 3,
              "description": "What is the name of the area you grew up",
              "account": {
                "id": "ff8081817217e9f3017217f19ccc0000",
                "class": "soupbroker.Account",
                "serialised": "Account(Demo Securities & Asset Limited, Licensed Broker-Dealer)"
              },
              "totalCount": 5,
              "baseCurrency": null,
              "quickReference": "9C2E0002",
              "class": "soupbroker.kyc.PinResetQuestion"
            },
            {
              "id": "ff8081817c94fef0017c95044edf0001",
              "dateCreated": "2021-10-18T20:07:39Z",
              "lastUpdated": "2024-02-28T17:05:21Z",
              "serialised": "What is your favourite subject in primary school",
              "archived": false,
              "priority": 2,
              "description": "What is your favourite subject in primary school",
              "account": {
                "id": "ff8081817217e9f3017217f19ccc0000",
                "class": "soupbroker.Account",
                "serialised": "Account(Demo Securities & Asset Limited, Licensed Broker-Dealer)"
              },
              "totalCount": 5,
              "baseCurrency": null,
              "quickReference": "4EDF0001",
              "class": "soupbroker.kyc.PinResetQuestion"
            },
            {
              "id": "ff8081817c94fef0017c9503d5050000",
              "dateCreated": "2021-10-18T20:07:08Z",
              "lastUpdated": "2021-11-21T20:23:32Z",
              "serialised": "What is the name of your first boss at work",
              "archived": false,
              "priority": 1,
              "description": "What is the name of your first boss at work",
              "account": {
                "id": "ff8081817217e9f3017217f19ccc0000",
                "class": "soupbroker.Account",
                "serialised": "Account(Demo Securities & Asset Limited, Licensed Broker-Dealer)"
              },
              "totalCount": 5,
              "baseCurrency": null,
              "quickReference": "D5050000",
              "class": "soupbroker.kyc.PinResetQuestion"
            }
          ]
      );
    }
    String endpoint = "${PIN_RESET_QUESTIONS}.json?max=${max}";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> requestPinReset({required String method, String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
        data: {
          "message": null,
          "success": true,
          "authCode": '48458',
        },
      );
    }
    String endpoint = "${REQUEST_PIN_RESET}.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> savePinReset({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data: {
            "success": 'Pin reset completed successfully',
          }
      );
    }
    String endpoint = "${REQUEST_PIN_RESET}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> confirmResetPin({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${CONFIRM_PIN_RESET}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> changePin({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "message": 'Pin Code changed notification sent via email/sms to contact details on file',
            "success": true
          }
      );
    }
    String endpoint = "${CHANGE_PIN_RESET}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> createPin({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${CREATE_PIN_RESET}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  /**Security & Asset management**/
  Future<SDKServiceResponse<dynamic>> createSecuritySubTypeAssetAllocation({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${CREATE_SECURITY_SUB_TYPE_ASSET_ALLOCATION}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> getSecurityFlow({String? contact, Map<String, dynamic>? filter}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${SECURITY_FLOWS}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> createSecurityAssetAllocation({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${SECURITY_ASSET_ALLOCATION}.json";;
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> smsNumber({String? smsNumber, String? smsContent}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${SEND_SMS_MESSAGE}.json";
    final queryParameters = {
      'smsNumber': smsNumber,
      'smsContent': smsContent,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<dynamic>> annualGrossIncome({int maxPage = 100}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:[
            {
              "id": 'ff80818187c6e44d0187c71b0169033d',
              "dateCreated": '2023-04-28T09:04:08Z',
              "callback": 'Test',
              "lastUpdated": '2023-04-28T09:04:08Z',
              "serialised": 'MonthlyGrossIncome(6000-7000)',
              "archived": false,
              "description": '6000-7000',
              "totalCount": 7,
              "baseCurrency": null,
              "quickReference": '0169033D',
              "class": 'soupbroker.kyc.MonthlyGrossIncome'
            },
            {
              "id": 'ff80818186ef248b0186fe61bb7e1137',
              "dateCreated": '2023-03-20T09:37:43Z',
              "lastUpdated": '2023-03-20T09:38:03Z',
              "serialised": 'MonthlyGrossIncome(Between GHS 5,000 - GHS 10,000)',
              "archived": false,
              "description": 'Between GHS 5,000 - GHS 10,000',
              "account": {
                "id": 'ff8081817217e9f3017217f19ccc0000',
                "class": 'soupbroker.Account',
                "serialised": 'Account(Demo Securities & Asset Limited, Licensed Broker-Dealer)'
              },
              "totalCount": 7,
              "baseCurrency": null,
              "quickReference": 'BB7E1137',
              "class": 'soupbroker.kyc.MonthlyGrossIncome'
            },
            {
              "id": 'ff808181708af4cc01708af520c30000',
              "dateCreated": '2020-02-28T08:41:25Z',
              "lastUpdated": '2020-02-28T08:41:25Z',
              "serialised": 'MonthlyGrossIncome(Below GHS 100)',
              "archived": false,
              "description": 'Below GHS 100',
              "totalCount": 7,
              "baseCurrency": null,
              "quickReference": '20C30000',
              "class": 'soupbroker.kyc.MonthlyGrossIncome'
            },
            {
              "id": 'ff808181708af4cc01708af5212d0002',
              "dateCreated": '2020-02-28T08:41:25Z',
              "lastUpdated": '2023-04-28T09:03:22Z',
              "serialised": 'MonthlyGrossIncome(Between GHS 100 - GHS 600)',
              "archived": false,
              "description": 'Between GHS 100 - GHS 600',
              "totalCount": 7,
              "baseCurrency": null,
              "quickReference": '212D0002',
              "class": 'soupbroker.kyc.MonthlyGrossIncome'
            },
            {
              "id": 'ff808181708af4cc01708af521380003',
              "dateCreated": '2020-02-28T08:41:25Z',
              "lastUpdated": '2020-02-28T08:41:25Z',
              "serialised": 'MonthlyGrossIncome(Between GHS 500 - GHS 1,000)',
              "archived": false,
              "description": 'Between GHS 500 - GHS 1,000',
              "totalCount": 7,
              "baseCurrency": null,
              "quickReference": '21380003',
              "class": 'soupbroker.kyc.MonthlyGrossIncome'
            },
            {
              "id": 'ff808181708af4cc01708af521450005',
              "dateCreated": '2020-02-28T08:41:25Z',
              "lastUpdated": '2024-04-09T15:48:05Z',
              "serialised": 'MonthlyGrossIncome(Between GHS 1,000 - GHS 5,000)',
              "archived": false,
              "description": 'Between GHS 1,000 - GHS 5,000',
              "totalCount": 7,
              "baseCurrency": null,
              "quickReference": '21450005',
              "class": 'soupbroker.kyc.MonthlyGrossIncome'
            },
            {
              "id": 'ff808181708af4cc01708af5214a0006',
              "dateCreated": '2020-02-28T08:41:25Z',
              "lastUpdated": '2023-03-20T09:37:24Z',
              "serialised": 'MonthlyGrossIncome(Above GHS 10,000)',
              "archived": false,
              "description": 'Above GHS 10,000',
              "account": {
                "id": 'ff8081817217e9f3017217f19ccc0000',
                "class": 'soupbroker.Account',
                "serialised": 'Account(Demo Securities & Asset Limited, Licensed Broker-Dealer)'
              },
              "totalCount": 7,
              "baseCurrency": null,
              "quickReference": '214A0006',
              "class": 'soupbroker.kyc.MonthlyGrossIncome'
            }
          ]
      );
    }
    String endpoint = "${LOAD_ALL_ANNUAL_GROSS_INCOME}.json?max=$maxPage";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<dynamic>> monthlyGrossIncome({int maxPage = 100}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:[
            {
              "id": 'ff80818187c6e44d0187c71b0169033d',
              "dateCreated": '2023-04-28T09:04:08Z',
              "callback": 'Test',
              "lastUpdated": '2023-04-28T09:04:08Z',
              "serialised": 'MonthlyGrossIncome(6000-7000)',
              "archived": false,
              "description": '6000-7000',
              "totalCount": 7,
              "baseCurrency": null,
              "quickReference": '0169033D',
              "class": 'soupbroker.kyc.MonthlyGrossIncome'
            },
            {
              "id": 'ff80818186ef248b0186fe61bb7e1137',
              "dateCreated": '2023-03-20T09:37:43Z',
              "lastUpdated": '2023-03-20T09:38:03Z',
              "serialised": 'MonthlyGrossIncome(Between GHS 5,000 - GHS 10,000)',
              "archived": false,
              "description": 'Between GHS 5,000 - GHS 10,000',
              "account": {
                "id": 'ff8081817217e9f3017217f19ccc0000',
                "class": 'soupbroker.Account',
                "serialised": 'Account(Demo Securities & Asset Limited, Licensed Broker-Dealer)'
              },
              "totalCount": 7,
              "baseCurrency": null,
              "quickReference": 'BB7E1137',
              "class": 'soupbroker.kyc.MonthlyGrossIncome'
            },
            {
              "id": 'ff808181708af4cc01708af520c30000',
              "dateCreated": '2020-02-28T08:41:25Z',
              "lastUpdated": '2020-02-28T08:41:25Z',
              "serialised": 'MonthlyGrossIncome(Below GHS 100)',
              "archived": false,
              "description": 'Below GHS 100',
              "totalCount": 7,
              "baseCurrency": null,
              "quickReference": '20C30000',
              "class": 'soupbroker.kyc.MonthlyGrossIncome'
            },
            {
              "id": 'ff808181708af4cc01708af5212d0002',
              "dateCreated": '2020-02-28T08:41:25Z',
              "lastUpdated": '2023-04-28T09:03:22Z',
              "serialised": 'MonthlyGrossIncome(Between GHS 100 - GHS 600)',
              "archived": false,
              "description": 'Between GHS 100 - GHS 600',
              "totalCount": 7,
              "baseCurrency": null,
              "quickReference": '212D0002',
              "class": 'soupbroker.kyc.MonthlyGrossIncome'
            },
            {
              "id": 'ff808181708af4cc01708af521380003',
              "dateCreated": '2020-02-28T08:41:25Z',
              "lastUpdated": '2020-02-28T08:41:25Z',
              "serialised": 'MonthlyGrossIncome(Between GHS 500 - GHS 1,000)',
              "archived": false,
              "description": 'Between GHS 500 - GHS 1,000',
              "totalCount": 7,
              "baseCurrency": null,
              "quickReference": '21380003',
              "class": 'soupbroker.kyc.MonthlyGrossIncome'
            },
            {
              "id": 'ff808181708af4cc01708af521450005',
              "dateCreated": '2020-02-28T08:41:25Z',
              "lastUpdated": '2024-04-09T15:48:05Z',
              "serialised": 'MonthlyGrossIncome(Between GHS 1,000 - GHS 5,000)',
              "archived": false,
              "description": 'Between GHS 1,000 - GHS 5,000',
              "totalCount": 7,
              "baseCurrency": null,
              "quickReference": '21450005',
              "class": 'soupbroker.kyc.MonthlyGrossIncome'
            },
            {
              "id": 'ff808181708af4cc01708af5214a0006',
              "dateCreated": '2020-02-28T08:41:25Z',
              "lastUpdated": '2023-03-20T09:37:24Z',
              "serialised": 'MonthlyGrossIncome(Above GHS 10,000)',
              "archived": false,
              "description": 'Above GHS 10,000',
              "account": {
                "id": 'ff8081817217e9f3017217f19ccc0000',
                "class": 'soupbroker.Account',
                "serialised": 'Account(Demo Securities & Asset Limited, Licensed Broker-Dealer)'
              },
              "totalCount": 7,
              "baseCurrency": null,
              "quickReference": '214A0006',
              "class": 'soupbroker.kyc.MonthlyGrossIncome'
            }
          ]
      );
    }
    String endpoint = "${LOAD_ALL_MONTHLY_INCOME}.json?max=${maxPage}";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<dynamic>> clientIndustry({int maxPage = 100}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:[
          {
          "id": 'ff8081817283659401728663bcd50095',
          "dateCreated": '2020-06-05T21:29:43Z',
          "name": 'Advertising',
          "lastUpdated": '2020-06-05T21:29:43Z',
          "serialised": 'Advertising',
          "archived": false,
          "totalCount": 159,
          "baseCurrency": null,
          "quickReference": 'BCD50095',
          "class": 'soupbroker.setting.ClientIndustry'
          },
          {
          "id": 'ff8081817283659401728663bbff002a',
          "dateCreated": '2020-06-05T21:29:42Z',
          "name": 'Aerospace and Defense',
          "lastUpdated": '2023-04-28T09:49:30Z',
          "serialised": 'Aerospace and Defense',
          "archived": false,
          "totalCount": 159,
          "baseCurrency": null,
          "quickReference": 'BBFF002A',
          "class": 'soupbroker.setting.ClientIndustry'
          },
      {
      "id": 'ff8081817283659401728663bc0f0030',
      "dateCreated": '2020-06-05T21:29:42Z',
      "name": 'Agricultural & Farm Machinery',
      "lastUpdated": '2020-06-05T21:29:42Z',
      "serialised": 'Agricultural & Farm Machinery',
      "archived": false,
      "totalCount": 159,
      "baseCurrency": null,
      "quickReference": 'BC0F0030',
      "class": 'soupbroker.setting.ClientIndustry'
      },
      {
      "id": 'ff8081817283659401728663bc6d0065',
      "dateCreated": '2020-06-05T21:29:43Z',
      "name": 'Agricultural Products',
      "lastUpdated": '2020-06-05T21:29:43Z',
      "serialised": 'Agricultural Products',
      "archived": false,
      "totalCount": 159,
      "baseCurrency": null,
      "quickReference": 'BC6D0065',
      "class": 'soupbroker.setting.ClientIndustry'
      },
      {
      "id": 'ff8081817283659401728663bc24003a',
      "dateCreated": '2020-06-05T21:29:42Z',
      "name": 'Air Freight & Logistics',
      "lastUpdated": '2020-06-05T21:29:42Z',
      "serialised": 'Air Freight & Logistics',
      "archived": false,
      "totalCount": 159,
      "baseCurrency": null,
      "quickReference": 'BC24003A',
      "class": 'soupbroker.setting.ClientIndustry'
      },
      {
      "id": 'ff8081817283659401728663bc2c003e',
      "dateCreated": '2020-06-05T21:29:42Z',
      "name": 'Airport Services',
      "lastUpdated": '2020-06-05T21:29:42Z',
      "serialised": 'Airport Services',
      "archived": false,
      "totalCount": 159,
      "baseCurrency": null,
      "quickReference": 'BC2C003E',
      "class": 'soupbroker.setting.ClientIndustry'
      },
      {
      "id": 'ff8081817283659401728663bcd20092',
      "dateCreated": '2020-06-05T21:29:43Z',
      "name": 'Alternative Carriers',
      "lastUpdated": '2020-06-05T21:29:43Z',
      "serialised": 'Alternative Carriers',
      "archived": false,
      "totalCount": 159,
      "baseCurrency": null,
      "quickReference": 'BCD20092',
      "class": 'soupbroker.setting.ClientIndustry'
      },
          {
          "id": 'ff8081817283659401728663bbf40022',
          "dateCreated": '2020-06-05T21:29:42Z',
          "name": 'Aluminum',
          "lastUpdated": '2020-06-05T21:29:42Z',
          "serialised": 'Aluminum',
          "archived": false,
          "totalCount": 159,
          "baseCurrency": null,
          "quickReference": 'BBF40022',
          "class": 'soupbroker.setting.ClientIndustry'
          },
          {
          "id": 'ff8081817283659401728663bc5c0058',
          "dateCreated": '2020-06-05T21:29:42Z',
          "name": 'Apparel Retail',
          "lastUpdated": '2020-06-05T21:29:42Z',
          "serialised": 'Apparel Retail',
          "archived": false,
          "totalCount": 159,
          "baseCurrency": null,
          "quickReference": 'BC5C0058',
          "class": 'soupbroker.setting.ClientIndustry'
          },
          {
          "id": 'ff8081817283659401728663bc49004b',
          "dateCreated": '2020-06-05T21:29:42Z',
          "name": 'Apparel, Accessories & Luxury Goods',
          "lastUpdated": '2020-06-05T21:29:42Z',
          "serialised": 'Apparel, Accessories & Luxury Goods',
          "archived": false,
          "totalCount": 159,
          "baseCurrency": null,
          "quickReference": 'BC49004B',
          "class": 'soupbroker.setting.ClientIndustry'
          }
          ]
      );
    }
    String endpoint = "${CLIENT_INDUSTRY}.json?max=${maxPage}";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<dynamic>> enumUtility({int maxPage = 100}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            "gender": [ 'MALE', 'FEMALE', 'OTHER' ],
            "nameTitle": [ 'MR', 'MRS', 'MISS', 'DR', 'PROF', 'HON' ],
            "approvalStates": [
              'REJECTED',   'BLOCKED',
              'PENDING',    'UPDATED',
              'CHECKED',    'APPROVED',
              'COMPLIANCE', 'EXECUTIVE',
              'ALL'
            ],
            "valueCalculation": [ 'DEBT', 'EQUITY' ],
            "securityTemplate": [
              'COLLECTIVE_INVESTMENT_SCHEME',
              'MUTUAL_FUND',
              'UNIT_TRUST',
              'PENSION_SCHEME',
              'STATE_PENSION',
              'PERSONAL_PENSION',
              'WORK_PENSION',
              'INSTITUTIONAL_FUND',
              'SAVINGS_PLAN',
              'WELFARE_FUND',
              'INVESTMENT_CLUB',
              'ASSOCIATIONS',
              'FIXED_INCOME',
              'BOND',
              'NOTE',
              'BILL',
              'FIXED_DEPOSIT',
              'SHARES',
              'STOCKS',
              'FOREX_EXCHANGE'
            ],
            "accountFrequency": [
              'DAILY',       'WEEKLY',
              'BI_WEEKLY',   'MONTHLY',
              'QUARTERLY',   'SEMI_ANNUAL',
              'BI_ANNUAL',   'ANNUAL',
              'BI_ANNUALLY', 'ANNUALLY'
            ],
            "relationShip": [ 'FATHER', 'MOTHER', 'SIBLING', 'SPOUSE', 'OTHER' ],
            "sourceOfIncome": [ 'SALARY', 'BUSINESS', 'INHERITANCE', 'GIFTS', 'SAVINGS', 'OTHER' ],
            "securityDayCount": [
              '_30_OVER_360_US',
              '_30_OVER_360',
              '_30_E_OVER_360',
              '_30_E_OVER_360_ISDA',
              'ACTUAL_OVER_ACTUAL',
              'ACTUAL_OVER_ACTUAL_ICMA',
              'ACTUAL_OVER_ACTUAL_ISDA',
              'ACTUAL_OVER_ACTUAL_AFB',
              'ACTUAL_OVER_365',
              'ACTUAL_OVER_365_L',
              'ACTUAL_OVER_365_FIXED',
              'ACTUAL_OVER_364',
              'ACTUAL_OVER_360'
            ],
            "businessCategory": [
              'SOLE_PROPRIERTORSHIP',
              'PARTNERSHIP',
              'LIMITED_LIABILITY',
              'LIMITED_BY_GUARANTEE',
              'CHARITIES_AND_NGOS',
              'OTHER'
            ],
            "businessLicenceCategory": [
              'BROKER',
              'ASSET_MANAGER',
              'CUSTODIAN',
              'TRUSTEE',
              'PRIMARY_DEALER'
            ],
            "employmentStatus": [ 'EMPLOYED', 'UNEMPLOYED', 'STUDENT', 'RETIRED', 'SELF_EMPLOYED' ],
            "maritalStatus": [ 'SINGLE', 'MARRIED', 'DIVORCED', 'WIDOWED', 'SEPARATED' ],
            "country": {
              "abw": 'Aruba',
              "afg": 'Afghanistan',
              "ago": 'Angola',
              "aia": 'Anguilla',
              "ala": 'Åland Islands',
              "alb": 'Albania',
              "and": 'Andorra',
              "are": 'United Arab Emirates',
              "arg": 'Argentina',
              "arm": 'Armenia',
              "asm": 'American Samoa',
              "ata": 'Antarctica',
              "atf": 'French Southern Territories',
              "atg": 'Antigua and Barbuda',
              "aus": 'Australia',
              "aut": 'Austria',
              "aze": 'Azerbaijan',
              "bdi": 'Burundi',
              "bel": 'Belgium',
              "ben": 'Benin',
              "bes": 'Bonaire, Sint Eustatius and Saba',
              "bfa": 'Burkina Faso',
              "bgd": 'Bangladesh',
              "bgr": 'Bulgaria',
              "bhr": 'Bahrain',
              "bhs": 'Bahamas',
              "bih": 'Bosnia and Herzegovina',
              "blr": 'Belarus',
              "blz": 'Belize',
              "bmu": 'Bermuda',
              "bol": 'Bolivia',
              "bra": 'Brazil',
              "brb": 'Barbados',
              "brn": 'Brunei Darussalam',
              "btn": 'Bhutan',
              "bvt": 'Bouvet Island',
              "bwa": 'Botswana',
              "caf": 'Central African',
              "can": 'Canada',
              "cck": 'Cocos (Keeling) Islands',
              "che": 'Switzerland',
              "chl": 'Chile',
              "chn": 'China',
              "civ": "Côte d'Ivoire",
              "cmr": 'Cameroon',
              "cod": 'The Democratic Republic Of The Congo',
              "cog": 'Republic of the Congo',
              "cok": 'Cook Islands',
              "col": 'Colombia',
              "com": 'Comoros',
              "cpv": 'Cape Verde',
              "cri": 'Costa Rica',
              "cub": 'Cuba',
              "cuw": 'Curaçao',
              "cxr": 'Christmas Island',
              "cym": 'Cayman Islands',
              "cyp": 'Cyprus',
              "cze": 'Czech Republic',
              "deu": 'Germany',
              "dji": 'Djibouti',
              "dma": 'Dominica',
              "dnk": 'Denmark',
              "dom": 'Dominican Republic',
              "dza": 'Algeria',
              "ecu": 'Ecuador',
              "egy": 'Egypt',
              "eri": 'Eritrea',
              "esh": 'Western Sahara',
              "esp": 'Spain',
              "est": 'Estonia',
              "eth": 'Ethiopia',
              "fin": 'Finland',
              "fji": 'Fiji',
              "flk": 'Falkland Islands',
              "fra": 'France',
              "fro": 'Faroe Islands',
              "fsm": 'Federated States of Micronesia',
              "gab": 'Gabon',
              "gbr": 'United Kingdom',
              "geo": 'Georgia',
              "gha": 'Ghana',
              "gib": 'Gibraltar',
              "gin": 'Guinea',
              "glp": 'Guadeloupe',
              "gmb": 'Gambia',
              "gnb": 'Guinea-Bissau',
              "gnq": 'Equatorial Guinea',
              "grc": 'Greece',
              "grd": 'Grenada',
              "grl": 'Greenland',
              "gtm": 'Guatemala',
              "guf": 'French Guiana',
              "gum": 'Guam',
              "guy": 'Guyana',
              "hkg": 'Hong Kong',
              "hmd": 'Heard Island and McDonald Islands',
              "hnd": 'Honduras',
              "hrv": 'Croatia',
              "hti": 'Haiti',
              "hun": 'Hungary',
              "idn": 'Indonesia',
              "imn": 'Isle of Man',
              "ind": 'India',
              "iot": 'British Indian Ocean Territory',
              "irl": 'Ireland',
              "irn": 'Islamic Republic of Iran',
              "irq": 'Iraq',
              "isl": 'Iceland',
              "isr": 'Israel',
              "ita": 'Italy',
              "jam": 'Jamaica',
              "jor": 'Jordan',
              "jpn": 'Japan',
              "kaz": 'Kazakhstan',
              "ken": 'Kenya',
              "kgz": 'Kyrgyzstan',
              "khm": 'Cambodia',
              "kir": 'Kiribati',
              "kna": 'Saint Kitts and Nevis',
              "kor": 'Republic of Korea',
              "kwt": 'Kuwait',
              "lao": "Lao People's Democratic Republic",
              "lbn": 'Lebanon',
              "lbr": 'Liberia',
              "lby": 'Libyan Arab Jamahiriya',
              "lca": 'Saint Lucia',
              "lie": 'Liechtenstein',
              "lka": 'Sri Lanka',
              "lso": 'Lesotho',
              "ltu": 'Lithuania',
              "lux": 'Luxembourg',
              "lva": 'Latvia',
              "mac": 'Macao',
              "mar": 'Morocco',
              "mco": 'Monaco',
              "mda": 'Republic of Moldova',
              "mdg": 'Madagascar',
              "mdv": 'Maldives',
              "mex": 'Mexico',
              "mhl": 'Marshall Islands',
              "mkd": 'The Former Yugoslav Republic of Macedonia',
              "mli": 'Mali',
              "mlt": 'Malta',
              "mmr": 'Myanmar',
              "mne": 'Montenegro',
              "mng": 'Mongolia',
              "mnp": 'Northern Mariana Islands',
              "moz": 'Mozambique',
              "mrt": 'Mauritania',
              "msr": 'Montserrat',
              "mtq": 'Martinique',
              "mus": 'Mauritius',
              "mwi": 'Malawi',
              "mys": 'Malaysia',
              "myt": 'Mayotte',
              "nam": 'Namibia',
              "ncl": 'New Caledonia',
              "ner": 'Niger',
              "nfk": 'Norfolk Island',
              "nga": 'Nigeria',
              "nic": 'Nicaragua',
              "niu": 'Niue',
              "nld": 'Netherlands',
              "nor": 'Norway',
              "npl": 'Nepal',
              "nru": 'Nauru',
              "nzl": 'New Zealand',
              "omn": 'Oman',
              "pak": 'Pakistan',
              "pan": 'Panama',
              "pcn": 'Pitcairn',
              "per": 'Peru',
              "phl": 'Philippines',
              "plw": 'Palau',
              "png": 'Papua New Guinea',
              "pol": 'Poland',
              "pri": 'Puerto Rico',
              "prk": "Democratic People's Republic of Korea",
              "prt": 'Portugal',
              "pry": 'Paraguay',
              "pse": 'Occupied Palestinian Territory',
              "pyf": 'French Polynesia',
              "qat": 'Qatar',
              "reu": 'Réunion',
              "rou": 'Romania',
              "rus": 'Russian Federation',
              "rwa": 'Rwanda',
              "sau": 'Saudi Arabia',
              "sdn": 'Sudan',
              "sen": 'Senegal',
              "sgp": 'Singapore',
              "sgs": 'South Georgia and the South Sandwich Islands',
              "shn": 'Saint Helena',
              "sjm": 'Svalbard and Jan Mayen',
              "slb": 'Solomon Islands',
              "sle": 'Sierra Leone',
              "slv": 'El Salvador',
              "smr": 'San Marino',
              "som": 'Somalia',
              "spm": 'Saint-Pierre and Miquelon',
              "srb": 'Serbia',
              "stp": 'Sao Tome and Principe',
              "sur": 'Suriname',
              "svk": 'Slovakia',
              "svn": 'Slovenia',
              "swe": 'Sweden',
              "swz": 'Swaziland',
              "sxm": 'Sint Maarten (Dutch part)',
              "syc": 'Seychelles',
              "syr": 'Syrian Arab Republic',
              "tca": 'Turks and Caicos Islands',
              "tcd": 'Chad',
              "tgo": 'Togo',
              "tha": 'Thailand',
              "tjk": 'Tajikistan',
              "tkl": 'Tokelau',
              "tkm": 'Turkmenistan',
              "tls": 'Timor-Leste',
              "ton": 'Tonga',
              "tto": 'Trinidad and Tobago',
              "tun": 'Tunisia',
              "tur": 'Turkey',
              "tuv": 'Tuvalu',
              "twn": 'Taiwan',
              "tza": 'United Republic Of Tanzania',
              "uga": 'Uganda',
              "ukr": 'Ukraine',
              "umi": 'United States Minor Outlying Islands',
              "ury": 'Uruguay',
              "usa": 'United States',
              "uzb": 'Uzbekistan',
              "vat": 'Vatican City State',
              "vct": 'Saint Vincent and the Grenadines',
              "ven": 'Venezuela',
              "vgb": 'British Virgin Islands',
              "vir": 'U.S. Virgin Islands',
              "vnm": 'Vietnam',
              "vut": 'Vanuatu',
              "wlf": 'Wallis and Futuna',
              "wsm": 'Samoa',
              "yem": 'Yemen',
              "zaf": 'South Africa',
              "zmb": 'Zambia',
              "zwe": 'Zimbabwe'
            },
            "nationality": {
              "AFG": 'Afghan',
              "ALA": 'Åland Island',
              "ALB": 'Albanian',
              "DZA": 'Algerian',
              "ASM": 'American Samoan',
              "AND": 'Andorran',
              "AGO": 'Angolan',
              "AIA": 'Anguillan',
              "ATA": 'Antarctic',
              "ATG": 'Antiguan or Barbudan',
              "ARG": 'Argentine',
              "ARM": 'Armenian',
              "ABW": 'Aruban',
              "AUS": 'Australian',
              "AUT": 'Austrian',
              "AZE": 'Azerbaijani, Azeri',
              "BHS": 'Bahamian',
              "BHR": 'Bahraini',
              "BGD": 'Bangladeshi',
              "BRB": 'Barbadian',
              "BLR": 'Belarusian',
              "BEL": 'Belgian',
              "BLZ": 'Belizean',
              "BEN": 'Beninese, Beninois',
              "BMU": 'Bermudian, Bermudan',
              "BTN": 'Bhutanese',
              "BOL": 'Bolivian',
              "BES": 'Bonaire',
              "BIH": 'Bosnian or Herzegovinian',
              "BWA": 'Motswana, Botswanan',
              "BVT": 'Bouvet Island',
              "BRA": 'Brazilian',
              "IOT": 'BIOT',
              "BRN": 'Bruneian',
              "BGR": 'Bulgarian',
              "BFA": 'Burkinabé',
              "BDI": 'Burundian',
              "CPV": 'Cabo Verdean',
              "KHM": 'Cambodian',
              "CMR": 'Cameroonian',
              "CAN": 'Canadian',
              "CYM": 'Caymanian',
              "CAF": 'Central African',
              "TCD": 'Chadian',
              "CHL": 'Chilean',
              "CHN": 'Chinese',
              "CXR": 'Christmas Island',
              "CCK": 'Cocos Island',
              "COL": 'Colombian',
              "COM": 'Comoran, Comorian',
              "COG": 'Congolese',
              "COD": 'Congolese',
              "COK": 'Cook Island',
              "CRI": 'Costa Rican',
              "CIV": 'Ivorian',
              "HRV": 'Croatian',
              "CUB": 'Cuban',
              "CUW": 'Curaçaoan',
              "CYP": 'Cypriot',
              "CZE": 'Czech',
              "DNK": 'Danish',
              "DJI": 'Djiboutian',
              "DMA": 'Dominican',
              "DOM": 'Dominican',
              "ECU": 'Ecuadorian',
              "EGY": 'Egyptian',
              "SLV": 'Salvadoran',
              "GNQ": 'Equatorial Guinean, Equatoguinean',
              "ERI": 'Eritrean',
              "EST": 'Estonian',
              "ETH": 'Ethiopian',
              "FLK": 'Falkland Island',
              "FRO": 'Faroese',
              "FJI": 'Fijian',
              "FIN": 'Finnish',
              "FRA": 'French',
              "GUF": 'French Guianese',
              "PYF": 'French Polynesian',
              "ATF": 'French Southern Territories',
              "GAB": 'Gabonese',
              "GMB": 'Gambian',
              "GEO": 'Georgian',
              "DEU": 'German',
              "GHA": 'Ghanaian',
              "GIB": 'Gibraltar',
              "GRC": 'Greek, Hellenic',
              "GRL": 'Greenlandic',
              "GRD": 'Grenadian',
              "GLP": 'Guadeloupe',
              "GUM": 'Guamanian, Guambat',
              "GTM": 'Guatemalan',
              "GGY": 'Channel Island',
              "GIN": 'Guinean',
              "GNB": 'Bissau-Guinean',
              "GUY": 'Guyanese',
              "HTI": 'Haitian',
              "HMD": 'Heard Island or McDonald Islands',
              "VAT": 'Vatican',
              "HND": 'Honduran',
              "HKG": 'Hong Kong, Hong Kongese',
              "HUN": 'Hungarian, Magyar',
              "ISL": 'Icelandic',
              "IND": 'Indian',
              "IDN": 'Indonesian',
              "IRN": 'Iranian, Persian',
              "IRQ": 'Iraqi',
              "IRL": 'Irish',
              "IMN": 'Manx',
              "ISR": 'Israeli',
              "ITA": 'Italian',
              "JAM": 'Jamaican',
              "JPN": 'Japanese',
              "JEY": 'Channel Island',
              "JOR": 'Jordanian',
              "KAZ": 'Kazakhstani, Kazakh',
              "KEN": 'Kenyan',
              "KIR": 'I-Kiribati',
              "PRK": 'North Korean',
              "KOR": 'South Korean',
              "KWT": 'Kuwaiti',
              "KGZ": 'Kyrgyzstani, Kyrgyz, Kirgiz, Kirghiz',
              "LAO": 'Lao, Laotian',
              "LVA": 'Latvian',
              "LBN": 'Lebanese',
              "LSO": 'Basotho',
              "LBR": 'Liberian',
              "LBY": 'Libyan',
              "LIE": 'Liechtenstein',
              "LTU": 'Lithuanian',
              "LUX": 'Luxembourg, Luxembourgish',
              "MAC": 'Macanese, Chinese',
              "MKD": 'Macedonian',
              "MDG": 'Malagasy',
              "MWI": 'Malawian',
              "MYS": 'Malaysian',
              "MDV": 'Maldivian',
              "MLI": 'Malian, Malinese',
              "MLT": 'Maltese',
              "MHL": 'Marshallese',
              "MTQ": 'Martiniquais, Martinican',
              "MRT": 'Mauritanian',
              "MUS": 'Mauritian',
              "MYT": 'Mahoran',
              "MEX": 'Mexican',
              "FSM": 'Micronesian',
              "MDA": 'Moldovan',
              "MCO": 'Monégasque, Monacan',
              "MNG": 'Mongolian',
              "MNE": 'Montenegrin',
              "MSR": 'Montserratian',
              "MAR": 'Moroccan',
              "MOZ": 'Mozambican',
              "MMR": 'Burmese',
              "NAM": 'Namibian',
              "NRU": 'Nauruan',
              "NPL": 'Nepali, Nepalese',
              "NLD": 'Dutch, Netherlandic',
              "NCL": 'New Caledonian',
              "NZL": 'New Zealand, NZ',
              "NIC": 'Nicaraguan',
              "NER": 'Nigerien',
              "NGA": 'Nigerian',
              "NIU": 'Niuean',
              "NFK": 'Norfolk Island',
              "MNP": 'Northern Marianan',
              "NOR": 'Norwegian',
              "OMN": 'Omani',
              "PAK": 'Pakistani',
              "PLW": 'Palauan',
              "PSE": 'Palestinian',
              "PAN": 'Panamanian',
              "PNG": 'Papua New Guinean, Papuan',
              "PRY": 'Paraguayan',
              "PER": 'Peruvian',
              "PHL": 'Philippine, Filipino',
              "PCN": 'Pitcairn Island',
              "POL": 'Polish',
              "PRT": 'Portuguese',
              "PRI": 'Puerto Rican',
              "QAT": 'Qatari',
              "REU": 'Réunionese, Réunionnais',
              "ROU": 'Romanian',
              "RUS": 'Russian',
              "RWA": 'Rwandan',
              "BLM": 'Barthélemois',
              "SHN": 'Saint Helenian',
              "KNA": 'Kittitian or Nevisian',
              "LCA": 'Saint Lucian',
              "MAF": 'Saint-Martinoise',
              "SPM": 'Saint-Pierrais or Miquelonnais',
              "VCT": 'Saint Vincentian, Vincentian',
              "WSM": 'Samoan',
              "SMR": 'Sammarinese',
              "STP": 'São Toméan',
              "SAU": 'Saudi, Saudi Arabian',
              "SEN": 'Senegalese',
              "SRB": 'Serbian',
              "SYC": 'Seychellois',
              "SLE": 'Sierra Leonean',
              "SGP": 'Singaporean',
              "SXM": 'Sint Maarten',
              "SVK": 'Slovak',
              "SVN": 'Slovenian, Slovene',
              "SLB": 'Solomon Island',
              "SOM": 'Somali, Somalian',
              "ZAF": 'South African',
              "SGS": 'South Georgia or South Sandwich Islands',
              "SSD": 'South Sudanese',
              "ESP": 'Spanish',
              "LKA": 'Sri Lankan',
              "SDN": 'Sudanese',
              "SUR": 'Surinamese',
              "SJM": 'Svalbard',
              "SWZ": 'Swazi',
              "SWE": 'Swedish',
              "CHE": 'Swiss',
              "SYR": 'Syrian',
              "TWN": 'Chinese, Taiwanese',
              "TJK": 'Tajikistani',
              "TZA": 'Tanzanian',
              "THA": 'Thai',
              "TLS": 'Timorese',
              "TGO": 'Togolese',
              "TKL": 'Tokelauan',
              "TON": 'Tongan',
              "TTO": 'Trinidadian or Tobagonian',
              "TUN": 'Tunisian',
              "TUR": 'Turkish',
              "TKM": 'Turkmen',
              "TCA": 'Turks and Caicos Island',
              "TUV": 'Tuvaluan',
              "UGA": 'Ugandan',
              "UKR": 'Ukrainian',
              "ARE": 'Emirati, Emirian, Emiri',
              "GBR": 'British, UK',
              "UMI": 'American',
              "USA": 'American',
              "URY": 'Uruguayan',
              "UZB": 'Uzbekistani, Uzbek',
              "VUT": 'Ni-Vanuatu, Vanuatuan',
              "VEN": 'Venezuelan',
              "VNM": 'Vietnamese',
              "VGB": 'British Virgin Island',
              "VIR": 'U.S. Virgin Island',
              "WLF": 'Wallis and Futuna, Wallisian or Futunan',
              "ESH": 'Sahrawi, Sahrawian, Sahraouian',
              "YEM": 'Yemeni',
              "ZMB": 'Zambian',
              "ZWE": 'Zimbabwean'
            },
            "currency": [
              'MDL', 'MOP', 'ZWR', 'LAK', 'BBD', 'XFO', 'DOP', 'XBB',
              'TTD', 'OMR', 'TMM', 'UGX', 'AUD', 'TWD', 'ZAR', 'BRL',
              'COU', 'MNT', 'XAU', 'KES', 'ESP', 'RON', 'VND', 'CHE',
              'VEF', 'SVC', 'TRL', 'BYN', 'RWF', 'FIM', 'PLN', 'JOD',
              'XFU', 'WST', 'KPW', 'SLL', 'TPE', 'PKR', 'QAR', 'IRR',
              'NIO', 'SDD', 'XSU', 'UYU', 'BDT', 'AZN', 'DEM', 'ZMK',
              'LTL', 'TRY', 'SAR', 'ERN', 'SCR', 'SIT', 'CHF', 'GYD',
              'XUA', 'FKP', 'HTG', 'KGS', 'USS', 'ZWN', 'THB', 'ANG',
              'CHW', 'HUF', 'XBC', 'MTL', 'XDR', 'EEK', 'XBA', 'FRF',
              'BTN', 'ETB', 'AFA', 'MWK', 'XBD', 'PTE', 'XTS', 'SOS',
              'JMD', 'ATS', 'DJF', 'VES', 'ZWD', 'BHD', 'AOA', 'MZN',
              'BEF', 'MXV', 'ILS', 'GNF', 'NOK', 'FJD', 'RUB', 'XAG',
              'GMD', 'GEL', 'SYP', 'LRD',
            ],
            "digitalAddressState": [ 'PENDING', 'VALID', 'INVALID' ],
            "investmentHorizon": [ 'SHORT_TERM', 'MEDIUM_TERM', 'LONG_TERM' ],
            "investmentTenorType": [ 'DAYS', 'WEEKS', 'MONTHS', 'YEARS' ],
            "collectionRule": [
              'INTEREST_REINVESTMENT',
              'INTEREST_REFUND',
              'VOLUME_REINVESTMENT',
              'VOLUME_REFUND',
              'DIVIDENDS_REINVESTMENT',
              'DIVIDENDS_REFUND'
            ],
            "fillState": [
              'PENDING',  'PARTIAL',
              'FILLED',   'SETTLED',
              'RESOLVED', 'REFUNDED',
              'REJECTED', 'DUPLICATED',
              'EXPIRED'
            ],
            "tradeReconStatus": [ 'PENDING', 'SUCCESS', 'FAILED' ]
          }
      );
    }
    String endpoint = "${LOAD_ENUM_UTILITIES}.json?max=${maxPage}";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<dynamic>> annualTurnOver({int maxPage = 100}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${LOAD_ANNUAL_TURN_OVER}.json?max=${maxPage}";
    return _sdkServiceRequest.get(endpoint: endpoint,);
  }

  Future<SDKServiceResponse<dynamic>> saveClientBankDetails({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${SAVE_CLIENT_BANK_DETAILS}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> updateClientBankDetails({Map<String, dynamic>? data, @required String? id}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${UPDATE_CLIENT_BANK_DETAILS}.json?id=${id}";
    FormData formData = FormData.fromMap(data!);
    formData.fields.add(MapEntry("id", id!));
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> getCustodyStatement({Map<String, dynamic>? filter, @required String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:[
          {
          "clientAccount": 'Direct Account : Individual(Edwin User)',
          "clientList": [ [Object] ],
          "accountServices": {
          "id": 'ff8081818dd4e8f0018dd5e4d6160011',
          "investmentObjective": null,
          "modelPortfolio": null
          },
          "issuer": 'TMF',
          "security": {
          "id": 'ff8081818b46e138018b4825be3a1787',
          "dateCreated": '2023-10-19T13:35:15Z',
          "floatingCouponList": [Array],
          "lastUpdated": '2023-12-04T11:02:02Z',
          "cleanPricePrecisionRounding": 0,
          "tenor": 0,
          "faceValueType": 'INTEGER',
          "isin": 'SYS-TMFMFC651',
          "enableRetail": false,
          "privateResource": false,
          "serialised": 'Test Mutual Fund-[MEDIUM_TERM]TMF | Mutual Fund - CIS - Collective Investment Schemes - EQUITY',
          "archived": false,
          "issuer": [Object],
          "subType": [Object],
          "currency": null,
          "baseCurrency": 'GHS',
          "quickReference": 'BE3A1787',
          "simpleID": 'Test Mutual Fund-[MEDIUM_TERM]TMF',
          "class": 'soupbroker.trading.Security'
          },
          "coupon": null,
          "volume": 963,
          "accruedDaysToday": 0,
          "interestCollected": 0,
          "marketPrice": 0.55,
          "marketValue": 529.65,
          "totalDeposits": 500,
          "totalWithdrawals": null
          }
          ]
      );
    }
    String endpoint = "${CUSTODY_STATEMENT}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> getTransactionStatement({Map<String, dynamic>? filter, @required String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:[
            {
              "clientAccount": 'Direct Account : Individual(Edwin User)',
              "clientList": [ [Object] ],
              "accountServices": {
                "id": 'ff8081818dd4e8f0018dd5e4d6160011',
                "investmentObjective": null,
                "modelPortfolio": null
              },
              "issuer": 'TMF',
              "security": {
                "id": 'ff8081818b46e138018b4825be3a1787',
                "dateCreated": '2023-10-19T13:35:15Z',
                "floatingCouponList": [Array],
                "lastUpdated": '2023-12-04T11:02:02Z',
                "cleanPricePrecisionRounding": 0,
                "tenor": 0,
                "faceValueType": 'INTEGER',
                "isin": 'SYS-TMFMFC651',
                "enableRetail": false,
                "privateResource": false,
                "serialised": 'Test Mutual Fund-[MEDIUM_TERM]TMF | Mutual Fund - CIS - Collective Investment Schemes - EQUITY',
                "archived": false,
                "issuer": [Object],
                "subType": [Object],
                "currency": null,
                "baseCurrency": 'GHS',
                "quickReference": 'BE3A1787',
                "simpleID": 'Test Mutual Fund-[MEDIUM_TERM]TMF',
                "class": 'soupbroker.trading.Security'
              },
              "coupon": null,
              "volume": 963,
              "accruedDaysToday": 0,
              "interestCollected": 0,
              "marketPrice": 0.55,
              "marketValue": 529.65,
              "totalDeposits": 500,
              "totalWithdrawals": null
            }
          ]
      );
    }
    String endpoint = "${TRANSACTION_STATEMENT}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> downloadCustodyStatement({Map<String, dynamic>? filter, @required String? contact, @required String? saveLocation, Map<String, dynamic>? headers}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:[
            {
              "clientAccount": 'Direct Account : Individual(Edwin User)',
              "clientList": [ [Object] ],
              "accountServices": {
                "id": 'ff8081818dd4e8f0018dd5e4d6160011',
                "investmentObjective": null,
                "modelPortfolio": null
              },
              "issuer": 'TMF',
              "security": {
                "id": 'ff8081818b46e138018b4825be3a1787',
                "dateCreated": '2023-10-19T13:35:15Z',
                "floatingCouponList": [Array],
                "lastUpdated": '2023-12-04T11:02:02Z',
                "cleanPricePrecisionRounding": 0,
                "tenor": 0,
                "faceValueType": 'INTEGER',
                "isin": 'SYS-TMFMFC651',
                "enableRetail": false,
                "privateResource": false,
                "serialised": 'Test Mutual Fund-[MEDIUM_TERM]TMF | Mutual Fund - CIS - Collective Investment Schemes - EQUITY',
                "archived": false,
                "issuer": [Object],
                "subType": [Object],
                "currency": null,
                "baseCurrency": 'GHS',
                "quickReference": 'BE3A1787',
                "simpleID": 'Test Mutual Fund-[MEDIUM_TERM]TMF',
                "class": 'soupbroker.trading.Security'
              },
              "coupon": null,
              "volume": 963,
              "accruedDaysToday": 0,
              "interestCollected": 0,
              "marketPrice": 0.55,
              "marketValue": 529.65,
              "totalDeposits": 500,
              "totalWithdrawals": null
            }
          ]
      );
    }
    String endpoint = "${CUSTODY_STATEMENT}.pdf";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    endpoint = generateUrlWithParams(endpoint, queryParameters);
    return _sdkServiceRequest.download(endpoint: endpoint, savePath: saveLocation!, headers: headers);
  }

  String generateUrlWithParams(String baseUrl, Map<String, dynamic> params) {
    Uri uri = Uri.parse(baseUrl);
    Uri updatedUri = uri.replace(queryParameters: params.map((key, value) => MapEntry(key, value.toString())));
    return updatedUri.toString();
  }

  Future<SDKServiceResponse<dynamic>> downloadTransactionStatement({Map<String, dynamic>? filter, @required String? contact, @required String? saveLocation, Map<String, dynamic>? headers}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:[
            {
              "clientAccount": 'Direct Account : Individual(Edwin User)',
              "clientList": [ [Object] ],
              "accountServices": {
                "id": 'ff8081818dd4e8f0018dd5e4d6160011',
                "investmentObjective": null,
                "modelPortfolio": null
              },
              "issuer": 'TMF',
              "security": {
                "id": 'ff8081818b46e138018b4825be3a1787',
                "dateCreated": '2023-10-19T13:35:15Z',
                "floatingCouponList": [Array],
                "lastUpdated": '2023-12-04T11:02:02Z',
                "cleanPricePrecisionRounding": 0,
                "tenor": 0,
                "faceValueType": 'INTEGER',
                "isin": 'SYS-TMFMFC651',
                "enableRetail": false,
                "privateResource": false,
                "serialised": 'Test Mutual Fund-[MEDIUM_TERM]TMF | Mutual Fund - CIS - Collective Investment Schemes - EQUITY',
                "archived": false,
                "issuer": [Object],
                "subType": [Object],
                "currency": null,
                "baseCurrency": 'GHS',
                "quickReference": 'BE3A1787',
                "simpleID": 'Test Mutual Fund-[MEDIUM_TERM]TMF',
                "class": 'soupbroker.trading.Security'
              },
              "coupon": null,
              "volume": 963,
              "accruedDaysToday": 0,
              "interestCollected": 0,
              "marketPrice": 0.55,
              "marketValue": 529.65,
              "totalDeposits": 500,
              "totalWithdrawals": null
            }
          ]
      );
    }
    String endpoint = "${TRANSACTION_STATEMENT}.pdf";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    endpoint = generateUrlWithParams(endpoint, queryParameters);
    return _sdkServiceRequest.download(endpoint: endpoint, savePath: saveLocation!, headers: headers);
  }

  Future<SDKServiceResponse<dynamic>> downloadSoupLink({Map<String, dynamic>? filter, @required String? contact, Map<String, dynamic>? headers}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${DOWNLOAD_LINK_SOUPLINK}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> showClientEmergencyContact({String? id, String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${SHOW_CLIENT_EMERGENCY_CONTACT}$id.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> saveClientEmergencyContact({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${SAVE_CLIENT_EMERGENCY_CONTACT}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> updateClientEmergencyContact({Map<String, dynamic>? data, @required String? id}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${UPDATE_CLIENT_EMERGENCY_CONTACT}/${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> showIndividualBeneficiary({String? id, String? contact}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${INDIVIDUAL_BENEFICIARY_SHOW}$id.json";
    final queryParameters = {
      'contact': contact,
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> saveIndividualBeneficiary({Map<String, dynamic>? data}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${INDIVIDUAL_BENEFICIARY_SAVE}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.post(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> updateIndividualBeneficiary({Map<String, dynamic>? data, @required String? id}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${INDIVIDUAL_BENEFICIARY_UPDATE}/${id}.json";
    FormData formData = FormData.fromMap(data!);
    return _sdkServiceRequest.put(endpoint: endpoint, data: formData);
  }

  Future<SDKServiceResponse<dynamic>> loadAllRiskAssessmentQuestions({String? contact, Map<String, dynamic>? filter}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${LOAD_ALL_RISK_ASSESSMENT_QUESTIONS}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

  Future<SDKServiceResponse<dynamic>> loadAllRiskAssessmentAnswers({String? contact, Map<String, dynamic>? filter}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:{
            //mockData goes here
          }
      );
    }
    String endpoint = "${LOAD_ALL_RISK_ASSESSMENT_ANSWERS}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }


  Future<SDKServiceResponse<dynamic>> loadAllIdentityTypes({String? contact, Map<String, dynamic>? filter}) async {
    if (_isTest) {
      return SDKServiceResponse.success(
          data:[
          {
          "id": 'ff808181721bd8c1017221fa64060009',
          "dateCreated": '2020-05-17T09:32:37Z',
          "name": 'Certificate of Incorporation',
          "lastUpdated": '2020-05-17T09:32:37Z',
          "serialised": 'Certificate of Incorporation',
          "archived": false,
          "totalCount": 8,
          "baseCurrency": null,
          "quickReference": '64060009',
          "class": 'soupbroker.setting.IdentityType'
          },
          {
          "id": 'ecbd5d077035552d017035a80742000a',
          "dateCreated": '2020-02-11T12:09:29Z',
          "name": 'Drivers Licence',
          "lastUpdated": '2020-02-19T12:22:24Z',
          "serialised": 'Drivers Licence',
          "archived": false,
          "totalCount": 8,
          "baseCurrency": null,
          "quickReference": '0742000A',
          "class": 'soupbroker.setting.IdentityType'
          },
      {
      "id": 'ff8081818da6ab85018da7cd53a00029',
      "dateCreated": '2024-02-14T13:27:47Z',
      "name": 'Ghana Card',
      "lastUpdated": '2024-02-14T13:27:47Z',
      "serialised": 'Ghana Card',
      "archived": false,
      "totalCount": 8,
      "baseCurrency": null,
      "quickReference": '53A00029',
      "class": 'soupbroker.setting.IdentityType'
      },
      {
      "id": 'ecbd5d077035552d017035a873b5000b',
      "dateCreated": '2020-02-11T12:09:57Z',
      "name": 'National ID',
      "lastUpdated": '2020-02-19T12:22:24Z',
      "serialised": 'National ID',
      "archived": false,
      "totalCount": 8,
      "baseCurrency": null,
      "quickReference": '73B5000B',
      "class": 'soupbroker.setting.IdentityType'
      },
      {
      "id": 'ecbd5d077035552d017035a6be4e0008',
      "dateCreated": '2020-02-11T12:08:05Z',
      "name": 'Passport',
      "lastUpdated": '2020-02-19T12:22:24Z',
      "serialised": 'Passport',
      "archived": false,
      "totalCount": 8,
      "baseCurrency": null,
      "quickReference": 'BE4E0008',
      "class": 'soupbroker.setting.IdentityType'
      },
      {
      "id": 'ecbd5d077035552d017035a8dd50000c',
      "dateCreated": '2020-02-11T12:10:24Z',
      "name": 'SSNIT Card',
      "lastUpdated": '2020-02-19T12:22:24Z',
      "serialised": 'SSNIT Card',
      "archived": false,
      "totalCount": 8,
      "baseCurrency": null,
      "quickReference": 'DD50000C',
      "class": 'soupbroker.setting.IdentityType'
      },
      {
      "id": 'ff80818187c6e44d0187c73229de0489',
      "dateCreated": '2023-04-28T09:29:26Z',
      "name": 'Trial Identity Type',
      "lastUpdated": '2023-04-28T09:29:26Z',
      "serialised": 'Trial Identity Type',
      "archived": false,
      "totalCount": 8,
      "baseCurrency": null,
      "quickReference": '29DE0489',
      "class": 'soupbroker.setting.IdentityType'
      },
          {
          "id": 'ecbd5d077035552d017035a7a5f80009',
          "dateCreated": '2020-02-11T12:09:04Z',
          "name": 'Voter ID',
          "lastUpdated": '2020-02-19T12:22:24Z',
          "serialised": 'Voter ID',
          "archived": false,
          "totalCount": 8,
          "baseCurrency": null,
          "quickReference": 'A5F80009',
          "class": 'soupbroker.setting.IdentityType'
          }
          ]
      );
    }
    String endpoint = "${LOAD_ALL_IDENTITY_TYPES}.json";
    final queryParameters = {
      'contact': contact,
      ...?filter
    };
    return _sdkServiceRequest.get(endpoint: endpoint, queryParameters: queryParameters);
  }

}