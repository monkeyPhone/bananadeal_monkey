import 'package:banana_deal_by_monkeycompany/package/data/notice_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/notice/notice_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_notice_event.dart';
part 'banana_notice_state.dart';

class BananaNoticeBloc extends Bloc<BananaNoticeEvent, BananaNoticeState> {
  final NoticeRepository _repository;
  BananaNoticeBloc({
    required NoticeRepository repository
  }) : _repository = repository, super(const BananaNoticeState()) {
    on<StreamNoticeList>(_streamNoticeList);
  }

  Future<void> _streamNoticeList(StreamNoticeList event, Emitter<BananaNoticeState> emit) async{
    await emit.forEach(
        _repository.streamNoticeList(),
        onData: (result) =>
            state.copyWith(
              statusEnum: result.$1,
              noticeList: result.$2
            )
    );
  }

}
