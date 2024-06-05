import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/models/customer.dart';
import 'package:bonus_app_admin/stores/customer_controller.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key, 
  
   });
   
  
  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
 CustomerController controller = Get.put(CustomerController());


  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(builder: (controller) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "The client's info",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(Icons.edit),
                ))
          ],
        ),
        body: SingleChildScrollView(

          child:  controller.loading ? const CircularProgressIndicator() : const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              
              children: [
                
                Row(
                  children: [
                    Icon(Icons.contact_page_outlined, size: 40),
                    SizedBox(width: 20),
            
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Text("4848448"
                          ,
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text("Full Name",  style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                      ],
                    )
                  ],
                ),
                SizedBox( height: 20),
                
                Row(
                  children: [
                    Icon(Icons.arrow_forward_ios_outlined, size: 40),
                    SizedBox(width: 17),
            
                    Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "49494949494949",
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text("Login",  style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                      ],
                    )
                  ],
                ),
                SizedBox( height: 20),
                
                Row(
                  children: [
                    Icon(Icons.barcode_reader, size: 40),
                    SizedBox(width: 20),
            
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "9659595959595959",
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Text("Barcode",  style:
                              TextStyle(fontSize: 18, fontWeight: FontWeight.w400),),
                      ],
                    )
                  ],
                ),
                SizedBox( height: 20),
                Row(
                  children: [
                    Icon(Icons.check_box_outlined,color: Colors.green, size: 40),
                    SizedBox(width: 20),
            
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Active",
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("State",  style:
                                  TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                                  ),
                          ],
                        ),
                      ],
                    ), 
                    Spacer(),
                                  Icon(Icons.check_box, color: Colors.green, size: 40,)
                
                  ],
                ),
                    SizedBox(height: 20),
                
                Divider()
                
                
              ],
            ),
          ),
        ),
      );
    },
      
    );
  }
}
