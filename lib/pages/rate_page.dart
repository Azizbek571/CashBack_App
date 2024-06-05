import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/pages/Rate/add_rate.dart';

class RatePage extends StatefulWidget {
  const RatePage({super.key});

  @override
  State<RatePage> createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  RateController controller = Get.put(RateController());
  TextEditingController controllerUser = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RateController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Rates"),
            actions: [
              IconButton(
                  onPressed: () {
                    controller.sum.clear();
                    controller.percent.clear();
                    Get.to(() => const AddRates());
                    controller.selectedRateId = null;
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          body: controller.loading
              ? const CircularProgressIndicator()
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ...List.generate(controller.rates.length, (index) {
                        return RateItem(
                          item: controller.rates[index],
                          controller: controller,
                        );
                      })
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class RateItem extends StatelessWidget {
  RateItem({
    super.key,
    required this.item,
    required this.controller,
  });
  RateModel item;
  RateController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        controller.sum.text = item.summa.toString();
        controller.percent.text = item.percent.toString();
        controller.selectedRateId = item.id;

        Get.to(() => const AddRates());
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [const Text("Till"), Text(item.summa.toString())],
                  ),
                  Column(
                    children: [
                      Text('${item.percent}%'),
                      Text(
                          "${((item.percent / 100) * item.summa).ceil()}max bonus")
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.dialog(ConfirmDialog(
                                title: "Attention!",
                                text:
                                    "Do you want to confirm the rate with ${item.summa} ${item.active == 0 ? 'to activate?' : 'deactivate?'}",
                                onTap: () {
                                  controller.changeActive(item.id);
                                }));
                          },
                          icon: Icon(item.active == 1
                              ? Icons.check_box
                              : Icons.check_box_outline_blank)),
                      Text(item.active == 1 ? "Active" : "Not active")
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                          onPressed: () {
                            Get.dialog(
                              ConfirmDialog(
                                  title: "Attention!",
                                  text:
                                      'Do you confirm to delete the rate with ${item.summa} and ${item.percent} %?',
                                  onTap: () {
                                    controller.deleteRate(item.id);
                                  }),
                            );
                          },
                          icon: const Icon(Icons.delete)),
                      const Text("Delete")
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
