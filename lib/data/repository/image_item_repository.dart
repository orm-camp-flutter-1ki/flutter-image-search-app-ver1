import '../model/image_item.dart';

class ImageItemRepository {
  Future<List<ImageItem>> getImageItems(String query) async {
    return [
      ImageItem(
          imageUrl:
              "https://cdn.pixabay.com/photo/2017/09/26/13/21/apples-2788599_150.jpg",
          tags: ''),
      ImageItem(
          imageUrl:
              "https://cdn.pixabay.com/photo/2017/09/26/13/39/apples-2788651_150.jpg",
          tags: ''),
      ImageItem(
          imageUrl:
              "https://cdn.pixabay.com/photo/2015/02/13/00/43/apples-634572_150.jpg",
          tags: ''),
    ];
  }
}
