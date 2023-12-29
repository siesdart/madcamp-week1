import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:madcamp_week1/screens/contact_screen.dart';

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
          appBar: AppBar(title: const Text('Week 1')),
          body: IndexedStack(
            index: currentIndex,
            children: [
              const ContactScreen(),
              GridView.count(
                crossAxisCount: 3,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                padding: const EdgeInsets.all(4),
                children: createBox(20),
              ),
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

  List<Widget> createBox(int boxNum) {
    return List.generate(
      boxNum,
      (i) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('images/${i + 1}.jpeg'),
          ),
        ),
      ),
    );
  }
}
