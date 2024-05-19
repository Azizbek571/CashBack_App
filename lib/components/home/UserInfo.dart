import 'package:bonus_app_admin/exports.dart';
import 'package:bonus_app_admin/stores/home_controller.dart';

class UserInfo extends StatelessWidget {
   UserInfo({
    
    super.key,
    required this.controller
  });
   HomeController controller;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(Icons.person_2_outlined, size:34),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.user!.name,
              style: const TextStyle(
                  fontWeight: FontWeight.w600, fontSize: 20),
            ),
            Text(controller.user!.username)
          ],
        ),
      ],
    );
  }
}
