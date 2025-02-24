part of 'banana_info_user_bloc.dart';

final class BananaInfoUserState extends Equatable {
  final InfoUserStateEnum infoStateEnum;
  final String thumbnail;
  final String nickname;
  final String validate;
  final AddressVO addressVO;
  final bool nickOk;
  final bool addressOk;
  final bool isCrop;
  final bool isComplete;
  final JsonError? error;

  const BananaInfoUserState({
    this.infoStateEnum = InfoUserStateEnum.profile,
    this.thumbnail = '',
    this.nickname = '',
    this.validate = '',
    this.addressVO = ModelConfig.addressVO,
    this.nickOk = false,
    this.addressOk = false,
    this.isCrop = false,
    this.isComplete = false,
    this.error
  });

  BananaInfoUserState copyWith({
    InfoUserStateEnum? infoStateEnum,
    String? thumbnail,
    String? nickname,
    String? validate,
    AddressVO? addressVO,
    bool? nickOk,
    bool? addressOk,
    bool? isCrop,
    bool? isComplete,
    JsonError? error
  }) => BananaInfoUserState(
      infoStateEnum: infoStateEnum ?? this.infoStateEnum,
      thumbnail: thumbnail ?? this.thumbnail,
      nickname: nickname ?? this.nickname,
      validate: validate ?? this.validate,
      addressVO: addressVO ?? this.addressVO,
      nickOk: nickOk ?? this.nickOk,
      addressOk: addressOk ?? this.addressOk,
      isCrop: isCrop ?? this.isCrop,
      isComplete: isComplete ?? this.isComplete,
      error: error
  );

  @override
  List<Object?> get props => [infoStateEnum, thumbnail, nickname, validate, addressVO, nickOk, addressOk, isCrop, isComplete, error];

}