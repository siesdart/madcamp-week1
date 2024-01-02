import 'package:flutter_riverpod/flutter_riverpod.dart';

class LikedImagesNotifier extends Notifier<List<int>> {
  @override
  List<int> build() => [];

  bool isLiked(int index) => state.contains(index);

  void updateLike(int index) {
    if (isLiked(index)) {
      state = state.where((e) => e != index).toList();
    } else {
      state = [...state, index];
    }
  }
}

final likedImagesNotifierProvider =
    NotifierProvider<LikedImagesNotifier, List<int>>(LikedImagesNotifier.new);
