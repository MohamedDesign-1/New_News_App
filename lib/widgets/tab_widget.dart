import 'package:flutter/material.dart';
import 'package:newnewsapp/pages/news_details/news_widget.dart';
import 'package:newnewsapp/widgets/tab_item.dart';

import '../models/SourceResponse.dart';
import '../style/app_theme.dart';

class TabWidget extends StatefulWidget {
  final List<Sources> sourcesList;

  TabWidget({super.key, required this.sourcesList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    if (widget.sourcesList.isEmpty) {
      return Center(
        child: Text('No sources available' , style: ThemeApp.lightTheme.textTheme.titleMedium,),
      );
    }
    if (selectedIndex >= widget.sourcesList.length) {
      selectedIndex = 0;
    }

    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            tabAlignment: TabAlignment.start,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            isScrollable: true,
            indicatorColor: Colors.transparent,
            dividerColor: Colors.transparent,
            tabs: widget.sourcesList.map((source) {
              int currentIndex = widget.sourcesList.indexOf(source);
              return TabItem(source: source, isSelected: selectedIndex == currentIndex,);}).toList(),
          ),
          Expanded(
            child: NewsWidget(
              source: widget.sourcesList[selectedIndex],
            ),
          ),
        ],
      ),
    );
  }
}
