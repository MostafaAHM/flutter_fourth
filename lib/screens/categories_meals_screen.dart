import 'package:flutter/material.dart';
import 'package:flutter_navigation/models/meal.dart';
//import '../dummy_data.dart';
import '../widgets/meal_item.dart';

class CategorisMealScreen extends StatefulWidget {
  static const routeName = '/Category_meals';

  final List<Meal> availableMeals;
  CategorisMealScreen(this.availableMeals);

  // final String categoryid;
  // final String categoryTitel;
//  const CategorisMealScreen(this.categoryid, this.categoryTitel, {super.key});

  @override
  State<CategorisMealScreen> createState() => _CategorisMealScreenState();
}

class _CategorisMealScreenState extends State<CategorisMealScreen> {
  // ignore: non_constant_identifier_names
  // static String id = 'c1';

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryid = routeArgs['id'];
    final categoryTitel = routeArgs['title'];

    final categoryMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryid); //       widget.categoryid
    }).toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 238, 152),
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(categoryTitel!), //  widget.categoryTitel
      ),
      body: ListView.builder(
          itemCount: categoryMeals.length,
          itemBuilder: (ctx, index) {
            return (MealItem(
              id: categoryMeals[index].id,
              title: categoryMeals[index].title,
              imageUrl: categoryMeals[index].imageUrl,
              duration: categoryMeals[index].duration,
              affordability: categoryMeals[index].affordability,
              complexity: categoryMeals[index].complexity,
            ));
          }),
    );
  }
}
