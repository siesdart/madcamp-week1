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
            left: 0,
            right: 0,
            bottom: MediaQuery.of(context).size.height * 0.6,
            // background blue container
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(120),
                ),
                color: Colors.blueAccent,
              ),
            ),
          ),
          Positioned(
            // main column1: every image
            top: 15,
            left: 20,
            right: 20,
            // main column1: every image
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Images',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38),
                    color: Colors.white,
                    //border: Border.all(color: Colors.blueGrey, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.7),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: GridView.count(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: List.generate(20, _buildImageButton),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            // 2nd background container
            top: MediaQuery.of(context).size.height * 0.6,
            left: 0,
            right: 0,
            bottom: 0,
            // background blue container
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(120),
                ),
                color: Colors.blueAccent,
              ),
            ),
          ),
          Positioned(
            // main column2: liked image
            left: 20,
            right: 20,
            bottom: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                const Text(
                  'Liked Images',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  padding: const EdgeInsets.all(20),
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(38),
                    color: Colors.white,
                    //border: Border.all(color: Colors.blueGrey, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.7),
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: GridView.count(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 3,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    children: _likedImages.map(_buildImageButton).toList(),
                  ),
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
        borderRadius: BorderRadius.circular(14),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('images/${index + 1}.jpeg'),
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
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
