// // To parse this JSON data, do
// //
// //     final estimateStore = estimateStoreFromJson(jsonString);
//
// import 'dart:convert';
//
// EstimateStore estimateStoreFromJson(String str) => EstimateStore.fromJson(json.decode(str));
//
// String estimateStoreToJson(EstimateStore data) => json.encode(data.toJson());
//
// class EstimateStore {
//   EstimateStore({
//     required this.status,
//     required this.msg,
//     required this.result,
//   });
//
//   int status;
//   String msg;
//   List<EstimateStoreList> result;
//
//   factory EstimateStore.fromJson(Map<String, dynamic> json) => EstimateStore(
//     status: json["status"],
//     msg: json["msg"],
//     result: List<EstimateStoreList>.from(json["result"].map((x) => EstimateStoreList.fromJson(x))),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "status": status,
//     "msg": msg,
//     "result": List<dynamic>.from(result.map((x) => x.toJson())),
//   };
// }
//
// class EstimateStoreList {
//   EstimateStoreList({
//     required this.smIdx,
//     required this.smMId,
//     required this.smStoreName,
//     required this.smLatitude,
//     required this.smLongitude,
//     required this.smToken,
//     required this.inviteDeal,
//     required this.sendDeal,
//     required this.openDeal,
//     required this.avgPoint,
//     required this.distance,
//   });
//
//   int smIdx;
//   String smMId;
//   String smStoreName;
//   String smLatitude;
//   String smLongitude;
//   String smToken;
//   int inviteDeal;
//   int sendDeal;
//   int openDeal;
//   String avgPoint;
//   double distance;
//
//   factory EstimateStoreList.fromJson(Map<String, dynamic> json) => EstimateStoreList(
//     smIdx: json["SM_idx"] ?? 0,
//     smMId: json["SM_m_id"] ?? '',
//     smStoreName: json["SM_store_name"] ?? '',
//     smLatitude: json["SM_latitude"] ?? '',
//     smLongitude: json["SM_longitude"] ?? '',
//     smToken: json["SM_token"] ?? '',
//     inviteDeal: json["invite_deal"] ?? 0,
//     sendDeal: json["send_deal"] ?? 0,
//     openDeal: json["open_deal"] ?? 0,
//     avgPoint: json["avg_point"] ?? '',
//     distance: json["distance"] == null
//         ? 0.0
//         : double.tryParse(json["distance"].toString()) ?? 0.0
//   );
//
//   Map<String, dynamic> toJson() => {
//     "SM_idx": smIdx,
//     "SM_m_id": smMId,
//     "SM_store_name": smStoreName,
//     "SM_latitude": smLatitude,
//     "SM_longitude": smLongitude,
//     "SM_token": smToken,
//     "invite_deal": inviteDeal,
//     "send_deal": sendDeal,
//     "open_deal": openDeal,
//     "avg_point": avgPoint,
//     "distance": distance
//   };
// }
