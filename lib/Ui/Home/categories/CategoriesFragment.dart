import 'package:flutter/material.dart';

import 'Category.dart';
import 'CategoryWidget.dart';

typedef OnCategoryClick = void Function(Category category);

class CategoriesFragment extends StatelessWidget {
  OnCategoryClick onCategoryClick;

  CategoriesFragment(this.onCategoryClick, {super.key});

  List<Category> categories = Category.getAllCategories();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pick your category\nof interest',
              style: theme.textTheme.bodyMedium!
                  .copyWith(color: Color(0xFF4F5A69))),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 20,
              ),
              itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    onCategoryClick(categories[index]);
                  },
                  child: CategoryItem(categories[index], index)),
              itemCount: categories.length,
            ),
          )
        ],
      ),
    );
  }
}
