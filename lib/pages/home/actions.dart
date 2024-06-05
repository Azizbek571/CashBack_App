import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/pages/home/add_bonus.dart';
import 'package:bonus_app_admin/pages/home/remove_bonus.dart';

class ActionsPage extends StatefulWidget {
  const ActionsPage({super.key});

  @override
  State<ActionsPage> createState() => _ActionsPageState();
}

class _ActionsPageState extends State<ActionsPage> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            title: Text("Amallar"),
          ),
          body: controller.loading || controller.customer == null
              ? const Center(
                  child: Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: CircularProgressIndicator()),
                )
              : Container(
                padding: EdgeInsets.all(15),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(controller.customer!.name),
                        leading: const Icon(Icons.person_3_sharp),
                      ),
                      ListTile(
                        title: Text('+${controller.customer!.username}'),
                        leading: const Icon(Icons.phone_iphone_sharp),
                      ),
                      ListTile(
                        title: Text(controller.customer!.code),
                        leading: const Icon(Icons.qr_code_outlined),
                      ),
                      ListTile(
                        title: Text(controller.customer!.summa.toString()),
                        leading: const Icon(Icons.attach_money_rounded),
                      ),
                      Button(onTap: (){
                        Get.to(()=> const BonusPage());
                      }, text: "Add bonus"),
                      const SizedBox(height: 16),

                      controller.customer!.summa>1000?
                      Button(onTap: (){
                        Get.to(()=> const RemoveBonusPage());
                      }, text: "Take from the bonus", color: Colors.red,): const SizedBox()
                    ],
                  ),
                ));
    });
  }
}
