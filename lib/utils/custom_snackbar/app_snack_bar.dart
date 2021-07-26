import 'package:flutter/material.dart';

class AppSnackBar extends StatefulWidget {
  final String message;

  const AppSnackBar.success({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  _AppSnackBarState createState() => _AppSnackBarState();
}

class _AppSnackBarState extends State<AppSnackBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.green,
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("Phê duyệt quyết định thành công"),
        ],
      ),
    );
  }
}
