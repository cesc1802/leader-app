import 'package:flutter/material.dart';
import 'package:leader_app/resources/dimens.dart';

class CategoryItemWidget extends StatelessWidget {
  final String image;
  final String title;

  const CategoryItemWidget({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(Dimens.gap_dp16),
          child: Image.asset(image),
        ),
        Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.all(Dimens.gap_dp12),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                stops: [0.2, 0.8],
                colors: [
                  Colors.black.withOpacity(.6),
                  Colors.black.withOpacity(.1)
                ],
              ),
              borderRadius: BorderRadius.circular(Dimens.gap_dp16),
            ),
          ),
        ),
        Positioned(
          left: 12,
          right: 12,
          bottom: 24,
          child: Text(
            title,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 15, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
