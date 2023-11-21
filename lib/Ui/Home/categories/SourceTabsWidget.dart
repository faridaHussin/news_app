import 'package:flutter/material.dart';
import 'package:news_app/Ui/Home/news/NewsListWidget.dart';

import '../../../model/SourceResponse/Source.dart';
import '../categoryDetails/TabWidget.dart';

class SourceTabsWidget extends StatefulWidget {
  List<Source> sources;

  SourceTabsWidget(this.sources, {super.key});

  @override
  State<SourceTabsWidget> createState() => _SourceTabsWidgetState();
}

class _SourceTabsWidgetState extends State<SourceTabsWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sources.length,
      child: Column(
        children: [
          TabBar(
            indicatorColor: Colors.transparent,
            onTap: (newIndex) {
              selectedIndex = newIndex;
              setState(() {});
            },
            isScrollable: true,
            tabs: widget.sources
                .map((source) => TabWidget(
                    source, widget.sources.indexOf(source) == selectedIndex))
                .toList(),
          ),
          Expanded(child: NewsListWidget(widget.sources[selectedIndex])),
        ],
      ),
    );
  }
}
