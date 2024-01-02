import 'package:flutter/material.dart';

class GalleryDetailScreen extends StatelessWidget {
  final int imageIndex;
  final bool isLiked;

  const GalleryDetailScreen({
    required this.imageIndex,
    required this.isLiked,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final imageName = '${imageIndex + 1}.jpeg';

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
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
                  color: Colors.indigoAccent,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: BackButton(
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    Center(
                      child: Text(
                        imageName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned.fill(
              top: 144,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(28),
                        child: Image.asset('images/$imageName'),
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
                              onPressed: () {
                                Navigator.pop(context, imageIndex);
                              },
                              icon: isLiked
                                  ? const Icon(Icons.thumb_down)
                                  : const Icon(Icons.thumb_up),
                              label: isLiked
                                  ? const Text('Unlike')
                                  : const Text('Like'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
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
