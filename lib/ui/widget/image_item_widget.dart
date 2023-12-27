import 'package:flutter/material.dart';

import '../../data/model/image_item.dart';

class ImageItemWidget extends StatelessWidget {
  final ImageItem imageItem;

  const ImageItemWidget({
    super.key,
    required this.imageItem,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20.0), // 코너의 둥근 정도 조절
      child: Image.network(
        imageItem.imageUrl,
        // 이미지 경로
        fit: BoxFit.cover,
      ),
    );
  }
}
