import 'package:flutter/material.dart';
import 'package:leader_app/themes/app_colors.dart';

class CustomSwitch extends StatefulWidget {
  final bool initValue;
  final ValueChanged<bool> onChanged;

  CustomSwitch({Key? key, required this.initValue, required this.onChanged})
      : super(key: key);

  @override
  _CustomSwitchState createState() => _CustomSwitchState();
}

class _CustomSwitchState extends State<CustomSwitch>
    with SingleTickerProviderStateMixin {
  late Animation _circleAnimation;
  late AnimationController _animationController;
  late bool _value = false;

  @override
  void initState() {
    super.initState();
    _value = widget.initValue;
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 60),
    );
    _circleAnimation = AlignmentTween(
            begin: _value ? Alignment.centerRight : Alignment.centerLeft,
            end: _value ? Alignment.centerLeft : Alignment.centerRight)
        .animate(
      CurvedAnimation(parent: _animationController, curve: Curves.linear),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _value = !_value;
              if (_animationController.isCompleted) {
                _animationController.reverse();
              } else {
                _animationController.forward();
              }
              _value == false
                  ? widget.onChanged(true)
                  : widget.onChanged(false);
            });
          },
          child: Container(
            width: 40.0,
            height: 20.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18.0),
              color: _circleAnimation.value == Alignment.centerLeft
                  ? AppColors.primaryColor
                  : null,
              border: _circleAnimation.value == Alignment.centerRight
                  ? Border.all(color: AppColors.disableColor)
                  : Border.all(color: AppColors.primaryColor),
            ),
            child: Container(
              margin: const EdgeInsets.all(2.0),
              alignment: !_value ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 18.0,
                height: 18.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _circleAnimation.value == Alignment.centerRight
                      ? AppColors.disableColor
                      : Colors.white,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
