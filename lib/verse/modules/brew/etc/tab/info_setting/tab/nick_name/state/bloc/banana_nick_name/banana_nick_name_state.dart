part of 'banana_nick_name_bloc.dart';

final class BananaNickNameState extends Equatable {
  final String nickName;
  final String validate;
  const BananaNickNameState({
    this.nickName = '',
    this.validate = '',
  });

  BananaNickNameState copyWith({
    String? nickName,
    String? validate
  }) => BananaNickNameState(
      nickName: nickName ?? this.nickName,
      validate: validate ?? this.validate
  );

  @override
  List<Object> get props => [nickName, validate];

}
