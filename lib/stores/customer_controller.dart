import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/models/customer.dart';

class CustomerController extends GetxController {
  TextEditingController fullName = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController search = TextEditingController();

  bool loading = false;

  var mydio = MyDio().dio();

  validate() {
    return fullName.text.trim().isEmpty ||
        phone.text.trim().isEmpty ||
        password.text.trim().isEmpty;
  }

  snackbar(String message) {
    Get.snackbar("Error", message,
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  addCustomer() async {
    if (validate()) {
      snackbar("Add the full info!");
      return;
    }
    if (loading) return;
    loading = true;
    try {
      await mydio.post('/customer', data: {
        "name": fullName.text,
        "username": phone.text,
        "password": password.text
      });

      Get.back();
    } catch (err) {
      print(err);
    } finally {
      loading = false;
    }
  }

  List<CustomerModel> customers = [];
  fetchCustomers() async {
    loading = true;
    update();
    try {
      var res = await mydio
          .get('/customer', queryParameters: {"search": search.text.trim()});
      customers = listFromCustomerModel(res.data['data']);
    } catch (err) {
      print(err);

    } finally {
      loading = false;
      update();

    }
  }

  @override
  void onInit() {
    fetchCustomers();
    super.onInit();
  }
}
