import 'package:flutter/material.dart';
import 'package:flutter_navigation/screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {



  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
  });

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Luxurious';
      default:
        return 'Unknown';
    }
  }

  // ignore: non_constant_identifier_names
  void SelectMeal(BuildContext ctx) {

    Navigator.of(ctx).pushNamed(  MealDetailScreen.routeName , arguments: id);


 /* Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return MealDetailScreen(id);
        },
      ),
    );*/
    
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => SelectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 10,
                    child: Container(
                      width: 300,
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 10),
                      child: Text(
                        title,
                        style:
                            const TextStyle(fontSize: 26, color: Colors.white),
                        softWrap: true,
                        overflow: TextOverflow.fade,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(children: <Widget>[
                    const Icon(
                      Icons.schedule,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text('$duration min'),
                  ]),
                  Row(children: <Widget>[
                    const Icon(
                      Icons.work,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(complexityText),
                  ]),
                  Row(children: <Widget>[
                    const Icon(
                      Icons.attach_money,
                    ),
                    const SizedBox(
                      width: 6,
                    ),
                    Text(affordabilityText),
                  ]),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
