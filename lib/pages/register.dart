// import 'package:bonus_app_admin/exports.dart';

// class RegisterPage extends StatefulWidget {
//   const RegisterPage({super.key});

//   @override
//   State<RegisterPage> createState() => _RegisterPageState();
// }

// class _RegisterPageState extends State<RegisterPage> {
//   LoginController controller = Get.put(LoginController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: SizedBox(
//           height: MediaQuery.sizeOf(context).height,
//           child: Padding(
//             padding: const EdgeInsets.all(24),
//             child: Column(
//               children: [
//                 const SizedBox(height: 80),
//                 const Text(
//                   "Register",
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
//                 ),
//                 const SizedBox(height: 50),
//                 Input(
//                   hintText: 'Enter your full name',
//                   controller: controller.fullName,
//                 ),
//                 const SizedBox(height: 16),
//                 Input(
//                   hintText: 'Enter your phone number',
//                   controller: controller.phone,
//                 ),
//                 const SizedBox(height: 16),
//                 Input(
//                   hintText: 'Enter your password',
//                   controller: controller.password,
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 16),
//                 Input(
//                   hintText: 'Confirm your password',
//                   controller: controller.password2,
//                   obscureText: true,
//                 ),
//                 const SizedBox(height: 15),
//                 Button(
//                   onTap: () {
//                     controller.register();
//                   },
//                   text: "Register",
//                 ),
//                 const SizedBox(height: 100),
//                  Row(
//                   children: [
//                     const Text("Already have an account?"),
//                     const SizedBox(width: 5),
//                     InkWell(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: const Text(
//                         "Sign in!",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             color: Color.fromARGB(255, 54, 171, 229)),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
