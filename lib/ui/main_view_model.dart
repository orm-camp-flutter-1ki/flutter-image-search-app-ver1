import 'dart:async';

import 'package:flutter/material.dart';

import '../data/repository/image_item_repository.dart';
import 'main_state.dart';

final class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _repository;

  // 얘만 변수
  MainState _state = const MainState();

  MainState get state => _state;

  MainViewModel({
    required ImageItemRepository repository,
  }) : _repository = repository;

  Future<void> searchImage(String query) async {
    // 화면갱신
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final results = (await _repository.getImageItems(query)).take(3).toList();

    // 화면갱신
    _state = state.copyWith(
      isLoading: false,
      imageItems: results,
    );
    notifyListeners();
  }
}
