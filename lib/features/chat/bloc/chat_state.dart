part of 'chat_bloc.dart';

@immutable
sealed class ChatState {}

final class ChatInitial extends ChatState {}

// chat loading
class ChatLoadingState extends ChatState {}

// chat loaded
class ChatLoadedState extends ChatState {}

// action state
abstract class ChatActionState extends ChatState {}
