import 'package:bonus_app_admin/exports.dart';

class AddRates extends StatefulWidget {
  const AddRates({super.key});

  @override
  State<AddRates> createState() => _AddRatesState();
}

class _AddRatesState extends State<AddRates> {
  RateController controller = Get.put(RateController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RateController>(
      builder: (controller) {
        return Scaffold(
        appBar: AppBar(
          title: const Text("Add the %"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal:16 ),
          constraints: BoxConstraints(maxWidth: 500),
            child: 
            controller.loading?CircularProgressIndicator():
            Column(
          children: [
            Input(hintText: "The amount of rate", controller: controller.sum, type: TextInputType.number,),
            const SizedBox(height: 10),
            Input(hintText: "The percent of rate", controller: controller.percent, type: TextInputType.number,),
            const SizedBox(height: 10),
      
            Button(onTap: (){controller.add();}, text: "Add")
      
          ],
        )),
      );
      },
      
    );
  }
}
