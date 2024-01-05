import 'package:image_search_app/domain/model/image_item.dart';
import 'package:image_search_app/domain/repository/star_repository.dart';

import '../../core/result.dart';
import '../repository/image_item_repository.dart';

class SearchImageUseCase {
  final ImageItemRepository _imageItemRepository;
  final StarRepository _starRepository;

  const SearchImageUseCase({
    required ImageItemRepository imageItemRepository,
    required StarRepository starRepository,
  })  : _imageItemRepository = imageItemRepository,
        _starRepository = starRepository;

  Future<Result<List<ImageItem>>> execute(String query) async {
    final result = await _imageItemRepository.getImageItems(query);
    switch (result) {
      case Success<List<ImageItem>>():
        return Result.success(result.data.take(3).toList());
      case Error<List<ImageItem>>():
        return Result.success(_starRepository
            .getStars()
            .map((e) => ImageItem(imageUrl: e.imageUrl, tags: e.title))
            .toList());
      case Loading<List<ImageItem>>():
    }
    return result;
  }
}
