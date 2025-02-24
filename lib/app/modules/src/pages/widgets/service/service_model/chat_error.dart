class ChatError {
  ChatError({
    required this.cCase,
    required this.cRoomIdx,
    required this.cMessage,
    required this.cType,
    required this.token,
    required this.cName,

  });

  String cCase;
  String cRoomIdx;
  String cMessage;
  String cType;
  String token;
  String cName;


  factory ChatError.fromJson(Map<String, dynamic> json) => ChatError(
      cCase: json["C_case"] ?? '',
    cRoomIdx: json["C_room_idx"] ?? '',
    cMessage: json["C_message"] ?? '',
    cType: json["C_type"] ?? '',
      token: json["token"] ?? '',
      cName: json["C_name"] ?? '',

  );

  Map<String, dynamic> toJson() => {
    "C_case": cCase,
    "C_room_idx": cRoomIdx,
    "C_message": cMessage,
    "C_type": cType,
    "token": token,
    "C_name": cName,

  };
}

