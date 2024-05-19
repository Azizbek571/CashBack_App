
import 'package:bonus_app_admin/exports.dart';


class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
 void hasToken(){
  var token = GetStorage().read('token');
  Timer(Duration(seconds: 2), (){
 if(token==null){
    Get.off(()=>const LoginPage());
  }else{
    Get.off(()=>const MainPage());}
  });
 

  }
 

@override
  void initState() {
    hasToken();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: CircularProgressIndicator() ,),
    );
  }
}