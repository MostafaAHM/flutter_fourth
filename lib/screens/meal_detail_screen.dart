import 'package:flutter/material.dart';
import 'package:flutter_navigation/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal_detail';
  // ignore: non_constant_identifier_names
// final String Mealid;
  // const MealDetailScreen(this.Mealid);
  @override
  Widget build(BuildContext context) {
    final Mealid = ModalRoute.of(context)?.settings.arguments as String;

    // ignore: non_constant_identifier_names
    final SelectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == Mealid);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 245, 238, 152),
      appBar: AppBar(
        title: Text(SelectedMeal.title),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                SelectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'Ingredients',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.amber, width: 5),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                height: 150,
                width: 350,
                child: ListView.builder(
                    itemCount: SelectedMeal.ingredients.length,
                    itemBuilder: (ctx, index) {
                      return Card(
                          child: Container(
                        padding: const EdgeInsets.all(5),
                        color: Colors.orangeAccent,
                        child: Text(
                          SelectedMeal.ingredients[index],
                          style: const TextStyle(fontSize: 20),
                        ),
                      ));
                    })),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              child: const Text(
                'Steps',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.amber, width: 5),
                    borderRadius: BorderRadius.circular(10)),
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(5),
                height: 150,
                width: 350,
                child: ListView.builder(
                    itemCount: (SelectedMeal.steps.length),
                    itemBuilder: (ctx, index) {
                      return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.orangeAccent,
                          child: Text('#${(index + 1)}'),
                        ),
                        title: Text(SelectedMeal.steps[index]),
                      );
                    }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        child: const Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(Mealid);
        },
      ),
    );
  }
}
