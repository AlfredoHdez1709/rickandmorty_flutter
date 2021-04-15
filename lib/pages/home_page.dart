import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/bloc/character/character_bloc.dart';
import 'package:rick_morty_bloc/model/character_model.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: NetworkImage(
              'https://heykawaii.com/image/cache/catalog/Artes%20/marcas/Rick_and_Morty_logo-600x315.png'),
          height: 90,
        ),
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (_, state) {
          if (state is CharacterInitial) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is CharacterNoLoaded) {
            return Center(
              child: Text('Data no Loade'),
            );
          } else if (state is CharacterLoaded) {
            return ListView.builder(
              itemCount: state.character.results.length,
              itemBuilder: (context, index) {
                return cardUser(state.character.results[index], context);
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  Widget cardUser(Results results, BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Hero(
            tag: "imageUser",
            child: CircleAvatar(
              backgroundImage: NetworkImage(results.image),
            ),
            transitionOnUserGestures: true,
          ),
          title: Text(results.name),
          subtitle: Text('Género ${results.gender}'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.pushNamed(
              context,
              'detail',
              arguments: {
                'detail': results,
              },
            );
          },
        ),
        Divider(),
      ],
    );
  }
}
