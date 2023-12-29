import 'package:flutter/material.dart';
import 'package:madcamp_week1/contact_screen.dart';
import 'package:madcamp_week1/gallery_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 1',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Week 1'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          const ContactScreen(),
          GalleryScreen(),
          const Text('Tab 3'),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Contact',
            icon: Icon(Icons.call),
          ),
          BottomNavigationBarItem(
            label: 'Gallery',
            icon: Icon(Icons.image),
          ),
          BottomNavigationBarItem(
            label: 'Arithmetic Games',
            icon: Icon(Icons.videogame_asset_rounded),
          ),
        ],
      ),
    );
  }


}