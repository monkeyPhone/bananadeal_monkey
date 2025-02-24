part of 'banana_alert_setting_bloc.dart';

final class BananaAlertSettingState extends Equatable {
  final bool isOriginSpValue;
  final bool isOriginMpValue;
  final String isOriginSpDate;
  final String isOriginMpDate;
  final bool isEditMode;
  final bool isSpValue;
  final String isSpDate;
  final bool isMpValue;
  final String isMpDate;
  final bool isDealPush;
  final bool isChatPush;
  final bool isAddPush;
  final StatusEnum statusEnum;

  const BananaAlertSettingState({
    this.isOriginSpValue = false,
    this.isOriginMpValue = false,
    this.isOriginSpDate = '',
    this.isOriginMpDate = '',
    this.isEditMode = false,
    this.isSpValue = false,
    this.isSpDate = '',
    this.isMpValue = false,
    this.isMpDate = '',
    this.isDealPush = false,
    this.isChatPush = false,
    this.isAddPush = false,
    this.statusEnum = StatusEnum.initial,
  });

  BananaAlertSettingState copyWith({
    bool? isOriginSpValue,
    bool? isOriginMpValue,
    String? isOriginSpDate,
    String? isOriginMpDate,
    bool? isEditMode,
    bool? isSpValue,
    String? isSpDate,
    bool? isMpValue,
    String? isMpDate,
    bool? isDealPush,
    bool? isChatPush,
    bool? isAddPush,
    StatusEnum? statusEnum,
  }) => BananaAlertSettingState(
    isOriginSpValue: isOriginSpValue ?? this.isOriginSpValue,
    isOriginMpValue: isOriginMpValue ?? this.isOriginMpValue,
    isOriginSpDate: isOriginSpDate ?? this.isOriginSpDate,
    isOriginMpDate: isOriginMpDate ?? this.isOriginMpDate,
    isEditMode: isEditMode ?? this.isEditMode,
      isSpValue: isSpValue ?? this.isSpValue,
      isSpDate: isSpDate ?? this.isSpDate,
      isMpValue: isMpValue ?? this.isMpValue,
      isMpDate: isMpDate ?? this.isMpDate,
      isDealPush: isDealPush ?? this.isDealPush,
      isChatPush: isChatPush ?? this.isChatPush,
      isAddPush: isAddPush ?? this.isAddPush,
      statusEnum: statusEnum ?? this.statusEnum
  );

  @override
  List<Object> get props => [isOriginSpValue, isOriginMpValue, isOriginSpDate, isOriginMpDate, isEditMode, isSpValue, isSpDate, isMpValue, isMpDate, isDealPush, isChatPush, isAddPush,statusEnum];
}
