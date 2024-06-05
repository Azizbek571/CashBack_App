import 'package:bonus_app_admin/config/icons.dart';
import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/pages/customers/customers_page.dart';
import 'package:bonus_app_admin/pages/purchase.dart';
import 'package:bonus_app_admin/pages/rate_page.dart';

class MainController extends GetxController{
  List menus = [
    { "text": "Main Page", 'icon': AppIcons.home, "page": const HomePage()},
    { "text": "Rate", 'icon':AppIcons.percent, "page": const RatePage()},
    { "text": "Members", 'icon':AppIcons.users, "page": const CustomerPage()},
    { "text": "Purchase", 'icon':AppIcons.money, "page": const PurchasePage()},
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