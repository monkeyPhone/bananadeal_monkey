import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/api/check_version/model/data/splash_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/splash/splash_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_appversion_event.dart';
part 'banana_appversion_state.dart';

class BananaAppversionBloc extends Bloc<BananaAppversionEvent, BananaAppversionState> {
  final SplashRepository _repository;

  BananaAppversionBloc({
    required SplashRepository repository
  }) : _repository = repository, super(const BananaAppversionState()) {
    on<VersionFetched>(_versionFetched);
  }

  Future<void> _versionFetched(VersionFetched event, Emitter<BananaAppversionState> emit) async{
    try{
      await emit.forEach(
          _repository.streamGetAppVersion(),
          onData: (result) => state.copyWith(
              splashVO: result
          )
      );
    } catch(_){
      emit(state.copyWith(splashVO:ModelConfig.splashVO));
    }
  }

}
