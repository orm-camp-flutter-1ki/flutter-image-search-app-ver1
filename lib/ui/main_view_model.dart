import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search_app/core/result.dart';
import 'package:image_search_app/data/model/image_item.dart';

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

    final result = await _repository.getImageItems(query);

    switch(result) {
      case Success<List<ImageItem>>():
      // 화면갱신
        _state = state.copyWith(
          isLoading: false,
          imageItems: result.data.take(3).toList(),
        );
        notifyListeners();
      case Error<List<ImageItem>>():
        // TODO: 스낵바
        print('error!!!!!!!!!!!');
      case Loading<List<ImageItem>>():
        // TODO: 로딩
        print('loading');
    }
  }
}
