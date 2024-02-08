import 'package:get_it/get_it.dart';
import 'package:image_search_app/data/repository/image_item_repository_impl.dart';
import 'package:image_search_app/data/repository/mock_image_item_repository_impl.dart';
import 'package:image_search_app/data/repository/star_repository_impl.dart';
import 'package:image_search_app/di/di_app_module.dart';
import 'package:image_search_app/domain/repository/image_item_repository.dart';
import 'package:image_search_app/domain/repository/star_repository.dart';
import 'package:image_search_app/domain/use_case/search_image_use_case.dart';

import '../presentation/main_view_model.dart';

final getIt = GetIt.instance;

enum Environment { dev, test, prod }

void diSetup({required Environment environment}) {
  getIt
    ..registerLazySingleton<ImageItemRepository>(
      () => environment == Environment.test
          ? MockImageItemRepositoryImpl()
          : ImageItemRepositoryImpl(),
    )
    ..registerSingleton<StarRepository>(StarRepositoryImpl())
    ..registerSingleton<SearchImageUseCase>(
      SearchImageUseCase(
        imageItemRepository: getIt<ImageItemRepository>(),
        starRepository: getIt<StarRepository>(),
      ),
    )
    ..registerLazySingleton<String>(
      () => environment == Environment.test
          ? DiAppModule.testTitle
          : DiAppModule.prodTitle,
      instanceName: 'title',
    )
    ..registerFactory<MainViewModel>(
        () => MainViewModel(searchImageUseCase: getIt<SearchImageUseCase>()));
}
