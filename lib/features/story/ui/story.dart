import 'package:bloc_with_bnb/features/story/bloc/story_bloc.dart';
import 'package:bloc_with_bnb/shared/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Story extends StatefulWidget {
  const Story({super.key});

  @override
  State<StatefulWidget> createState() => _StoryState();
}

class _StoryState extends State<Story> {
  @override
  Widget build(BuildContext context) {
    final StoryBloc storyBloc = StoryBloc();
    storyBloc.add(StoryInitialEvent());

    return BlocConsumer<StoryBloc, StoryState>(
      bloc: storyBloc,
      listenWhen: (previous, current) => current is StoryActionState,
      buildWhen: (previous, current) => current is! StoryActionState,
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case StoryLoadingState:
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: const Text("Stories"),
              ),
              drawer: CustomDrawer(context: context),
              body: const Center(
                child: Column(
                  spacing: 16.0,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(),
                    Text("Loading story"),
                  ],
                ),
              ),
            );
          case StoryLoadedState:
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: const Text("Stories"),
              ),
              drawer: CustomDrawer(context: context),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 12.0),
                      GridView.builder(
                        itemCount: 10,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 3 / 4,
                        ),
                        itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: Center(
                            child: Text("Story - ${index + 1}"),
                          ),
                        ),
                      ),
                      const SizedBox(height: 12.0),
                    ],
                  ),
                ),
              ),
            );
          default:
            return Scaffold(
              appBar: AppBar(
                elevation: 0,
                title: const Text("Stories"),
              ),
              drawer: CustomDrawer(context: context),
              body: const Center(
                child: Text("Story couldn't be loaded."),
              ),
            );
        }
      },
    );
  }
}
