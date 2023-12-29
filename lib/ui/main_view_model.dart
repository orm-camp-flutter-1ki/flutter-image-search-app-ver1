import 'dart:async';
import 'dart:collection';

import '../data/model/image_item.dart';
import '../data/repository/image_item_repository.dart';

final class MainViewModel {
  final _repository = PixabayImageItemRepository();

  List<ImageItem> _imageItems = [];
  List<ImageItem> get imageItems => List.unmodifiable(_imageItems);

  final _loadingController = StreamController<bool>();
  Stream<bool> get isLoadingStream => _loadingController.stream;


  Future<void> searchImage(String query) async {
    // 화면갱신
    _loadingController.add(true);

    _imageItems = await _repository.getImageItems(query);

    // 화면갱신
    _loadingController.add(false);
  }
}
