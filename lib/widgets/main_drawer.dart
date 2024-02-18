import 'package:flutter/material.dart';
import 'package:flutter_navigation/screens/filter_screen.dart';

import '../screens/tabs_screen.dart';
//import 'package:flutter_navigation/screens/tabs_screen.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});
  

  // ignore: non_constant_identifier_names
  /* void Selectategory(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return TabsScreen();
        },
      ),
    );
  }

  // ignore: non_constant_identifier_names
  void SelectFilter(BuildContext ctx) {
    Navigator.of(ctx).push(
      MaterialPageRoute(
        builder: (_) {
          return const FilterScreen();
        },
      ),
    );
  } */

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              height: 120,
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.centerLeft,
              color: Colors.amber,
              child: const Text(
                'Cooking Up!',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 30,
                    color: Colors.red),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(
                Icons.restaurant,
                size: 26,
              ),
              title: const Text(
                'Meals',
                style: TextStyle(
                  fontFamily: 'Robotocondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
             //  onTap: () => Selectategory(context),
              onTap: () {
                Navigator.of(context).pushNamed(TabsScreen.routeName);
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.settings,
                size: 26,
              ),
              title: const Text(
                'Filters',
                style: TextStyle(
                  fontFamily: 'Robotocondensed',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
             // onTap: () => SelectFilter(context),
              onTap: () {
                Navigator.of(context).pushNamed(FilterScreen.routeName);
              },
            )
          ],
        ),
      ),
    );
  }
}
