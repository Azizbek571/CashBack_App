import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/pages/customers/add_customer.dart';
import 'package:bonus_app_admin/pages/customers/user_page.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({super.key});

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  CustomerController controller = Get.put(CustomerController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              "  Members",
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 22),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    Get.to(() => const AddCustomer());
                  },
                  icon: const Icon(Icons.add))
            ],
          ),
          body: SingleChildScrollView(
            child: controller.loading
                ? const CircularProgressIndicator()
                : Column(
                    children:
                        List.generate(controller.customers.length, (index) {
                    var item = controller.customers[index];
                    return ListTile(
                      onTap: () {
                        Get.to(() => const UserPage());
                      },
                      title: Text(
                        item.name,
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      subtitle: Text(item.code),
                      trailing: Text(item.summa.toString()),
                      leading: Icon(
                        item.active == 1
                            ? Icons.lightbulb
                            : Icons.check_box_outline_blank,
                        color: Colors.yellow[500],
                      ),
                      
                    );
                  })),
          ),
        );
      },
    );
  }
}
