import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/pages/Rate/add_rate.dart';

class RatePage extends StatefulWidget {
  const RatePage({super.key});

  @override
  State<RatePage> createState() => _RatePageState();
}

class _RatePageState extends State<RatePage> {
  RateController controller = Get.put(RateController());
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
                    Get.to(() => AddRates());
                  },
                  icon: Icon(Icons.add))
            ],
          ),
          body:
          controller.loading?
          CircularProgressIndicator():
           SingleChildScrollView(
            child: Column(
              children: [
                RateItem()
              ],
            ),
          ),
        );
      },
    );
  }
}

class RateItem extends StatelessWidget {
  const RateItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [Text("Till"), Text("50000")],
                ),
                Column(
                  children: [Text("2%"), Text("2 max bonus")],
                ),
              ],
            ),
            Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.check_box)),
                Text("State: Active")
    
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.delete)),
                Text("State: Active")
    
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
