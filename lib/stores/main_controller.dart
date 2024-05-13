import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/pages/customers_page.dart';
import 'package:bonus_app_admin/pages/purchase.dart';
import 'package:bonus_app_admin/pages/rate_page.dart';

class MainController extends GetxController{
  List menus = [
    { "text": "Main Page", 'icon':'', "page": const HomePage()},
    { "text": "Rate", 'icon':'', "page": const RatePage()},
    { "text": "Members", 'icon':'', "page": const CustomerPage()},
    { "text": "Purchase", 'icon':'', "page": const PurchasePage()},
    ];
   
  int currentPage = 0;

  chooseCurrentPage(){
    return menus[currentPage]['page'];
  }
  selectPage(int index){
    currentPage = index;
    update();
  }

}