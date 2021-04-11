import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/bloc/character/character_bloc.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rick And Morty'),
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
            return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                itemCount: state.character.results.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Column(
                    children: [
                      Image(
                        height: 80,
                        image:
                            NetworkImage(state.character.results[index].image),
                      ),
                      Text(state.character.results[index].name),
                    ],
                  );
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
