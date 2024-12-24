import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part '../../story/bloc/story_state.dart';
part 'story_event.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  StoryBloc() : super(StoryInitial()) {
    on<StoryInitialEvent>(storyInitialEvent);
  }

  // story initial
  FutureOr<void> storyInitialEvent(state, emit) async {
    emit(StoryLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(StoryLoadedState());
  }
}
