import 'package:flutter/material.dart';
import 'package:madcamp_week1/screens/gallery_detail_screen.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  final List<int> _likedImages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 192,
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
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
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
                  child: _buildGridView(Iterable<int>.generate(20)),
                ),
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: 192,
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
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blueAccent,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.all(16),
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
                  child: _buildGridView(_likedImages),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  GridView _buildGridView(Iterable<int> images) {
    return GridView.count(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      crossAxisCount: 3,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      children: images.map(_buildImageButton).toList(),
    );
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
    final isLiked = _likedImages.contains(imageIndex);
    final index = await Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryDetailScreen(
          imageIndex: imageIndex,
          isLiked: isLiked,
        ),
      ),
    );

    if (index != null) {
      setState(() {
        if (isLiked) {
          _likedImages.remove(index);
        } else {
          _likedImages.add(index);
        }
      });
    }
  }
}
