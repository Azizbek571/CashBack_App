import 'package:bonus_app_admin/exports.dart';
import 'package:flutter/material.dart';

class RemoveBonusPage extends StatefulWidget {
  const RemoveBonusPage({super.key});

  @override
  State<RemoveBonusPage> createState() => _RemoveBonusPageState();
}

class _RemoveBonusPageState extends State<RemoveBonusPage> {
  HomeController controller = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Take from the bonus",
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
        ),
        body: GetBuilder<HomeController>(builder: (controller) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              constraints: const BoxConstraints(maxWidth: 500),
              child: Column(
                children: [
                  Text(
                    "The client's bonus amount: ${controller.customer!.summa}",
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 20),
                  Input(
                      hintText: "All the purchase amount",
                      controller: controller.summa),
                  const SizedBox(height: 20),
                  Input(
                      change: (v) {
                        setState(() {});
                      },
                      hintText: "The amount of bonus",
                      
                      controller: controller.bonussumma),
                  const SizedBox(height: 16),
                  controller.summa.text.trim().isEmpty ||
                          controller.bonussumma.text.trim().isEmpty
                      ? SizedBox()
                      : Text(
                          "To pay : ${int.parse(controller.summa.text) - int.parse(controller.bonussumma.text)}"),
                  Button(
                      onTap: () {
                        controller.removeBonus();
                      },
                      text: "Remove")
                ],
              ),
            ),
          );
        }));
  }
}
