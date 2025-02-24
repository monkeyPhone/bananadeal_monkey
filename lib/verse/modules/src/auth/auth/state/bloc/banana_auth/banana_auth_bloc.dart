import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/login/login_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_auth_event.dart';
part 'banana_auth_state.dart';

class BananaAuthBloc extends Bloc<BananaAuthEvent, BananaAuthState> {
  final LoginRepository _repository;
  BananaAuthBloc({
    required LoginRepository repository,
  }) : _repository = repository,
        super(const BananaAuthState()) {
    on<PostEmailLogin>(_postEmailLogin);
    on<PostKakaoLogin>(_postKakaoLogin);
    on<PostAppleLogin>(_postAppleLogin);
    on<UpdateCache>(_updateCache);
    on<LoadingBar>(_loadingBar);
  }

  Future<void> _postEmailLogin(PostEmailLogin event, Emitter<BananaAuthState> emit) async{
    add(const LoadingBar());
    await emit.forEach(
        _repository.streamPostEmailLogin(email: event.email, pw: event.pw),
        onData: (result) => state.copyWith(dataDto: result)
    );
    add(UpdateCache(jwt:state.dataDto.data.first));
  }

  Future<void> _postKakaoLogin(PostKakaoLogin event, Emitter<BananaAuthState> emit) async{
    add(const LoadingBar());
    await emit.forEach(
        _repository.streamPostKakaoLogin(),
        onData: (result) => state.copyWith(dataDto: result)
    );
    add(UpdateCache(jwt:state.dataDto.data.first));
  }

  Future<void> _postAppleLogin(PostAppleLogin event, Emitter<BananaAuthState> emit) async{
    add(const LoadingBar());
    await emit.forEach(
        _repository.streamPostAppleLogin(),
        onData: (result) => state.copyWith(dataDto: result)
    );
    add(UpdateCache(jwt:state.dataDto.data.first));
  }

  Future<void> _updateCache(UpdateCache event, Emitter<BananaAuthState> emit) async{
    await _repository.provider.saveTokenHive(event.jwt);
    await _repository.futureDelay(400);
    emit(state.copyWith(checkLogin: event.jwt));
  }



  Future<void> _loadingBar(LoadingBar event ,Emitter<BananaAuthState> emit) async{
    emit(state.copyWith(dataDto: const DataDto(statusEnum: StatusEnum.loading, data: [], tokenError: false)));
    await _repository.futureDelay(400);
  }


}
