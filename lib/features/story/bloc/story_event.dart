part of 'story_bloc.dart';

@immutable
sealed class StoryEvent {}

class StoryInitialEvent extends StoryEvent {}
