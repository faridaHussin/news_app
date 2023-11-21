import 'package:flutter/material.dart';

typedef OnMenuItemClick = void Function(MenuItem clickedItempos);

class HomeDrawer extends StatelessWidget {
  OnMenuItemClick onMenuItemClick;

  HomeDrawer(this.onMenuItemClick, {super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Drawer(
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                padding: EdgeInsets.symmetric(
                  vertical: 36,
                ),
                color: theme.primaryColor,
                alignment: Alignment.center,
                child: Text('News App!', style: theme.textTheme.bodyLarge)),
            SizedBox(
              height: 7,
            ),
            InkWell(
              onTap: () {
                onMenuItemClick(MenuItem.categories);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.list,
                    size: 26,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Categories', style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
            SizedBox(
              height: 7,
            ),
            InkWell(
              onTap: () {
                onMenuItemClick(MenuItem.settings);
              },
              child: Row(
                children: [
                  Icon(
                    Icons.settings,
                    size: 26,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('Settings', style: theme.textTheme.bodyMedium),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum MenuItem {
  categories,
  settings,
}
