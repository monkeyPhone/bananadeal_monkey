import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/api/permission/model/data/permission_entity.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/permission/permission_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

part 'banana_permission_event.dart';
part 'banana_permission_state.dart';

class BananaPermissionBloc extends Bloc<BananaPermissionEvent, BananaPermissionState> {
  final PermissionRepository _repository;

  EventTransformer<T> debounce<T>(Duration duration){
    return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
  }

  BananaPermissionBloc({required PermissionRepository repository}) : _repository = repository,
        super(const BananaPermissionState()) {

    on<PermissionFetched>(_permissionFetched, transformer: debounce(const Duration(milliseconds: 600)));
    on<PermissionRequestAll>(_permissionRequestAll,  transformer: debounce(const Duration(milliseconds: 600)));

  }

  Future<void> _permissionFetched(PermissionFetched event, Emitter<BananaPermissionState> emit) async{
    await emit.forEach(
        _repository.streamGetPermissionData(),
        onData: (result) =>
            state.copyWith(
                nextPage: result.$1,
                permissionEntity: result.$2
            )
    );
  }

  Future<void> _permissionRequestAll(PermissionRequestAll event, Emitter<BananaPermissionState> emit) async{
    switch(state.isRequest){
      case true:
        if(state.permissionEntity.isSettings && !state.permissionEntity.isIos){
          _repository.openAppSettings(permissionList: state.permissionEntity.permissionList);
        }
        else{
          await emit.forEach(
              _repository.streamRequestAll(),
              onData: (result) => state.copyWith(
                isRequest : result,
              )
          );
          if(state.permissionEntity.isIos && !state.nextPage){
            _repository.setString();
          }
        }
      case false:
        await emit.forEach(
            _repository.streamRequestAll(),
            onData: (result) => state.copyWith(
              isRequest : result,
            )
        );
        if(state.permissionEntity.isIos && !state.nextPage){
          _repository.setString();
        }
    }

  }

}
