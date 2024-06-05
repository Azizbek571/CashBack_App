import 'package:bonus_app_admin/exports.dart';

class AddCustomer extends StatefulWidget {
  const AddCustomer({super.key});

  @override
  State<AddCustomer> createState() => _AddCustomerState();
}

class _AddCustomerState extends State<AddCustomer> {
  CustomerController controller = Get.put(CustomerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text("Add members"),
    ), body:
    Container(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    constraints: const BoxConstraints(maxWidth: 500),
    
    child: Column(children: [Input(hintText: "The full name of the client", 
    controller: controller.fullName  ),
    const SizedBox(height: 11),
    Input(hintText: "Phone number", controller: controller.phone ),
    const SizedBox(height: 11),
    Input(hintText: "Password", controller: controller.password ),
    const SizedBox(height: 11),
   Button(onTap: (){
controller.addCustomer();

   }, text: "Add")
    ],),
  ),
    );
  }
}