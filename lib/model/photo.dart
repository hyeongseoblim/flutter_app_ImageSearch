class Photo {
  Photo({
    required this.id,
    required this.type,
    required this.previewURL,
  });
  late final int id;
  late final String type;
  late final String previewURL;

  Photo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    previewURL = json['previewURL'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['type'] = type;
    _data['previewURL'] = previewURL;
    return _data;
  }
}
