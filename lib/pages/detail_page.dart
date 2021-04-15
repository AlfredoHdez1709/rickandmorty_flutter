import 'package:flutter/material.dart';
import 'package:rick_morty_bloc/model/character_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments as Map;

    final Results results = args['detail'];

    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              flexibleSpace: containerToolbar(results),
            ),
          ];
        },
        body: bodyInformation(results),
      ),
    );
  }

  Widget containerToolbar(Results results) {
    return FlexibleSpaceBar(
      centerTitle: true,
      title: Text(results.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          )),
      background: Hero(
        tag: "imageUser",
        child: Image.network(
          results.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget bodyInformation(Results results) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Information"),
        Text("Specie:"),
        Text(results.species),
        Text("status:"),
        Text(results.status),
        Text("Gender:"),
        Text(results.gender),
        Text("Origin:"),
        Text(results.origin.name),
        Text("Location:"),
        Text(results.location.name),
        Text("Episodes (${results.episode.length})"),
        Flexible(
          child: GridView.count(
            crossAxisCount: 2,
            children: List.generate(results.episode.length, (index) {
              return Card(child: Text("Episode ${index++}"));
            }),
            /* children: List.generate(40, (index) {
              return Card(
                child: Text("Episode $index"),
              ); //robohash.org api provide you different images for any number you are giving
            }),*/
          ),
        ),
      ],
    );
  }
}
