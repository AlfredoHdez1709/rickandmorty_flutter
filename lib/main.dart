import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_bloc/bloc/character/character_bloc.dart';
import 'package:rick_morty_bloc/pages/detail_page.dart';
import 'package:rick_morty_bloc/pages/home_page.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CharacterBloc()..add(LoadCharacter())),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      initialRoute: 'home',
      routes: {
        'home': (_) => HomePage(),
        'detail': (_) => DetailPage(),
      },
    );
  }
}
