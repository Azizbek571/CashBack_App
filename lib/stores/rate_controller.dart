import 'package:bonus_app_admin/config/my_dio.dart';
import 'package:bonus_app_admin/exports.dart';

class RateController extends GetxController{
  TextEditingController sum = TextEditingController();
  TextEditingController percent = TextEditingController();
  bool loading=false;
  var myDio = MyDio().dio();

  validate(){
    return sum.text.trim().isEmpty || percent.text.trim().isEmpty;
  }
  snackbar(String message){
    Get.snackbar("Error", message,
    backgroundColor: Colors.red, colorText: Colors.white
    );
  }
 
  add()async{
    if(validate()){
      snackbar("Add the full info");
      return;
    }
    if(loading)return;
    try{
      loading=true;
      update();
      await myDio.post('/tariff', data:{
        "summa":sum.text,
        "percent": percent.text
      } );
      Get.back();
      Get.snackbar("Done", "% added");
    }catch(err){
      print(err);
    }finally{
      loading=false;
      update();
    }
  }


  fetchRates()async{
    try{
      loading=true;
      update();
   var res = await myDio.get('/tarif');
    }catch(err){
      print(err);
    }finally{
      loading=false;
      update();
    }
  }


@override
  void onInit() {
fetchRates();
    super.onInit();
  }
}