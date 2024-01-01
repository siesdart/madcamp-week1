import 'package:flutter/material.dart';
import 'package:madcamp_week1/screens/gallery_detail_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  late FToast _fToast;
  final List<int> _likedImages = [];

  void initState() {
    super.initState();
    _fToast = FToast()..init(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            // background blue container
            top: 0,
            right: 0,
            left: 0,
            bottom: MediaQuery.of(context).size.height * 0.60,
            // background blue container
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(120.0),
                ),
                color: Colors.blueAccent,
              ),
            ),
          ),
          Positioned(
            // main column1: every image
            top: 15.0,
            left: 20.0,
            right: 20.0,
            // main column1: every image
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Images',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10.0),
                  padding: EdgeInsets.all(20.0),
                  height: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38.0),
                    color: Colors.white,
                    //border: Border.all(color: Colors.blueGrey, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.7),
                        blurRadius: 5.0,
                        spreadRadius: 0.0,
                        offset: const Offset(0, 3),
                      )
                    ]
                  ),
                  child: (SingleChildScrollView(
                    child: Column(
                      children: [
                        GridView.count(
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          crossAxisCount: 3,
                          mainAxisSpacing: 4,
                          crossAxisSpacing: 4,
                          children: List.generate(20, _buildImageButton),
                        ),
                      ],
                    ),
                  )
                  )
                ),
              ],
            ),
          ),
          Positioned(
            // 2nd background container
            top: 450,
            right: 0,
            left: 0,
            bottom: 0,
            // background blue container
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(120.0),
                ),
                color: Colors.blueAccent,
              ),
            ),
          ),
          Positioned(
            // main column2: liked image
            top: 390,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const Text(
                  'Liked Images',
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 10.0),
                    padding: EdgeInsets.all(20.0),
                    height: 250.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(38.0),
                        color: Colors.white,
                        //border: Border.all(color: Colors.blueGrey, width: 1),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blueGrey.withOpacity(0.7),
                            blurRadius: 5.0,
                            spreadRadius: 0.0,
                            offset: const Offset(0, 3),
                          )
                        ]
                    ),
                    child: (SingleChildScrollView(
                      child: Column(
                        children: [
                          GridView.count(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            mainAxisSpacing: 4,
                            crossAxisSpacing: 4,
                            children: _likedImages.map(_buildImageButton).toList(),
                          ),
                        ],
                      ),
                    )
                    )
                ),
              ],
            ),
          ),
        ],
      ),
    );
    // return Padding(
    //   padding: const EdgeInsets.all(8),
    //   child: Column(
    //       const SizedBox(height: 8),
    //       Expanded(
    //         child: GridView.count(
    //           crossAxisCount: 3,
    //           mainAxisSpacing: 4,
    //           crossAxisSpacing: 4,
    //           children: _likedImages.map(_buildImageButton).toList(),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget _buildImageButton(int index) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/${index + 1}.jpeg'),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _onImageButtonPressed(index),
        ),
      ),
    );
  }

  Future<void> _onImageButtonPressed(int imageIndex) async {
    final index = await Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryDetailScreen(imageIndex: imageIndex),
      ),
    );

    if (index != null) {
      if(_likedImages.contains(index)){
          flutterToast("This image already exists in 'liked images'.");
      }
      else{
        setState(() => _likedImages.add(index));
      }
    }
  }

  void flutterToast(String msg) {
    _fToast.showToast(
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 2,
        ),
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(38),
          ),
          color: Colors.white70,
        ),
        child: Text(
          msg,
          style: const TextStyle(
            color: Colors.blueAccent,
            fontSize: 13,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      toastDuration: const Duration(seconds: 2),
      gravity: ToastGravity.TOP,
    );
  }
}
