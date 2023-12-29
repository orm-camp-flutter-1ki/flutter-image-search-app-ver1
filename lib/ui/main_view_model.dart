import 'dart:collection';

import '../data/model/image_item.dart';
import '../data/repository/image_item_repository.dart';

class MainViewModel {
  final repository = PixabayImageItemRepository();

  List<ImageItem> _imageItems = [];

  // UnmodifiableListView 수정 안 되는 리스트
  List<ImageItem> get imageItems => List.unmodifiable(_imageItems);

  bool isLoading = false;

  Future<void> searchImage(String query) async {
    _imageItems = await repository.getImageItems(query);
  }
}
