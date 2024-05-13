import 'package:bonus_app_admin/config/my_dio.dart';
import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/pages/main_page.dart';
import 'package:dio/dio.dart';

class LoginController extends GetxController{
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool loading=false;
  var myDio = MyDio().dio();

  bool validate(){
    return username.text.trim().isEmpty || password.text.trim().isEmpty;
  }
  snackbar(String message){
    Get.snackbar("Error", message);
  }

  void login()async{
   if(validate()){
    snackbar("Enter the full info");
    return;
   }
   if(loading)return;
   try{
    loading=true;
    update();
    // await Future.delayed(Duration(seconds: 3));
    var res = await myDio.post('/admin/login', data:{
      "username": username.text.trim(),
      "password": password.text.trim(),
    });
    print(res.data['token']);
    GetStorage().write('token', res.data['token']);
  Get.off(()=>const MainPage());
   }on DioException catch(err){
    snackbar(err.response!.data['message']);
   }finally{
    loading=false;
    update();
   }
  }









  // void register()async{
  //   if(loading)return;
  //   loading=true;
  // if(validate()){
  //   Get.snackbar("Error", "Enter the info corrrectly");
  //   await Future.delayed(const Duration(seconds: 3));
  //   loading=false;
  //   return;
  // }
  // if(password.text.trim() != password2.text.trim()){
  //   Get.snackbar("Error", "Error");
  //   await Future.delayed(const Duration(seconds: 3));

  //   loading=false;
  //   return;
  // }
  // try{
  //   var res = await myDio.post('/users/register', data: {
  //     "fullName": fullName.text.trim(),
  //     "phone": phone.text.trim(),
  //     "password": password.text.trim(),
  //   });
  //   phone.clear();
  //   password.clear();
  // Get.offAll(()=> const LoginPage());
  // }catch(err){
  //   print(err);

  // }finally{
  //   loading=false;
  // }
  // }
}