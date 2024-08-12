import 'package:flutter/material.dart';
import 'package:newnewsapp/widgets/tab_item.dart';

import '../models/SourceResponse.dart';

class TabWidget extends StatefulWidget {
  List<Sources> sourcesList ;

  TabWidget({super.key, required this.sourcesList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
    length: widget.sourcesList.length,
    child: TabBar(
    onTap: (index){
      selectedIndex = index;
      setState(() {});
    },
    isScrollable: true,
    indicatorColor: Colors.transparent,
    dividerColor: Colors.transparent,

    tabs: widget.sourcesList.map((source) =>
    TabItem(source: source, isSelected: selectedIndex == widget.sourcesList.indexOf(source),)).toList(),
      ),
    );
  }
}
