import 'package:flutter/material.dart';
//import 'package:flutter_navigation/models/meal.dart';
//import 'package:flutter_navigation/models/meal.dart';
import 'package:flutter_navigation/screens/categories_screen.dart';
import 'package:flutter_navigation/screens/favorites_screen.dart';
import 'package:flutter_navigation/widgets/main_drawer.dart';

class TabsScreen extends StatefulWidget {
static const routeName = '/Tab_screen';

  // const TabsScreen(void Function(Map<String, bool> FilterData) setFilters, {super.key});

  // ignore: non_constant_identifier_names

  // final VoidCallback SetsFilters;
  //TabsScreen(this.SetsFilters);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Widget> pages = [
    CategoriesScreen(),
    FavoritesScreen(),
  ];
  // ignore: non_constant_identifier_names
  int SelectPageIndex = 0;

  // ignore: non_constant_identifier_names
  void SelectPage(int index) {
    setState(() {
      SelectPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return // DefaultTabController(
        // length: 2,
        // child:
        Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 238, 152),
      appBar: AppBar(backgroundColor: Colors.red, title: const Text('Meals')
          /*  bottom: const TabBar(tabs: <Widget>[
            Tab(
              icon: Icon(Icons.category),
              text: 'Categories',
            ),
            Tab(
              icon: Icon(Icons.star),
              text: 'Favorites',
            ),
          ]),
        ),
        body: const TabBarView(
            children: <Widget>[CategoriesScreen(), FavoritesScreen()]),*/
          ),
      drawer: MainDrawer(), // SetsFilters as Function
      body: pages[SelectPageIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: SelectPage,
        currentIndex: SelectPageIndex,
        selectedLabelStyle: const TextStyle(fontSize: 22),
        // type: BottomNavigationBarType.shifting,
        backgroundColor: Colors.amber,
        selectedItemColor: Colors.red,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.category,
              //    color: Colors.red,
            ),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.star,
              //   color: Colors.red,
            ),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
