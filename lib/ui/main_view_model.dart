import 'dart:async';

import 'package:flutter/material.dart';

import '../data/model/image_item.dart';
import '../data/repository/image_item_repository.dart';

final class MainViewModel extends ChangeNotifier {
  final _repository = PixabayImageItemRepository();

  List<ImageItem> _imageItems = [];
  List<ImageItem> get imageItems => List.unmodifiable(_imageItems);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> searchImage(String query) async {
    // 화면갱신
    _isLoading = true;
    notifyListeners();

    _imageItems = await _repository.getImageItems(query);

    // 화면갱신
    _isLoading = false;
    notifyListeners();
  }
}
