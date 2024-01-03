import 'package:flutter_test/flutter_test.dart';
import 'package:image_search_app/data/model/image_item.dart';
import 'package:image_search_app/data/repository/image_item_repository.dart';
import 'package:image_search_app/di/di_setup.dart';
import 'package:image_search_app/ui/main_view_model.dart';

void main() {
  // 모든 테스트 시작할 때 호출 되는 부분
  setUp(() {
    getIt.registerSingleton<ImageItemRepository>(MockRepository());

    // viewModel : factory
    getIt.registerFactory<MainViewModel>(
            () => MainViewModel(repository: getIt<ImageItemRepository>()));
  });

  test('이미지는 3개만 반환되어야 한다', () async {
    final viewModel = getIt<MainViewModel>();

    expect(viewModel.state.imageItems.length, 0);

    await viewModel.searchImage('query');

    expect(viewModel.state.imageItems.length, 3);
  });
}

class MockRepository implements ImageItemRepository {
  @override
  Future<List<ImageItem>> getImageItems(String query) async {
    return List.generate(20, (index) =>
        ImageItem(
            imageUrl:
            "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg",
            tags: ''));
  }
}
