import 'package:flutter/material.dart';

import 'package:madcamp_week1/widgets/custom_scaffold.dart';

class GalleryDetailScreen extends StatelessWidget {
  final int index;
  final bool isLiked;

  const GalleryDetailScreen({
    required this.index,
    required this.isLiked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final imageName = '${index + 1}.jpeg';

    return CustomScaffold(
      title: Text(imageName),
      body: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey.withOpacity(0.7),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset(
                  'images/$imageName',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _buildItem('Image Name', imageName),
                  const Divider(height: 32),
                  ElevatedButton.icon(
                    onPressed: () => Navigator.pop(context, index),
                    icon: isLiked
                        ? const Icon(Icons.thumb_down)
                        : const Icon(Icons.thumb_up),
                    label: isLiked ? const Text('Unlike') : const Text('Like'),
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
