import 'package:bonus_app_admin/exports.dart';

class ConfirmDialog extends StatelessWidget {
  ConfirmDialog({
    super.key,
    required this.title,
    required this.text,
    required this.onTap,
  });
  final String title;
  final String text;
  Function onTap;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      actions: [
        TextButton(
            onPressed: () {
              onTap();
            Get.back();

            },
            child: const Text(
              "Confirm",
              style: TextStyle(fontSize: 16, color: Colors.deepPurple),
            )),
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Cancel",
              style: TextStyle(fontSize: 16, color: Colors.red)),
        )
      ],
      content: SingleChildScrollView(
        child: ListBody(
          children: [Text(text)],
        ),
      ),
    );
  }
}
