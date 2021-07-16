import 'package:flutter/material.dart';
import 'package:leader_app/widgets/common/tab_item.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({Key? key}) : super(key: key);

  @override
  _CustomTabBarState createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Create TabController for getting the index of current tab
    _controller = TabController(length: 3, vsync: this);

    _controller.addListener(() {
      setState(() {});
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: TabBar(
        controller: _controller,
        tabs: [
          TabItem(
            text: "Quyết định 02",
          ),
          TabItem(
            text: "Quyết định 18",
          ),
          TabItem(
            text: "Quyết định 20",
          ),
        ],
        unselectedLabelColor: Colors.white70,
        indicatorColor: Colors.white,
      ),
    );
  }
}
