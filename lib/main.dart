import 'package:flutter/material.dart';

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
          Text('Tab 1'),
          GridView.count(
              scrollDirection: Axis.vertical,
              crossAxisCount: 3,
              children: createBox(20),
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
              padding: const EdgeInsets.all(5.0)
          ),
          Text('Tab 3'),
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
            label: '탭 1',
            icon: Icon(Icons.call),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  List<Widget> createBox(int boxNum){
    List<Widget> images = [];
    List<String> urls = [];
    urls.add('images/1.jpeg');
    urls.add('images/2.jpeg');
    urls.add('images/3.jpeg');
    urls.add('images/4.jpeg');
    urls.add('images/5.jpeg');
    urls.add('images/6.jpeg');
    urls.add('images/7.jpeg');
    urls.add('images/8.jpeg');
    urls.add('images/9.jpeg');
    urls.add('images/10.jpeg');
    urls.add('images/11.jpeg');
    urls.add('images/12.jpeg');
    urls.add('images/13.jpeg');
    urls.add('images/14.jpeg');
    urls.add('images/15.jpeg');
    urls.add('images/16.jpeg');
    urls.add('images/17.jpeg');
    urls.add('images/18.jpeg');
    urls.add('images/19.jpeg');
    urls.add('images/20.jpeg');

    Widget image;
    int i=0;
    while(i < boxNum){
      image = Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image:AssetImage(urls[i])
            )
          )
      );
      images.add(image);
      i++;
    }
    return images;
  }
}



