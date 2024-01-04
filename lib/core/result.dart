import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'result.freezed.dart';

@freezed
sealed class Result<T> with _$Result<T> {
  const factory Result.success(T data) = Success;
  const factory Result.error(Exception e) = Error;
  const factory Result.loading() = Loading;
}

void main() {
  Result<int> result = getResult(true);

  switch(result) {
    case Success<int>():
      print(result.data);
      // 다이얼로그 표시
    case Error<int>():
      print(result.e.toString());
      // 스낵박
    case Loading<int>():
      // 로딩
  }
}

Result<int> getResult(bool value) {
  try {
    if (value) {
      return Result.success(1);
    } else {
      return Result.loading();
    }
  } catch (e) {
    return Result.error(Exception('에러!!!'));
  }
}
