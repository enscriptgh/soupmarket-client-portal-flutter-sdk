import 'package:get/get.dart';
import 'package:soupmarket_sdk/service/sdk_service_request.dart';

class SoupMarketController extends GetxController {
  final _isLoading = false.obs;
  final _user = Rxn<Map<String, dynamic>>();
  final _orderHistory = <Map<String, dynamic>>[].obs;

  bool get isLoading => _isLoading.value;
  Map<String, dynamic>? get user => _user.value;
  List<Map<String, dynamic>> get orderHistory => _orderHistory;

  Future<void> login(String email, String password) async {
    try {
      _isLoading.value = true;
      // final result = await SDKServiceRequest().login(
      //   email: email,
      //   password: password,
      // );
      // _user.value = result;
    } finally {
      _isLoading.value = false;
    }
  }

// Add more controller methods as needed
}