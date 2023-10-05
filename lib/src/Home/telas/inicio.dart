import 'package:flutter/material.dart';
import 'package:youtube_project/api.dart';
import 'package:youtube_project/models/video.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:youtube_project/src/Home/telas/videoView.dart';

class Inicio extends StatefulWidget {
  final String pesquisa;

  const Inicio(this.pesquisa, {Key? key}) : super(key: key);

  @override
  _InicioState createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  _listarVideos(String pesquisa) {
    Api api = Api();
    return api.pesquisar(pesquisa);
  }

  @override
  Widget build(BuildContext context) {
    late YoutubePlayerController _controller;

    return FutureBuilder<List<Video>>(
        future: _listarVideos(widget.pesquisa),
        builder: (context, snapshot) {
          var result;

          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              result = Center(
                child: CircularProgressIndicator(
                  color: Colors.red,
                ),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              if (snapshot.hasData) {
                result = ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    height: 2,
                    color: Colors.grey,
                  ),
                  itemBuilder: (context, index) {
                    List<Video> videos = snapshot.data!;
                    Video video = videos[index];

                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  VideoView(video.id.toString())),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(video.image ?? ''),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 0),
                            child: ListTile(
                              title: Text(
                                video.titulo ?? '',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(video.canal ?? ''),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  itemCount: snapshot.data!.length,
                );
              } else {
                Center(
                  child: Text("Nenhum dado a ser exibido"),
                );
              }
              break;
          }
          print(result);
          return result ?? Center(child: Text('Default Widget'));
        });
  }
}
