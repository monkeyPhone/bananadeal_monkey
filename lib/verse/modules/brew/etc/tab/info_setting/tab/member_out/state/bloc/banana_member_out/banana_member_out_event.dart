part of 'banana_member_out_bloc.dart';

sealed class BananaMemberOutEvent extends Equatable{
  const BananaMemberOutEvent();

  @override
  List<Object> get props => [];
}

final class SelectIndex extends BananaMemberOutEvent{
  final int index;
  const SelectIndex({
    required this.index
  });
}

final class UpdateAnswer extends BananaMemberOutEvent{
  final String value;
  const UpdateAnswer({
    required this.value
  });
}

final class MemberOut extends BananaMemberOutEvent{
  final BuildContext context;
  const MemberOut(this.context);
}
