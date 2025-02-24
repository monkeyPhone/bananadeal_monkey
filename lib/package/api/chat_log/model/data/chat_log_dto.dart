List<ChatLogDto> convertChatLogDto(List<dynamic> data) {
  return data.map((item) => ChatLogDto.fromJson(item as Map<String, dynamic>)).toList();
}

class ChatLogDto {
  const ChatLogDto({
    required this.cIdx,
    required this.cRoomIdx,
    required this.cMessage,
    required this.cType,
    required this.cIsRead,
    required this.cRegdate,
  });

  final int cIdx;
  final int cRoomIdx;
  final String cMessage;
  final String cType;
  final String cIsRead;
  final String cRegdate;

  factory ChatLogDto.fromJson(Map<String, dynamic> json) => ChatLogDto(
    cIdx: json["C_idx"] ?? 0,
    cRoomIdx: json["C_room_idx"] ?? 0,
    cMessage: json["C_message"] ?? '',
    cType: json["C_type"] ?? '',
    cIsRead: json["C_isRead"] ?? '',
    cRegdate: json["C_regdate"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "C_idx": cIdx,
    "C_room_idx": cRoomIdx,
    "C_message": cMessage,
    "C_type": cType,
    "C_isRead": cIsRead,
    "C_regdate": cRegdate,
  };

  ChatLogDtoRow toRow() {
    return ChatLogDtoRow(
      cIdx: cIdx,
      cRoomIdx: cRoomIdx,
      cMessage: cMessage,
      cType: cType,
      cIsRead: cIsRead,
      cRegdate: cRegdate,
    );
  }
}


class ChatLogDtoRow {
  ChatLogDtoRow({
    required this.cIdx,
    required this.cRoomIdx,
    required this.cMessage,
    required this.cType,
    required this.cIsRead,
    required this.cRegdate,
  });

  int cIdx;
  int cRoomIdx;
  String cMessage;
  String cType;
  String cIsRead;
  String cRegdate;

  factory ChatLogDtoRow.fromJson(Map<String, dynamic> json) => ChatLogDtoRow(
    cIdx: json["C_idx"] ?? 0,
    cRoomIdx: json["C_room_idx"] ?? 0,
    cMessage: json["C_message"] ?? '',
    cType: json["C_type"] ?? '',
    cIsRead: json["C_isRead"] ?? '',
    cRegdate: json["C_regdate"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "C_idx": cIdx,
    "C_room_idx": cRoomIdx,
    "C_message": cMessage,
    "C_type": cType,
    "C_isRead": cIsRead,
    "C_regdate": cRegdate,
  };

  ChatLogDto toHigh() {
    return ChatLogDto(
      cIdx: cIdx,
      cRoomIdx: cRoomIdx,
      cMessage: cMessage,
      cType: cType,
      cIsRead: cIsRead,
      cRegdate: cRegdate,
    );
  }
}
