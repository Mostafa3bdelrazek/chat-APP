import 'package:bloc/bloc.dart';
import 'package:chat_app/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());
  final CollectionReference messages =
      FirebaseFirestore.instance.collection("messages");
  void sendMessage({required String message, required String email}) {
    messages.add({
      "message": message,
      "createdAt": DateTime.now(),
      "id": email,
    });
  }

  getMessages() {
    messages.orderBy('createdAt', descending: true).snapshots().listen((event) {
      List<Message> messagesList = [];
      messagesList.clear();
      for (var doc in event.docs) {
        messagesList.add(Message.fromJson(doc));
      }
      emit(ChatSuccess(messages: messagesList));
    });
  }
}
