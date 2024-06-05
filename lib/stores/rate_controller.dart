import 'package:bonus_app_admin/exports.dart';

class RateController extends GetxController {
  TextEditingController sum = TextEditingController();
  TextEditingController percent = TextEditingController();
  int? selectedRateId;
  bool loading = false;
  var myDio = MyDio().dio();

  validate() {
    return sum.text.trim().isEmpty || percent.text.trim().isEmpty;
  }

  snackbar(String message) {
    Get.snackbar("Error", message,
        backgroundColor: Colors.red, colorText: Colors.white);
  }

  add() async {
    if (validate()) {
      snackbar("Add the full info");
      return;
    }
    if (loading) return;
    try {
      loading = true;
      update();
      await myDio
          .post('/tariff/$selectedRateId', data: {"summa": sum.text, "percent": percent.text});
      fetchRates();
      Get.back();
      Get.snackbar("Done", "The rate changed");
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }
  edit() async {
    if (validate()) {
      snackbar("Add the full info");
      return;
    }
    if (loading) return;
    try {
      loading = true;
      update();
      await myDio
          .put('/tariff', data: {"summa": sum.text, "percent": percent.text});
      fetchRates();
      Get.back();
      Get.snackbar("Done", "% added");
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }

  List<RateModel> rates = [];
  fetchRates() async {
    try {
      loading = true;
      update();
      var res = await myDio.get('/tariff');
      rates = rateListFromModel(res.data);
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }



changeActive(int id) async {
    try {
      if (loading) return;
      loading = true;
      update();
       await myDio.put('/tariff/active/$id');
      fetchRates();
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }




  deleteRate(int id) async {
    try {
      if (loading) return;
      loading = true;
      update();
       await myDio.delete('/tariff/$id');
      fetchRates();
    } catch (err) {
      print(err);
    } finally {
      loading = false;
      update();
    }
  }

  // deleteRate(int id)async{
  //   if(loading) return;

  //   try{
  //     loading=true;
  //     await myDio.delete('/tariff/$id');
  //     var index = rates.indexWhere((element) => element.id == id);
  //     if(index > -1){
  //       rates.removeAt(index);
  //     }
  //   }catch (err){
  //     print(err);
  //   }finally{
  //     loading=false;
  //     update();
  //   }
  // }

  @override
  void onInit() {
    fetchRates();
    super.onInit();
  }
}
