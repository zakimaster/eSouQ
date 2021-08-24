class ChatMessageModel {

  int? senderId;
  int? recevierId;
  String? senderName;
  int? unreadCount;
  String? msg;
  String? image;
  String? time;

  // ignore: non_constant_identifier_names
  ChatMessageModel({this.senderId, this.recevierId,this.senderName, this.msg, this.time,this.image,this.unreadCount});
}