part of 'banana_redirect_bloc.dart';

final class BananaRedirectState extends Equatable {
  final EnumRedirect enumRedirect;
  const BananaRedirectState({
    this.enumRedirect = EnumRedirect.initial
  });

  BananaRedirectState copyWith({
    EnumRedirect? enumRedirect
  }) {
    return BananaRedirectState(
      enumRedirect: enumRedirect ?? this.enumRedirect
    );
  }

  @override
  List<Object> get props => [
    enumRedirect
  ];
}
