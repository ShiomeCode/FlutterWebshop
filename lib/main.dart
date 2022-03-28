import 'package:flutter/material.dart';

import 'detail.dart';
import 'nav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const NavBar(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> itemsTitles = [
    "Rød Garn",
    "Gul Garn",
    "Blå Garn",
    "Aqua Garn",
    "Rosa Garn",
    "Brun Garn",
    "Hvid Garn"
  ];
  List<Color> itemPics = [
    Colors.red, // Rød
    Colors.yellow, // Gul
    Colors.blue, // Blå
    Colors.teal, // Teal
    Colors.pink, // Rosa
    Colors.brown, // Brun
    Colors.white // Hvid
  ];

  Widget tile(String title, Color color, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9.0),
      child: ListTile(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DetailPage(
                        title: title,
                        image: color,
                      )));
        },
        leading: Container(
          height: 60,
          width: 80,
          child: Container(
            color: color,
          ),
        ),
        title: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const SizedBox(
        height: 50,
      ),
      const Center(
          child: Text(
        "Nye Produkter",
        style: TextStyle(fontSize: 24),
      )),
      SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemsTitles.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 160,
                child: TextButton(
                  child: Column(
                    children: [
                      Container(
                        height: 115,
                        color: Colors.lightBlue,
                        child: Container(color: itemPics[index]),
                      ),
                      Text(
                        "Luksus " + itemsTitles[index],
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  title: "Luksus " + itemsTitles[index],
                                  image: itemPics[index],
                                )));
                  },
                ),
              );
            },
          )),
      const SizedBox(
        height: 20,
      ),
      const Center(
          child: Text(
        "Populære Produkter",
        style: TextStyle(fontSize: 24),
      )),
      SizedBox(
          height: 150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: itemsTitles.length,
            itemBuilder: (context, index) {
              return SizedBox(
                width: 160,
                child: TextButton(
                  child: Column(
                    children: [
                      Container(
                        height: 115,
                        color: Colors.pink,
                        child: Container(
                            color: itemPics[itemPics.length - index - 1]),
                      ),
                      Text(
                        itemsTitles[itemPics.length - index - 1],
                        style: const TextStyle(fontSize: 16),
                      )
                    ],
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailPage(
                                  title:
                                      itemsTitles[itemPics.length - index - 1],
                                  image: itemPics[itemPics.length - index - 1],
                                )));
                  },
                ),
              );
            },
          )),
      const SizedBox(
        height: 20,
      ),
      // Streg
      Center(
        child: Container(
          width: 400,
          height: 1,
          color: Colors.black,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      const Center(
          child: Text(
        "Tidligere Besøgte",
        style: TextStyle(fontSize: 20),
      )),
      const SizedBox(
        height: 10,
      ),

      for (var i = 1; i < 7; i++) tile(itemsTitles[i], itemPics[i], context),
    ]);
  }
}
