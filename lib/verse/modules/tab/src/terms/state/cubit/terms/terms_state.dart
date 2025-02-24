part of 'terms_cubit.dart';

final class TermsState extends Equatable {
  final TermsOfSign terms;

  const TermsState({
    this.terms = const TermsOfSign(tIdx: 0, tService: '', tPrivacy: '', tLocation: ''),
  });

  TermsState copyWith({
    TermsOfSign? terms,
  }) {
    return TermsState(
        terms: terms ?? this.terms
    );
  }



  @override
  List<Object> get props => [terms];
}


class TermsOfSign {
  final int tIdx;
  final String tService;
  final String tPrivacy;
  final String tLocation;

  const TermsOfSign({
    required this.tIdx,
    required this.tService,
    required this.tPrivacy,
    required this.tLocation,
  });

  factory TermsOfSign.fromJson(Map<String, dynamic> json) => TermsOfSign(
    tIdx: json["T_idx"] ?? 0,
    tService: json["T_service"] ?? '',
    tPrivacy: json["T_privacy"] ?? '',
    tLocation: json["T_location"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "T_idx": tIdx,
    "T_service": tService,
    "T_privacy": tPrivacy,
    "T_location": tLocation,
  };
}

class TermsT {
  int status;
  String msg;
  List<TermsOfSign> result;

  TermsT({
    required this.status,
    required this.msg,
    required this.result,
  });

  factory TermsT.fromJson(Map<String, dynamic> json) => TermsT(
    status: json["status"],
    msg: json["msg"],
    result: List<TermsOfSign>.from(json["result"].map((x) => TermsOfSign.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "result": List<dynamic>.from(result.map((x) => x.toJson())),
  };
}
