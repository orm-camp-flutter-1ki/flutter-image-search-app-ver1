import 'package:image_search_app/domain/repository/star_repository.dart';

import '../../domain/model/star.dart';

class StarRepositoryImpl implements StarRepository {
  final List<Star> stars = [
    Star(
      id: 1,
      title: '아이유',
      subTitle: '아이유는 아이가 아니에요',
      imageUrl:
          'https://i.namu.wiki/i/R0AhIJhNi8fkU2Al72pglkrT8QenAaCJd1as-d_iY6MC8nub1iI5VzIqzJlLa-1uzZm--TkB-KHFiT-P-t7bEg.webp',
      description:
          '아이유는 어쩌구 저쩌구아이유는 어쩌구 저쩌구아이유는 어쩌구 저쩌구아이유는 어쩌구 저쩌구아이유는 어쩌구 저쩌구아이유는 어쩌구 저쩌구아이유는 어쩌구 저쩌구아이유는 어쩌구 저쩌구아이유는 어쩌구 저쩌구아이유는 어쩌구 저쩌구아이유는 어쩌구 저쩌구',
    ),
    Star(
      id: 2,
      title: '권은비',
      subTitle: '워터밤 안 보셨나보네요',
      imageUrl:
          'https://cdn.asiaa.co.kr/news/photo/202307/132090_146830_4051.jpg',
      description: '아이유는 어쩌구 저쩌구',
    ),
  ];

  @override
  List<Star> getStars() {
    return stars;
  }
}
