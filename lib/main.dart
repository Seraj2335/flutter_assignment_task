import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: PlayerAddApp(),
    );
  }
}

class PlayerAddApp extends StatefulWidget {
  PlayerAddApp({super.key});

  @override
  State<PlayerAddApp> createState() => _PlayerAddAppState();
}

class _PlayerAddAppState extends State<PlayerAddApp> {
  String name = "";

  List<String> listTileData = [];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(color: Colors.white),
                        width: size.width * 0.8,
                        child: TextField(
                          onChanged: (String value) {
                            setState(() {
                              name = value;
                            });
                          },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            listTileData.add(name);
                          });
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (listTileData.length < 2) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("Can't start,You have just two items")));
                        }
                      },
                      child: Text(
                        "LET'S PLAY",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
            Expanded(
                child: Container(
              color: Colors.white,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                  itemCount: listTileData.length,
                  itemBuilder: (context, index) => Container(
                        margin: EdgeInsets.only(bottom: 10),
                        decoration: BoxDecoration(color: Colors.amber),
                        height: 50,
                        width: size.width * 0.8,
                        child: ListTile(
                            leading: Text(
                              listTileData[index],
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: GestureDetector(
                              onTap: () {
                                setState(() {
                                  listTileData.removeAt(index);
                                });
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              ),
                            )),
                      )),
            ))
          ],
        ),
      )),
    );
  }
}
