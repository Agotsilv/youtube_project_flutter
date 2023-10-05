import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube_project/models/video.dart';

const CHAVE = "AIzaSyChwOI-kj9lbT4LX_VCvC62dM-fMvaTbpQ";
const ID_CANAL = "UCf-bafFJ3xeYloBRR4z1RnQ";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisar) async {
    // ignore: prefer_interpolation_to_compose_strings
    http.Response response = await http.get(Uri.parse(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE"
            "&q=$pesquisar"));

    print(response.statusCode);
    if (response.statusCode == 200) {
      // ignore: unused_local_variable

      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
      return [];
    }
  }
}
