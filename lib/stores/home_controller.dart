import 'package:bonus_app_admin/config/my_dio.dart';
import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/models/customer.dart';
import 'package:bonus_app_admin/models/status_market.dart';
import 'package:bonus_app_admin/models/user.dart';
import 'package:bonus_app_admin/pages/home/actions.dart';

class HomeController extends GetxController {
  var myDio = MyDio().dio();
  bool loading = false;
  UserModel? user;

  fetchAuth() async {
    try {
      loading = true;
      var res = await myDio.get('/admin/auth');
      user = UserModel.fromJson(res.data);
    fetchStatusMarket();

    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }

  logOut() async {
    await GetStorage().remove('token');
    Get.offAll(() => const LoginPage());
  }

  @override
  void onInit() {
    fetchAuth();
    super.onInit();
  }

  String barcode = '';

  scanBarcode() async {
    if (loading) return;
    loading = true;
    // var res = await Get.to(()=> const SimpleBarcodeScannerPage());
    // barcode = res;
    barcode = '1697644018625';
    Get.to(() => ActionsPage());
    getCustomerFromBarcode();
  }

  CustomerModel? customer;
  getCustomerFromBarcode() async {
    try {
      var res = await myDio.get('/customer/get_customer_from_barcode/$barcode');
      customer = CustomerModel.fromJson(res.data);
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }

  snackbar(String message) {
    Get.snackbar("Error", message,
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  TextEditingController summa = TextEditingController();
  TextEditingController bonussumma = TextEditingController();
  addBonus() async {
    if (loading) return;
    if (summa.text.trim().isEmpty) {
      snackbar("Add the sum");
      return;
    }
    try {
      loading = true;
      update();
      var res = await myDio.put('/actions/add_bonus/${customer!.id}',
          data: {"summa": summa.text.trim()});
      summa.clear();
      Get.back();
      Get.back();
      Get.snackbar("Added", res.data['message']);
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }
  removeBonus() async {
    if (loading) return;
    if (summa.text.trim().isEmpty || bonussumma.text.trim().isEmpty) {
      snackbar("Add the full info");
      return;
    }
    if(customer!.summa<int.parse(bonussumma.text.trim())){
        snackbar("The required bonus amount is more than the exicting bonus amount");
      return;
    }
    try {
      loading = true;
      update();
      var res = await myDio.put('/actions/remove_bonus/${customer!.id}',
          data: {"summa": summa.text.trim(), "bonus_summa": bonussumma.text.trim()});
      summa.clear();
      bonussumma.clear();
      Get.back();
      Get.back();
      Get.snackbar("Added", res.data['message']);
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }



  StatusMarket? statusMarket;
  fetchStatusMarket()async{
    try{
      loading=true;
      update();
      var res = await myDio.get('/admin/statusMarket');
      statusMarket = StatusMarket.fromJson(res.data['data'][0]);
      print(res);
    }catch(err){
      print(err);
    }finally{
      loading=false;
      update();
    }
  }
  ChangeStatusMarket()async{
    try{
      if(loading)return;
      loading=true;
      update();
      var res = await myDio.put('/admin/changeStatusMarket');
      statusMarket!.active=res.data['statusMarket'];
      print(res);
    }catch(err){
      print(err);
    }finally{
      loading=false;
      update();
    }
  }
}
