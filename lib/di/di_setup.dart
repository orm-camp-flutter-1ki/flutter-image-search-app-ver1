import 'package:get_it/get_it.dart';
import 'package:image_search_app/data/repository/star_repository_impl.dart';
import 'package:image_search_app/domain/repository/image_item_repository.dart';
import 'package:image_search_app/data/repository/image_item_repository_impl.dart';
import 'package:image_search_app/domain/repository/star_repository.dart';
import 'package:image_search_app/domain/use_case/search_image_use_case.dart';

import '../presentation/main_view_model.dart';

final getIt = GetIt.instance;

void diSetup() {
  // interface
  // repository : singleton
  getIt.registerSingleton<ImageItemRepository>(ImageItemRepositoryImpl());
  getIt.registerSingleton<StarRepository>(StarRepositoryImpl());

  getIt.registerSingleton<SearchImageUseCase>(
    SearchImageUseCase(
      imageItemRepository: getIt<ImageItemRepository>(),
      starRepository: getIt<StarRepository>(),
    ),
  );

  // viewModel : factory
  getIt.registerFactory<MainViewModel>(
      () => MainViewModel(searchImageUseCase: getIt<SearchImageUseCase>()));
}
