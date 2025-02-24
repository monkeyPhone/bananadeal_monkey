import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/maker_kind_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/mobile_data_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/model_list_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/model_list/model_list_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_model_list_event.dart';
part 'banana_model_list_state.dart';

class BananaModelListBloc extends Bloc<BananaModelListEvent, BananaModelListState> {
  final ModelListRepository _repository;
  BananaModelListBloc({
    required ModelListRepository repository
  }) : _repository = repository, super(const BananaModelListState()) {
    on<InitModelList>(_initModelList);
    on<ChangeIndex>(_changeIndex);
    on<ChangeSort>(_changeSort);
  }

  Future<void> _initModelList(InitModelList event, Emitter<BananaModelListState> emit) async {
    await emit.forEach(_repository.initModelList(event.tkIdx),
        onData: (result) => state.copyWith(
            statusEnum: result.statusEnum,
            tkIdx: event.tkIdx,
            makerList: result.makerList,
            specList: result.specList,
            mobileList: result.mobileList
        )
    );
    switch(event.tkIdx){
      case '0':
        final List<PhoneSpecDto> list = [];
        list.addAll(state.specList.samsung);
        emit(state.copyWith(specView: list));
      default:
        final List<MobileDataDto> list = [];
        list.addAll(state.mobileList.where((e) => e.mkName == state.makerList[state.currentIndex].mkName));
        emit(state.copyWith(
            mobileView: list
        ));
    }
    _changeSort(const ChangeSort(0), emit);
  }

  Future<void> _changeIndex(ChangeIndex event, Emitter<BananaModelListState> emit) async{
    if(state.tkIdx == '0'){
      List<PhoneSpecDto> list = [];
      list.addAll(switch(event.index){
        0 => state.specList.samsung,
        1 => state.specList.apple,
        _ => state.specList.etc,
      });
      emit(state.copyWith(currentIndex: event.index,
          specView: list
      ));
    } else{
      final List<MobileDataDto> list = [];
      list.addAll(state.mobileList.where((e) => e.mkName == state.makerList[event.index].mkName));
      emit(state.copyWith(
          currentIndex: event.index,
          mobileView: list
      )
      );
    }
    _changeSort(ChangeSort(state.currentSort), emit);
  }

  Future<void> _changeSort(ChangeSort event, Emitter<BananaModelListState> emit) async{
    emit(state.copyWith(currentSort: event.index));
    if(state.tkIdx == '0'){
      switch(event.index){
        case 0:
          final List<PhoneSpecDto> list = [];
          list.addAll(switch(state.currentIndex){
            0 => state.specList.samsung,
            1 => state.specList.apple,
            _ => state.specList.etc,
          });
          emit(state.copyWith(currentSort: event.index,
              specView: list
          ));
        case 1:
          state.specView.sort(
                  (a,b) =>
                  b.psReleaseDate.compareTo(a.psReleaseDate)
          );
        case 2:
          state.specView.sort(
                  (a,b) =>
                  a.psName.compareTo(b.psName)
          );
        case 3:
          state.specView.sort(
                  (a,b) =>
                  b.psName.compareTo(a.psName)
          );
        default:
      }

    } else{
      switch(event.index){
        case 0:
          state.mobileView.sort((a, b) =>
              int.parse(b.psOrder).compareTo(int.parse(a.psOrder))
          );
        case 1:
          state.mobileView.sort((a, b) =>
          a.mdReleasePrice == b.mdReleasePrice
              ? int.parse(b.psOrder).compareTo(int.parse(a.psOrder))
              : int.parse(a.mdReleasePrice).compareTo(int.parse(b.mdReleasePrice))
          );
        case 2:
          state.mobileView.sort((a, b) =>
          a.mdReleasePrice == b.mdReleasePrice
              ? int.parse(b.psOrder).compareTo(int.parse(a.psOrder))
              : int.parse(b.mdReleasePrice).compareTo(int.parse(a.mdReleasePrice))
          );
        case 3:
          state.mobileView.sort((a, b) =>
          a.mdReleaseDate == b.mdReleaseDate
              ? int.parse(b.psOrder).compareTo(int.parse(a.psOrder))
              : b.mdReleaseDate.compareTo(a.mdReleaseDate)
          );
        case 4:
          state.mobileView.sort((a, b) =>
          a.psName == b.psName
              ? int.parse(b.psOrder).compareTo(int.parse(a.psOrder))
              : a.psName.compareTo(b.psName)
          );
        case 5:
          state.mobileView.sort((a, b) =>
          a.psName == b.psName
              ? int.parse(b.psOrder).compareTo(int.parse(a.psOrder))
              : b.psName.compareTo(a.psName)
          );


        default :
      }
    }
  }

}
