class Photo {
  final int id;
  final int albumId;
  final String title;
  final String thumburl;

  Photo.fromJsonMap(Map map)
      : id = map['id'],
        albumId = map ['albumId'],
        title = map['title'],
        thumburl =map['thumbnailUrl'];
}
