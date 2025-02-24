import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_detail_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_detail_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/model_list_detail/model_list_detail_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_model_list_detail_event.dart';
part 'banana_model_list_detail_state.dart';

class BananaModelListDetailBloc extends Bloc<BananaModelListDetailEvent, BananaModelListDetailState> {
  final ModelListDetailRepository _repository;
  BananaModelListDetailBloc({
    required ModelListDetailRepository repository
  }) : _repository = repository, super(const BananaModelListDetailState()) {
    on<InitModelDetail>(_initModelDetail);
    on<ChangeDetailEnum>(_changeDetailEnum);
    on<ChangeColorIndex>(_changeColorIndex);
  }

  Future<void> _initModelDetail(InitModelDetail event, Emitter<BananaModelListDetailState> emit) async{
    await emit.forEach(
        _repository.streamSpecDetail(psIdx: event.psIdx),
        onData: (result) =>
            state.copyWith(
                statusEnum: result.statusEnum,
                modelDetailEntity: result.entity,
                spec: result.spec,
                mk: result.maker
            )
    );
  }

  Future<void> _changeDetailEnum(ChangeDetailEnum event, Emitter<BananaModelListDetailState> emit) async{
    emit(state.copyWith(modelDetailEnum: event.modelDetailEnum));
  }

  Future<void> _changeColorIndex(ChangeColorIndex event, Emitter<BananaModelListDetailState> emit) async{
    emit(state.copyWith(currentColor: event.currentIndex));
  }

}
