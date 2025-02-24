part of 'banana_redirect_bloc.dart';

sealed class BananaRedirectEvent extends Equatable{

  const BananaRedirectEvent();

  @override
  List<Object> get props => [];
}

final class RedirectAdsAction extends BananaRedirectEvent {
  const RedirectAdsAction();

}
