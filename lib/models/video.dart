class Video {
  String? id;
  String? titulo;
  String? descricao;
  String? image;
  String? canal;

  Video({this.id, this.titulo, this.descricao, this.image, this.canal});

/*
  static converterJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelId"],
    );
  }
*/
  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json["id"]["videoId"],
      titulo: json["snippet"]["title"],
      descricao: json["snippet"]["description"],
      image: json["snippet"]["thumbnails"]["high"]["url"],
      canal: json["snippet"]["channelTitle"],
    );
  }
}
