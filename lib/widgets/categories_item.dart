import 'package:flutter/material.dart';
import 'package:flutter_navigation/screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(this.id, this.title, this.color, {super.key});

  // ignore: non_constant_identifier_names
  void SelectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategorisMealScreen.routeName,
        arguments: {'id': id, 'title': title});

  /*   Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return CategorisMealScreen(id, title);
        },
      ),
    ); */

  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectCategory(context),
      splashColor: Colors.red,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        // margin: EdgeInsets.all(15),
        // width: double.infinity,
        //height: 150,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.3),
              color,
            ],
            begin: Alignment.topRight,
            // end: Alignment.center,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 25),
        ),
      ),
    );
  }
}
