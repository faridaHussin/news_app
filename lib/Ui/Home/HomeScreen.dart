import 'package:flutter/material.dart';
import 'package:news_app/Ui/Home/HomeDrawer.dart';
import 'package:news_app/Ui/Home/categories/CategoriesFragment.dart';
import 'package:news_app/Ui/Home/categories/Category.dart';
import 'package:news_app/Ui/Home/categoryDetails/CategoryDetalis.dart';
import 'package:news_app/Ui/Home/settings/SettingsFragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home';

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initState() {
    super.initState();
    selectedWidget = CategoriesFragment(onCategoryClick);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
            image: AssetImage(
              'assets/images/pattern.png',
            ),
            fit: BoxFit.cover,
          )),
      child: Scaffold(
        drawer: HomeDrawer(onMenuItemClick),
        appBar: AppBar(
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () => Scaffold.of(context).openDrawer(),
                icon: Icon(Icons.format_list_bulleted_rounded,
                    color: Colors.white));
          }),
          title: Text("News App", textAlign: TextAlign.center),
        ),
        body: selectedWidget,
      ),
    );
  }

  late Widget selectedWidget;

  void onMenuItemClick(MenuItem Item) {
    Navigator.pop(context);
    switch (Item) {
      case MenuItem.categories:
        {
          selectedWidget = CategoriesFragment(onCategoryClick);
        }
      case MenuItem.settings:
        {
          selectedWidget = SettingsFragment();
        }
    }
    setState(() {});
  }

  void onCategoryClick(Category category) {
    selectedWidget = CategoryDetails(category);
    setState(() {});
  }
}
