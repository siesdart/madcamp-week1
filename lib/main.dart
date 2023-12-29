import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madcamp_week1/screens/contact_screen.dart';
import 'package:madcamp_week1/screens/gallery_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Week 1',
      theme: _buildThemeData(),
      home: MyHomePage(),
    );
  }

  ThemeData _buildThemeData() {
    final base = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    );

    return base.copyWith(
      appBarTheme: base.appBarTheme
          .copyWith(backgroundColor: base.colorScheme.inversePrimary),
      textTheme: GoogleFonts.ibmPlexSansKrTextTheme(base.textTheme),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final _currentIndexCtrl = StreamController<int>();

  MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: _currentIndexCtrl.stream,
      builder: (context, snapshot) {
        final currentIndex = snapshot.hasData ? snapshot.data! : 0;
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: const Text('Week 1'),
          ),
          body: IndexedStack(
            index: currentIndex,
            children: [
              const ContactScreen(),
              GalleryScreen(),
              const Text('Tab 3'),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: _currentIndexCtrl.add,
            items: const [
              BottomNavigationBarItem(
                label: '탭 1',
                icon: Icon(Icons.person),
              ),
              BottomNavigationBarItem(
                label: '탭 2',
                icon: Icon(Icons.image),
              ),
              BottomNavigationBarItem(
                label: '탭 3',
                icon: Icon(Icons.question_mark),
              ),
            ],
          ),
        );
      },
    );
  }
}
