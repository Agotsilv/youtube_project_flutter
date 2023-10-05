import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
            close(context, "");
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      close(context, query);
    });
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // List<String>? lista;

    // if (query.isNotEmpty) {
    //   lista = ["Monark", "Felipe neto", "Dino"]
    //       .where(
    //         (element) => element.toLowerCase().startsWith(query.toLowerCase()),
    //       )
    //       .toList();

    //   return ListView.builder(
    //     itemBuilder: (context, index) {
    //       return ListTile(
    //         onTap: () {
    //           close(context, lista![index]);
    //         },
    //         title: Text(lista![index]),
    //       );
    //     },
    //     itemCount: lista.length,
    //   );
    // } else {
    //   return Center(
    //     child: Text("Nenhum resultado para a pesquisa!"),
    //   );
    // }
    return Container();
  }
}
