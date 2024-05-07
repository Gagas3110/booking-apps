import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(''),
          //leading: const Icon(Icons.menu),
          elevation: 0,
          backgroundColor: ThemeData().scaffoldBackgroundColor,
          actions: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.menu,
                color: Color(0xFFF68014),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.notifications,
                color: Color(0xFFF68014),
              ),
            ),
          ],
        ),
        body: Column(
          children: const [
            Text('Explore this'),
            Text(
              'Fantastic Earth',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ));
  }
}
