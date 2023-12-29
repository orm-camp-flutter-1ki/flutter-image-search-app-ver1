import '../data/model/image_item.dart';
import '../data/repository/image_item_repository.dart';

class MainViewModel {
  final repository = PixabayImageItemRepository();

  List<ImageItem> imageItems = [];

  bool isLoading = false;

  Future<void> searchImage(String query) async {
    imageItems = await repository.getImageItems(query);
  }
}
