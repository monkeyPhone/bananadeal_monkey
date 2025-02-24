part of 'banana_alert_setting_bloc.dart';

sealed class BananaAlertSettingEvent extends Equatable{
  const BananaAlertSettingEvent();

  @override
  List<Object> get props => [];
}

final class InitSetting extends BananaAlertSettingEvent{
  const InitSetting();
}

final class ChangeEditMode extends BananaAlertSettingEvent{
  final bool isEditMode;
  final bool isSpValue;
  final String isSpDate;
  final bool isMpValue;
  final String isMpDate;
  final bool isDealPush;
  final bool isChatPush;
  final bool isAddPush;
  const ChangeEditMode({
    required this.isEditMode,
    required this.isSpValue,
    required this.isSpDate,
    required this.isMpValue,
    required this.isMpDate,
    required this.isDealPush,
    required this.isChatPush,
    required this.isAddPush,
  });
}

final class ChangeSp extends BananaAlertSettingEvent{
  final bool isSpValue;
  const ChangeSp({
    required this.isSpValue,
  });
}

final class ChangeMp extends BananaAlertSettingEvent{
  final bool isMpValue;
  const ChangeMp({
    required this.isMpValue,
  });
}

final class ChangeDeal extends BananaAlertSettingEvent{
  final bool isDealPush;
  const ChangeDeal({
    required this.isDealPush,
  });
}

final class ChangeChat extends BananaAlertSettingEvent{
  final bool isChatPush;
  const ChangeChat({
    required this.isChatPush,
  });
}

final class ChangeAdd extends BananaAlertSettingEvent{
  final bool isAddPush;
  const ChangeAdd({
    required this.isAddPush,
  });
}


final class FetchStatus extends BananaAlertSettingEvent{

  const FetchStatus();
}