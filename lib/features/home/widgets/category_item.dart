import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    Key? key,
    required this.imgDir,
    required this.text,
    this.onTap,
  }) : super(key: key);

  final String imgDir;
  final String text;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(
              Dimens.gap_dp8,
            ),
            child: Image.asset(imgDir),
          ),
          Positioned(
            bottom: 0,
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontSize: 12,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
