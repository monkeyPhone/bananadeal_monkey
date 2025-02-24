part of 'banana_auth_bloc.dart';

sealed class BananaAuthEvent extends Equatable{
  const BananaAuthEvent();

  @override
  List<Object> get props => [];
}

final class LoadingBar extends BananaAuthEvent{
  const LoadingBar();
}

final class UpdateCache extends BananaAuthEvent{
  final String jwt;
  const UpdateCache({
    required this.jwt,
  });
}

final class PostEmailLogin extends BananaAuthEvent{
  final String email;
  final String pw;
  const PostEmailLogin({
    required this.email,
    required this.pw,
  });
}

final class PostKakaoLogin extends BananaAuthEvent {
  const PostKakaoLogin();
}

final class PostAppleLogin extends BananaAuthEvent {
  const PostAppleLogin();
}