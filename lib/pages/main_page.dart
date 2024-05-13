import 'package:bonus_app_admin/exports.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainController controller = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: BottomAppBar(
            child: Row(
              children: List.generate(controller.menus.length, (index) {
                var item = controller.menus[index];
                return Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.selectPage(index);
                      },
                      child: Text(
                        item['text'],
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ));
              }),
            ),
          ),
          body: controller.chooseCurrentPage(),
        );
      },
    );
  }
}
