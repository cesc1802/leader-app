import 'package:flutter/material.dart';
import 'package:leader_app/features/decision/pages/approved_decision.dart';
import 'package:leader_app/features/home/pages/home_page.dart';
import 'package:leader_app/features/home/widgets/category_item.dart';
import 'package:leader_app/resources/dimens.dart';
import 'package:leader_app/utils/ui_data.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        CategoryItem(
          text: 'Tra cứu \ncông dân',
          imgDir: UIData.categoryTraCuuCCCD,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        Gaps.hGap8,
        CategoryItem(
          imgDir: UIData.categoryTraCuuPT,
          text: "Tra cứu \nphương tiện",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            );
          },
        ),
        Gaps.hGap8,
        CategoryItem(
          imgDir: UIData.categoryTraCuuPT,
          text: "Phê duyệt \nquyết định",
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ApprovedDecision(),
              ),
            );
          },
        ),
        Gaps.hGap8,
      ],
    );
  }
}
