import 'package:bonus_app_admin/exports.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      builder: (controller) {
        return Scaffold(
        body: controller.loading ? const Center(child: CircularProgressIndicator()):
         SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            child: Padding(
              padding: const EdgeInsets.all(24),
              
              child: 
              Column(
                children: [
                  Image.asset('assets/images/logo.png', width: 150),
                  const SizedBox(height: 100),
                   const Text(
                    "Welcome!",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(height: 20),
      
                  Input(
                    hintText: 'Enter Login',
                    controller: controller.username,
                  ),
                  const SizedBox(height: 16),
                  Input(
                    hintText: 'Enter your password',
                    controller: controller.password,
                    obscureText: true,
                  ),
                  const SizedBox(height: 15),
                  Button(
                    onTap: () {
                      print('object');
                      controller.login();
                    },
                    text: "Enter test",
                  ),
                  const SizedBox(height: 100),
                  //  Row(
                  //   children: [
                  //     const Text("No account?"),
                  //     const SizedBox(width: 5),
                  //     InkWell(
                  //         onTap: () {
                  //         Get.to(()=> const RegisterPage());
                  //       },
                  //       child: const Text(
                          
                  //         "Sign up!",
                  //         style: TextStyle(
                  //             fontWeight: FontWeight.w600,
                  //             color: Color.fromARGB(255, 54, 171, 229)),
                  //       ),
                  //     ),
                  //   ],
                  // )
                ],
              ),
            ),
          ),
        ),
      );
      },
      
    );
  }
}
