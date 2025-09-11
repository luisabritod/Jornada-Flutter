import 'package:chat_feature/models/models.dart';

class ChatModel {
  final String id;
  final List<String> membersId;
  final List<MessageModel> messages;

  ChatModel({
    required this.id,
    required this.membersId,
    required this.messages,
  });
}
