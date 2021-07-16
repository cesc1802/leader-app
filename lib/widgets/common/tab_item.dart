import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    Key? key,
    required this.text,
  }) : super(key: key);

  final String text;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        text,
        style: Theme.of(context).textTheme.bodyText2!.copyWith(
              color: Colors.white,
              fontSize: 12,
            ),
      ),
    );
  }
}
