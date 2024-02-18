import 'package:flutter/material.dart';
import 'package:flutter_navigation/screens/tabs_screen.dart';
//import 'package:flutter_navigation/dummy_data.dart';
//import 'package:flutter_navigation/models/meal.dart';
import 'package:flutter_navigation/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';

  // ignore: non_constant_identifier_names
  final Function SaveFilters;
  FilterScreen(this.SaveFilters);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  // ignore: non_constant_identifier_names
  bool GlutenFree = false;
  // ignore: non_constant_identifier_names
  bool Vegan = false;
  // ignore: non_constant_identifier_names
  bool Vegetarian = false;
  // ignore: non_constant_identifier_names
  bool LactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 245, 238, 152),
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('Filters!'),
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  final SelectedFilters = {
                    'gluton': GlutenFree,
                    'lactose': LactoseFree,
                    "vrgan": Vegan,
                    "vegetarian": Vegetarian,
                  };

                  widget.SaveFilters(SelectedFilters);
                  Navigator.of(context).pushNamed(TabsScreen.routeName);
                },
                icon: const Icon(Icons.save))
          ],
        ),
        drawer: const MainDrawer(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              child: const Text(
                'Adjust Your Meal Selection',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  SwitchListTile(
                      activeColor: Colors.amber,
                      title: const Text(
                        'Gluten-Free',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      value: GlutenFree,
                      subtitle: const Text('only include gluten-free meals'),
                      onChanged: (newvalue) {
                        setState(() {
                          GlutenFree = newvalue;
                        });
                      }),
                  SwitchListTile(
                      activeColor: Colors.amber,
                      title: const Text(
                        'Vegan',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      value: Vegan,
                      subtitle: const Text('only include vegan meals'),
                      onChanged: (newvalue) {
                        setState(() {
                          Vegan = newvalue;
                        });
                      }),
                  SwitchListTile(
                      activeColor: Colors.amber,
                      title: const Text(
                        'Vegetarian',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      value: Vegetarian,
                      subtitle: const Text('only include vegetarian meals'),
                      onChanged: (newvalue) {
                        setState(() {
                          Vegetarian = newvalue;
                        });
                      }),
                  SwitchListTile(
                      activeColor: Colors.amber,
                      title: const Text(
                        'Lactose-Free',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      value: LactoseFree,
                      subtitle: const Text('only include  lactose-Free meals'),
                      onChanged: (newvalue) {
                        setState(() {
                          LactoseFree = newvalue;
                        });
                      })
                ],
              ),
            )
          ],
        ));
  }
}
