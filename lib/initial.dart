import 'package:bloc_with_bnb/features/chat/bloc/chat_bloc.dart';
import 'package:bloc_with_bnb/features/chat/ui/chat.dart';
import 'package:bloc_with_bnb/features/story/bloc/story_bloc.dart';
import 'package:bloc_with_bnb/features/story/ui/story.dart';
import 'package:bloc_with_bnb/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Initial extends StatefulWidget {
  const Initial({super.key});

  @override
  State<StatefulWidget> createState() => _InitialState();
}

class _InitialState extends State<Initial> {
  // variables
  int index = 0;

  final List<Widget> _pages = [
    BlocProvider(
      create: (context) => ChatBloc(),
      child: Chat(),
    ),
    BlocProvider(
      create: (context) => StoryBloc(),
      child: Story(),
    ),
  ];

  // functions
  _changeIndex(int newIndex) {
    setState(() {
      index = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: index,
        children: _pages,
      ),
      drawer: CustomDrawer(context: context),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (newIndex) => _changeIndex(newIndex),
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble_outline_rounded), label: 'Chats'),
          BottomNavigationBarItem(icon: Icon(Icons.note_add), label: 'Stories'),
        ],
      ),
    );
  }
}
