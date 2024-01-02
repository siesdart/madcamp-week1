import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:madcamp_week1/providers/image.dart';
import 'package:madcamp_week1/screens/gallery_detail_screen.dart';
import 'package:madcamp_week1/widgets/custom_app_bar.dart';

class GalleryScreen extends StatelessWidget {
  const GalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: 192,
          child: CustomAppBar(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 192,
          child: Transform.flip(
            flipX: true,
            flipY: true,
            child: const CustomAppBar(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'All Images',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.indigoAccent,
                      offset: Offset(0.5, 0.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
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
                  child: _buildGridView((_) => Iterable<int>.generate(20)),
                ),
              ),
              const SizedBox(height: 32),
              const Text(
                'Liked Images',
                textAlign: TextAlign.end,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: Colors.indigoAccent,
                      offset: Offset(0.5, 0.5),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
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
                  child: _buildGridView(
                    (ref) => ref.watch(likedImagesNotifierProvider),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGridView(Iterable<int> Function(WidgetRef) imageBuilder) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(14),
      child: Consumer(
        builder: (context, ref, _) {
          return GridView.count(
            physics: const ScrollPhysics(),
            shrinkWrap: true,
            crossAxisCount: 3,
            mainAxisSpacing: 4,
            crossAxisSpacing: 4,
            children: imageBuilder(ref)
                .map((index) => _buildImageButton(context, ref, index))
                .toList(),
          );
        },
      ),
    );
  }

  Widget _buildImageButton(BuildContext context, WidgetRef ref, int index) {
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
          onTap: () => _onImageButtonPressed(context, ref, index),
        ),
      ),
    );
  }

  Future<void> _onImageButtonPressed(
    BuildContext context,
    WidgetRef ref,
    int index,
  ) async {
    final likedImagesNotifier = ref.read(likedImagesNotifierProvider.notifier);
    final newIndex = await Navigator.push<int>(
      context,
      MaterialPageRoute(
        builder: (context) => GalleryDetailScreen(
          index: index,
          isLiked: likedImagesNotifier.isLiked(index),
        ),
      ),
    );

    if (newIndex != null) {
      likedImagesNotifier.updateLike(newIndex);
    }
  }
}
