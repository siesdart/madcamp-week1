import 'package:flutter/material.dart';

class GalleryDetailScreen extends StatelessWidget {
  final int imageIndex;

  const GalleryDetailScreen({required this.imageIndex, super.key});

  @override
  Widget build(BuildContext context) {
    final imageName = '${imageIndex + 1}.jpeg';

    return Scaffold(
      appBar: AppBar(title: Text(imageName)),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('images/$imageName'),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildItem('Image Name', imageName),
                  const Divider(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, imageIndex);
                    },
                    child: const Text('Like'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String type, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type.toUpperCase(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.end,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
