List<ChatRoomVO> convertChatRoomVO(List<dynamic> data) {
  return data.map((item) => ChatRoomVO.fromJson(item as Map<String, dynamic>)).toList();
}

final class ChatRoomVO {
  final int crIdx;
  final String smMId;
  final String smIsShow;
  final String crStatus;
  final String smStoreName;
  final String smTel;
  final String smAddress;
  final String smPathImg0;
  final String lastMessage;
  final String lastMessageTime;
  final int cIsRead;
  final int isDealing;
  final String smToken;
  final String smLatitude;
  final String smLongitude;
  final int favoriteStore;

  const ChatRoomVO({
    required this.crIdx,
    required this.smMId,
    required this.smIsShow,
    required this.crStatus,
    required this.smStoreName,
    required this.smTel,
    required this.smAddress,
    required this.smPathImg0,
    required this.lastMessage,
    required this.lastMessageTime,
    required this.cIsRead,
    required this.isDealing,
    required this.smToken,
    required this.smLatitude,
    required this.smLongitude,
    required this.favoriteStore,
  });

  factory ChatRoomVO.fromJson(Map<String, dynamic> json) => ChatRoomVO(
    crIdx: json["CR_idx"] ?? 0,
    smMId: json["SM_m_id"] ?? '',
    smIsShow: json["SM_isShow"] ?? '',
    crStatus: json["CR_status"] ?? '',
    smStoreName: json["SM_store_name"] ?? '알 수 없음',
    smTel: json["SM_tel"] ?? '',
    smAddress: json["SM_address"] ?? '',
    smPathImg0: json["SM_path_img0"] ?? '',
    lastMessage: json["last_message"] ?? '',
    lastMessageTime: json["last_message_time"] ?? '',
    cIsRead: json["C_isRead"] ?? 0,
    isDealing: json["is_dealing"] ?? 0,
    smToken: json["SM_token"] ?? '',
    smLatitude: json["SM_latitude"] ?? '',
    smLongitude: json["SM_longitude"] ?? '',
    favoriteStore: json["favorite_store"] ?? 0,
  );

  Map<String, dynamic> toJson() => {
    "CR_idx": crIdx,
    "SM_m_id": smMId,
    "SM_isShow": smIsShow,
    "SM_store_name": smStoreName,
    "SM_tel": smTel,
    "SM_address": smAddress,
    "SM_path_img0": smPathImg0,
    "last_message": lastMessage,
    "last_message_time": lastMessageTime,
    "C_isRead": cIsRead,
    "is_dealing": isDealing,
    "SM_token": smToken,
    "SM_latitude": smLatitude,
    "SM_longitude": smLongitude,
    "favorite_store": favoriteStore
  };

}