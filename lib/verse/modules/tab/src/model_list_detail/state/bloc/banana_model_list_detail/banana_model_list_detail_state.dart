part of 'banana_model_list_detail_bloc.dart';

final class BananaModelListDetailState extends Equatable {
  final StatusEnum statusEnum;
  final PhoneSpecDetailEntity modelDetailEntity;
  final ModelDetailEnum modelDetailEnum;
  final PsSpec spec;
  final String mk;
  final int currentColor;

  const BananaModelListDetailState({
    this.statusEnum = StatusEnum.initial,
    this.modelDetailEntity = ModelConfig.phoneSpecDetailEntity,
    this.modelDetailEnum = ModelDetailEnum.image,
    this.spec = ModelConfig.psSpec,
    this.mk = '',
    this.currentColor = 0,
  });

  BananaModelListDetailState copyWith({
    StatusEnum? statusEnum,
    PhoneSpecDetailEntity? modelDetailEntity,
    ModelDetailEnum? modelDetailEnum,
    PsSpec? spec,
    String? mk,
    int? currentColor,
  }) => BananaModelListDetailState(
    statusEnum: statusEnum ?? this.statusEnum,
    modelDetailEntity: modelDetailEntity ?? this.modelDetailEntity,
    modelDetailEnum: modelDetailEnum ?? this.modelDetailEnum,
    spec: spec ?? this.spec,
    mk: mk ?? this.mk,
    currentColor: currentColor ?? this.currentColor,
  );

  @override
  List<Object> get props => [
    statusEnum, modelDetailEntity, modelDetailEnum, spec, mk, currentColor
  ];
}