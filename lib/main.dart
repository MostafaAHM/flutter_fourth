import 'package:flutter/material.dart';
import 'package:flutter_navigation/screens/categories_meals_screen.dart';
import 'package:flutter_navigation/screens/meal_detail_screen.dart';
import 'package:flutter_navigation/screens/tabs_screen.dart';
import 'dummy_data.dart';
import 'models/meal.dart';
import 'screens/categories_screen.dart';
import 'package:flutter_navigation/screens/filter_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> Filters = {
    'GlutenFree': false,
    'Vegan': false,
    'Vegetarian ': false,
    'LactoseFree': false,
  };
  List<Meal> availableMeals = DUMMY_MEALS;

  // ignore: non_constant_identifier_names
  void SetFilters(Map<String, bool> FilterData) {
    setState(() {
      Filters = FilterData;
      availableMeals = DUMMY_MEALS.where((meal) {
        if (Filters['gluton']! && !meal.isGlutenFree) {
          return false;
        }
        if (Filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }
        if (Filters['vrgan']! && !meal.isVegan) {
          return false;
        }
        if (Filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

// ignore: non_constant_identifier_names
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TabsScreen(),
      ),
      // initialRoute: '/',
      routes: {
        //'/': (ctx) => TabsScreen(),
        TabsScreen.routeName: (ctx) => TabsScreen(),
        CategorisMealScreen.routeName: (ctx) =>
            CategorisMealScreen(availableMeals),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
        FilterScreen.routeName: (ctx) => FilterScreen(SetFilters),
      },
      //onGenerateRoute: ((settings) {}),
      onUnknownRoute: ((settings) {
        return MaterialPageRoute(builder: (ctx) => const CategoriesScreen());
      }),
    );
  }
}
