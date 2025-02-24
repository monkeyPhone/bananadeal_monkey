import 'package:banana_deal_by_monkeycompany/package/repository/create_deal/create_deal_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_create_deal_finish_event.dart';
part 'banana_create_deal_finish_state.dart';

class BananaCreateDealFinishBloc extends Bloc<BananaCreateDealFinishEvent, BananaCreateDealFinishState> {
  final CreateDealRepository _repository;
  BananaCreateDealFinishBloc({
    required CreateDealRepository repository
  }) : _repository = repository, super(const BananaCreateDealFinishState()) {
    on<ConvertData>(_convertData);
    on<PostDeal>(_postDeal);
  }

  Future<void> _convertData(ConvertData event, Emitter<BananaCreateDealFinishState> emit) async{
    String joinType = '';
    String eventType = switch(event.supportType){
      '공시지원' => 'GONGSI',
      '선택약정' => 'CHOICE',
      _ => ''
    };
    if(event.currentAgency == '0'){
      joinType = '신규가입';
    }
    else if(event.currentAgency == event.requestAgency && event.currentAgency != '0'){
      joinType = '기기변경';
    }
    else if(event.requestAgency == '0' && event.currentAgency != '0'){
      joinType = '통신사이동,기기변경';
    }
    else if(event.requestAgency != event.currentAgency && event.requestAgency != '0' && event.currentAgency != '0'){
      joinType = '통신사이동';
    }
    else{
      joinType = '';
    }

    String agency = _repository.convertTelecom(currentAgency: event.currentAgency, requestAgency: event.currentAgency);

    String ldcpName = event.ldcpName == ''
        ? switch(event.recModel){
      '최고의 스펙을 가진 프리미엄폰' => '프리미엄폰',
      '실속있는 가격의 보급폰' => '보급폰',
      '어르신들을 위한 효도폰' => '효도폰',
      '학생을 위한 공부폰' => '공부폰',
      '어린 아이들을 위한 어린이폰' => '어린이폰',
      _ => 'x'
    }
        : event.ldcpName;

    String plan = event.plan == '0' || event.plan ==  ''
        ? switch(event.recRate){
      '8만원 이상의 사용량 무제한 요금제' => '8만원 이상',
      '7만원대의 사용량이 많은 요금제' => '7만원대',
      '5~6만원 대의 기본 요금제' => '5~6만원',
      '5만원 미만의 저렴한 요금제' => '5만원 미만',
      _ => 'x'
    }
        : event.plan;

    emit(
        state.copyWith(
          showCase: (
          joinType,
          agency,
          event.age,
          ldcpName,
          plan,
          event.maxInstallment == '' ? '상관없음' : event.maxInstallment,
          event.supportType == '' ? '상관없음' : event.supportType,
          event.combination == '' ? '해당없음' : event.combination,
          event.welfare == '' ? '해당없음' : event.welfare
          ),


          userIdx: event.userIdx,
          joinType: joinType,
          currentAgency: event.currentAgency == '0' ? '' : event.currentAgency,
          requestAgency: event.requestAgency  == '0' ? '' : event.requestAgency,
          joinerPhoneName: ldcpName,
          joinerPhoneModel: event.ldcpModel,
          joinerPhoneIdx: event.psIdx == '0' ? '' : event.psIdx,
          joinerPhoneImg: event.piPath,
          joinerRatePlan: plan,
          joinerRatePlanIdx: event.planIdx,
          ageType: event.age,
          maxInstallment: switch(event.maxInstallment){
            '48개월' => 48,
            '36개월' => 36,
            '24개월' => 24,
            '12개월' => 12,
            '현금구매' => 0,
            _ => -1
          },
          guyHap: event.combination,
          welfare: event.welfare,
          sup: eventType,
          etc: event.request,
        )
    );
  }


  Future<void> _postDeal(PostDeal event, Emitter<BananaCreateDealFinishState> emit) async{
    await emit.forEach(_repository.streamCreateDeal(
        userIdx: state.userIdx,
        joinType: state.joinType,
        currentAgency: state.currentAgency,
        requestAgency: state.requestAgency,
        joinerPhone: state.joinerPhoneName,
        joinerPhoneModel: state.joinerPhoneModel,
        joinerPhoneIdx: state.joinerPhoneIdx,
        joinerRatePlan: state.joinerRatePlan,
        joinerRatePlanIdx: state.joinerRatePlanIdx,
        ageType: state.ageType,
        maxInstallment: state.maxInstallment,
        guyHap: state.guyHap,
        welfare: state.welfare,
        sup: state.sup,
        etc: state.etc,
      ),
        onData: (result) => state.copyWith(apiStatus: result != 0 ? StatusEnum.success : StatusEnum.failure, diIdx: result));
  }


}
