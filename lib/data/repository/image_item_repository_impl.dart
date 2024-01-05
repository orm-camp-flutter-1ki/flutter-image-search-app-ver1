import 'package:image_search_app/data/mapper/image_mapper.dart';

import '../../core/result.dart';
import '../data_source/pixabay_api.dart';
import '../../domain/model/image_item.dart';
import '../../domain/repository/image_item_repository.dart';

class ImageItemRepositoryImpl implements ImageItemRepository {
  final _api = PixabayApi();

  @override
  Future<Result<List<ImageItem>>> getImageItems(String query) async {
    try {
      final dto = await _api.getImagesResult(query);

      if (dto.hits == null) {
        return const Result.success([]);
      }

      return Result.success(dto.hits!.map((e) => e.toImageItem()).toList());
    } catch (e) {
      return Result.error(Exception(e.toString()));
    }
  }
}
