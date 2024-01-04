import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search_app/core/result.dart';
import 'package:image_search_app/data/model/image_item.dart';
import 'package:image_search_app/ui/main_event.dart';

import '../data/repository/image_item_repository.dart';
import 'main_state.dart';

final class MainViewModel extends ChangeNotifier {
  final ImageItemRepository _repository;

  // 얘만 변수
  MainState _state = const MainState();

  MainState get state => _state;

  final _eventController = StreamController<MainEvent>();

  Stream<MainEvent> get eventStream => _eventController.stream;

  MainViewModel({
    required ImageItemRepository repository,
  }) : _repository = repository;

  Future<void> searchImage(String query) async {
    // 화면갱신
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _repository.getImageItems(query);

    switch (result) {
      case Success<List<ImageItem>>():
        // 화면갱신
        _state = state.copyWith(
          isLoading: false,
          imageItems: result.data.take(3).toList(),
        );
        notifyListeners();
        _eventController.add(const MainEvent.showSnackBar('성공!!'));
      case Error<List<ImageItem>>():
        _state = state.copyWith(
          isLoading: false,
        );
        notifyListeners();
        _eventController.add(MainEvent.showSnackBar(result.e.toString()));
      case Loading<List<ImageItem>>():
        // TODO: 로딩
        print('loading');
    }
  }
}
