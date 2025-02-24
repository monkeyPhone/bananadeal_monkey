part of 'banana_notice_bloc.dart';

sealed class BananaNoticeEvent extends Equatable{
  const BananaNoticeEvent();

  @override
  List<Object> get props => [];
}

final class StreamNoticeList extends BananaNoticeEvent {
  const StreamNoticeList();
}

