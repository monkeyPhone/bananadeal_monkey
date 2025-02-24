part of 'banana_notice_bloc.dart';

final class BananaNoticeState extends Equatable {
  final StatusEnum statusEnum;
  final List<NoticeVO> noticeList;
  const BananaNoticeState({
    this.statusEnum = StatusEnum.initial,
    this.noticeList = const [],
  });

  BananaNoticeState copyWith({
    StatusEnum? statusEnum,
    List<NoticeVO>? noticeList,
  }) => BananaNoticeState(
    statusEnum: statusEnum ?? this.statusEnum,
    noticeList: noticeList ?? this.noticeList,
  );

  @override
  List<Object> get props => [
    statusEnum, noticeList
  ];
}
