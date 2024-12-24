import 'package:bloc_with_bnb/conversation.dart';
import 'package:bloc_with_bnb/features/chat/bloc/chat_bloc.dart';
import 'package:bloc_with_bnb/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Chat extends StatefulWidget {
  const Chat({super.key});

  @override
  State<StatefulWidget> createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    final ChatBloc chatBloc = context.read<ChatBloc>();
    chatBloc.add(ChatInitialEvent());

    return BlocConsumer<ChatBloc, ChatState>(
      bloc: chatBloc,
      listenWhen: (previous, current) => current is ChatActionState,
      buildWhen: (previous, current) => current is! ChatActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case ChatLoadingState:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Chats"),
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
              drawer: CustomDrawer(context: context),
              body: const Center(
                child: Column(
                  spacing: 16.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    Text("Loading chats"),
                  ],
                ),
              ),
            );
          case ChatLoadedState:
            return Scaffold(
              appBar: AppBar(
                title: const Text("Chats"),
                elevation: 0,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.edit),
                  ),
                ],
              ),
              drawer: CustomDrawer(context: context),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    spacing: 16.0,
                    children: [
                      const SizedBox(height: 12.0),

                      //   search friend
                      //   note
                      //   conversation

                      OutlinedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Conversation(),
                            ),
                          );
                        },
                        child: const Text("Chat with Alex"),
                      ),
                    ],
                  ),
                ),
              ),
            );
          default:
            return Scaffold();
        }
      },
    );
  }
}
