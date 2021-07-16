import 'package:flutter/material.dart';

class RoundedIconButton extends StatelessWidget {
  final Function()? onPressed;
  final Color? color;
  final Widget? icon;
  final EdgeInsets? padding;

  const RoundedIconButton({
    Key? key,
    this.onPressed,
    this.color,
    this.icon,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 0,
      minWidth: 0,
      onPressed: onPressed,
      shape: CircleBorder(),
      padding: EdgeInsets.zero,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        padding: padding ?? EdgeInsets.all(8),
        child: icon,
      ),
    );
  }
}
