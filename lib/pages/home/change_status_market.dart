import 'package:bonus_app_admin/exports.dart';

class ChangeStatusMArket extends StatefulWidget {
  const ChangeStatusMArket({super.key});
  @override
  State<ChangeStatusMArket> createState() => _ChangeStatusMArketState();
}

class _ChangeStatusMArketState extends State<ChangeStatusMArket> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Change the working state"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "The state of Market",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  ToggleSwitch(
                    minWidth: 90.0,
                    initialLabelIndex: controller.statusMarket!.active,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 2,
                    labels: ['Closed', 'Open'],
                    activeBgColors: [
                      [Colors.pink],
                      [Colors.blue]
                    ],
                    changeOnTap: false,
                    onToggle: (index) {
                      Get.dialog(ConfirmDialog(
                          title: "Attention",
                          text: "Do you want to change the state of market?",
                          onTap: () {controller.ChangeStatusMarket();}));
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
