import 'package:flutter/material.dart';

import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';

/*   final String categoryId;
  final String categoryTitle;

  CategoryMealsScreen(this.categoryId, this.categoryTitle); */

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];

    final categoryMelas = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          // return Text(categoryMelas[index].title);
          return MealItem(
            id: categoryMelas[index].id,
            title: categoryMelas[index].title,
            imageUrl: categoryMelas[index].imageUrl,
            duration: categoryMelas[index].duration,
            affordability: categoryMelas[index].affordability,
            complexity: categoryMelas[index].complexity,
          );
        },
        itemCount: categoryMelas.length,
      ),
    );
  }
}
