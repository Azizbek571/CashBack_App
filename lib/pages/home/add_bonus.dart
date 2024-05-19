import 'package:bonus_app_admin/exports.dart';

class BonusPage extends StatefulWidget {
  const BonusPage({super.key});

  @override
  State<BonusPage> createState() => _BonusPageState();
}

class _BonusPageState extends State<BonusPage> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Add bonus"),
        ),
        body: GetBuilder<HomeController>(builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  Input(
                      hintText: "The sum of purchase",
                      controller: controller.summa),
                  const SizedBox(height: 16),
                  Button(onTap: () {
                    controller.addBonus();
                  }, text: "Add")
                ],
              ),
            ),
          );
        }));
  }
}
