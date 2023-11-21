import 'package:flutter/material.dart';

import '../../../model/SourceResponse/Source.dart';

class TabWidget extends StatelessWidget {
  Source source;
  bool isSelected;

  TabWidget(this.source, this.isSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: isSelected ? theme.primaryColor : Colors.white,
        border: Border.all(color: theme.primaryColor),
      ),
      child: Text(source.name ?? "",
          style: TextStyle(
            color: isSelected ? Colors.white : theme.primaryColor,
          )),
    );
  }
}
