sealed class Result<T> {
  factory Result.success(T data) = Success;

  factory Result.error(Exception e) = Error;

  factory Result.loading() = Loading;
}

class Success<T> implements Result<T> {
  final T data;

  Success(this.data);
}

class Error<T> implements Result<T> {
  final Exception e;

  Error(this.e);
}

class Loading<T> implements Result<T> {
  Loading();
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
