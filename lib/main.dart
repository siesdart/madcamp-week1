import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madcamp_week1/screens/contact_screen.dart';
import 'package:madcamp_week1/screens/gallery_screen.dart';
import 'package:madcamp_week1/screens/game_screen.dart';

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
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigoAccent),
      appBarTheme: const AppBarTheme(color: Colors.indigoAccent),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        type: BottomNavigationBarType.fixed,
      ),
      useMaterial3: true,
    );

    return base.copyWith(
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
          body: SafeArea(
            child: IndexedStack(
              index: currentIndex,
              children: const [
                ContactScreen(),
                GalleryScreen(),
                GameScreen(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: _currentIndexCtrl.add,
            items: const [
              BottomNavigationBarItem(
                label: 'Contact',
                icon: Icon(Icons.person),
              ),
              BottomNavigationBarItem(
                label: 'Gallery',
                icon: Icon(Icons.image),
              ),
              BottomNavigationBarItem(
                label: 'Game',
                icon: Icon(Icons.videogame_asset),
              ),
            ],
          ),
        );
      },
    );
  }
}
