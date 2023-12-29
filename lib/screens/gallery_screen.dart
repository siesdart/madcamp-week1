import 'package:flutter/material.dart';
import 'package:madcamp_week1/screens/gallery_detail_screen.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  List<String> likedImages = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Images',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: List.generate(20, _buildImageButton),
            ),
          ),
          const Divider(height: 32),
          const Text(
            'Liked Images',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.count(
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
              children: likedImages.map(_buildImage).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImage(String url) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(url),
        ),
      ),
    );
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
    final url = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryDetailScreen(imageIndex: imageIndex),
      ),
    );

    if (url != null) {
      setState(() => likedImages.add(url));
    }
  }
}
