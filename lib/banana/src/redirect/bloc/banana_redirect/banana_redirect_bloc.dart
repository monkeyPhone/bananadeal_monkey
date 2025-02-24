import 'package:banana_deal_by_monkeycompany/banana/src/redirect/const/const_redirect.dart';
import 'package:data_repository_provider/data_repository_provider.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'banana_redirect_event.dart';
part 'banana_redirect_state.dart';

class BananaRedirectBloc extends Bloc<BananaRedirectEvent, BananaRedirectState> {
  final RedirectRepository redirectRepository;
  BananaRedirectBloc({
    required this.redirectRepository
  }) : super(const BananaRedirectState()) {
    on<RedirectAdsAction>(_redirectAdsAction);
  }

  Future<void> _redirectAdsAction(RedirectAdsAction event, Emitter<BananaRedirectState> emit) async{
    emit(state.copyWith(enumRedirect: EnumRedirect.adsDelay));
  }

}
