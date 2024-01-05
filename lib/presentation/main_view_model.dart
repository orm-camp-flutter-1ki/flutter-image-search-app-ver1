import 'dart:async';

import 'package:flutter/material.dart';
import 'package:image_search_app/core/result.dart';
import 'package:image_search_app/domain/model/image_item.dart';
import 'package:image_search_app/domain/use_case/search_image_use_case.dart';

import 'main_event.dart';
import 'main_state.dart';

final class MainViewModel extends ChangeNotifier {
  final SearchImageUseCase _searchImageUseCase;

  // 얘만 변수
  MainState _state = const MainState();

  MainState get state => _state;

  final _eventController = StreamController<MainEvent>();

  Stream<MainEvent> get eventStream => _eventController.stream;

  MainViewModel({
    required SearchImageUseCase searchImageUseCase,
  }) : _searchImageUseCase = searchImageUseCase;

  Future<void> searchImage(String query) async {
    // 화면갱신
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    final result = await _searchImageUseCase.execute(query);

    switch (result) {
      case Success<List<ImageItem>>():
        // 화면갱신
        _state = state.copyWith(
          isLoading: false,
          imageItems: result.data,
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
