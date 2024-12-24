import 'package:bloc_with_bnb/features/chat/bloc/chat_bloc.dart';
import 'package:bloc_with_bnb/features/story/bloc/story_bloc.dart';
import 'package:bloc_with_bnb/initial.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Bloc with BottomNavigationBar",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: false,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ChatBloc()),
          BlocProvider(create: (context) => StoryBloc()),
        ],
        child: Initial(),
      ),
    );
  }
}
