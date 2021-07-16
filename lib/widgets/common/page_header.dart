import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    Key? key,
    required this.header,
  }) : super(key: key);

  final String header;
  @override
  Widget build(BuildContext context) {
    return Text(
      header,
      style:
          Theme.of(context).textTheme.headline1!.copyWith(color: Colors.white),
    );
  }
}
