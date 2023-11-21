import 'package:flutter/material.dart';

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaQuery = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Language',
              textAlign: TextAlign.start, style: theme.textTheme.bodyMedium),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 40, vertical: 16),
            padding: EdgeInsets.symmetric(horizontal: 10),
            width: mediaQuery.width,
            height: 50,
            decoration: BoxDecoration(
                border: Border.all(
              color: theme.primaryColor,
              width: 1.2,
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("English",
                    style: TextStyle(
                      color: theme.primaryColor,
                    )),
                Icon(Icons.arrow_drop_down_sharp, color: theme.primaryColor),
              ],
            ),
          )
        ],
      ),
    );
  }
}
