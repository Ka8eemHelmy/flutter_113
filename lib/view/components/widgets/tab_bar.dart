import 'package:flutter/material.dart';

class TabBarCustom extends StatelessWidget {
  final List<Widget> tabs;
  final List<Widget> children;

  const TabBarCustom({required this.tabs, required this.children, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.red,
            labelColor: Colors.red,
            unselectedLabelColor: Colors.grey,
            tabs: tabs,
          ),
          Expanded(
            child: TabBarView(
              children: children,
            ),
          ),
        ],
      ),
    );
  }
}
