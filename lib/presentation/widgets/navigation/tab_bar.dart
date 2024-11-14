import 'package:flutter/material.dart';
import '../components/tab_contents.dart';

class CustomTabBar extends StatelessWidget {
  const CustomTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Column(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Details'),
              Tab(text: 'Features'),
              Tab(text: 'Designs'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                TabContent(tabTitle: 'Details'),
                TabContent(tabTitle: 'Features'),
                TabContent(tabTitle: 'Designs'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


