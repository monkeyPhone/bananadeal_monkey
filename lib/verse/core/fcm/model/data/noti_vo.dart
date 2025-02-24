class NotiVO {
  const NotiVO({
    required this.id,
    required this.title,
    required this.msg,
    required this.img, /**/
    required this.type,
    required this.room,
    required this.name,
    required this.send,
    required this.payload,
  });

  final int id;
  final String? title;
  final String? msg;
  final String? img;
  final String? type;
  final String? room;
  final String? name;
  final String? send;
  final String? payload;
}