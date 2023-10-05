import 'package:flutter/material.dart';
import 'package:youtube_project/src/CustomSearchDelegate.dart';
import 'package:youtube_project/src/Home/telas/Inicio.dart';
import 'package:youtube_project/src/Home/telas/bibliotecas.dart';
import 'package:youtube_project/src/Home/telas/emAlta.dart';
import 'package:youtube_project/src/Home/telas/inscricoes.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indiceAtual = 0;
  String result = "";

  @override
  Widget build(BuildContext context) {
    List<Widget> telas = [
      Inicio(result),
      EmAlta(),
      Inscricoes(),
      Bibliotecas(),
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey, opacity: 0.8),
        backgroundColor: Colors.white,
        title: Image.asset(
          'assets/youtube.png',
          width: 97,
          height: 21,
        ),
        actions: [
          IconButton(
            onPressed: () async {
              String? res = await showSearch(
                  context: context, delegate: CustomSearchDelegate());
              setState(() {
                result = res ?? "";
              });
            },
            icon: Icon(Icons.search),
          ),

          /* IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam),
          ),
          
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.account_circle),
          ),

          */
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(
          fixedColor: Colors.white,
          type: BottomNavigationBarType.shifting,
          currentIndex: _indiceAtual,
          onTap: (indice) {
            setState(() {
              _indiceAtual = indice;
            });
          },
          items: [
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              label: "Início",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              label: "Em alta",
              icon: Icon(Icons.whatshot),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              label: "Inscrições",
              icon: Icon(Icons.subscriptions),
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.red,
              label: "Biblioteca",
              icon: Icon(Icons.folder),
            ),
          ]),
    );
  }
}
