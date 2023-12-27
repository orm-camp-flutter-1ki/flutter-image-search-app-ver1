class ImageItem {
  String imageUrl;
  String tags;

//<editor-fold desc="Data Methods">
  ImageItem({
    required this.imageUrl,
    required this.tags,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageItem &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl &&
          tags == other.tags);

  @override
  int get hashCode => imageUrl.hashCode ^ tags.hashCode;

  @override
  String toString() {
    return 'ImageItem{ imageUrl: $imageUrl, tags: $tags,}';
  }

  ImageItem copyWith({
    String? imageUrl,
    String? tags,
  }) {
    return ImageItem(
      imageUrl: imageUrl ?? this.imageUrl,
      tags: tags ?? this.tags,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'tags': tags,
    };
  }

  factory ImageItem.fromJson(Map<String, dynamic> map) {
    return ImageItem(
      imageUrl: map['imageUrl'] as String,
      tags: map['tags'] as String,
    );
  }

//</editor-fold>
}
