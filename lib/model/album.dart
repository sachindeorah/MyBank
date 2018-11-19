class Album {
  final int id;
  final String title;

  Album.fromJsonMap(Map map)
      :id = map['id'],
        title =map['title'];
}