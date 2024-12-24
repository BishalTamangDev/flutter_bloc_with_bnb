import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatInitial()) {
    on<ChatInitialEvent>(chatInitialEvent);
  }

  Future<void> chatInitialEvent(event, emit) async {
    emit(ChatLoadingState());
    await Future.delayed(const Duration(seconds: 3));
    emit(ChatLoadedState());
  }
}
