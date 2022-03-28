import 'package:demo/basket.dart';
import 'package:demo/main.dart';
import 'package:demo/search.dart';
import 'package:flutter/material.dart';

int _selectedIndex = 0;
List<String> cartItemName = [];
List<Color> cartItemPic = [];
List<int> cartItemAmount = [];

class NavBar extends StatefulWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    List<Widget> routes = [
      const MyHomePage(title: "UI Demo Home Page"),
      const Cart(),
    ];

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        title: const Text("UI Demo Home Page"),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              _openEndDrawer();
            },
          )
        ],
      ),
      endDrawer: Drawer(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Indstillinger",
                style: TextStyle(fontSize: 40),
              ),
              SizedBox(height: 200),
              const Text('Demo Settings Menu'),
              ElevatedButton(
                onPressed: _closeEndDrawer,
                child: const Text('Luk'),
              ),
              SizedBox(height: 300),
            ],
          ),
        ),
      ),
      body: routes[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.lightBlue[200],
        selectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Hjem"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Kurv",
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _openEndDrawer() {
    _scaffoldKey.currentState!.openEndDrawer();
  }

  void _closeEndDrawer() {
    Navigator.of(context).pop();
  }
}
