part of '../../story/bloc/story_bloc.dart';

@immutable
sealed class StoryState {}

final class StoryInitial extends StoryState {}

class StoryLoadingState extends StoryState {}

class StoryLoadedState extends StoryState {}

// action state
abstract class StoryActionState extends StoryState {}
