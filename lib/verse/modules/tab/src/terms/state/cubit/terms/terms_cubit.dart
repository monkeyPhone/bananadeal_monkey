import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/terms/dialog/terms_dialog.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
part 'terms_state.dart';

class TermsCubit extends Cubit<TermsState> {
  final TermsDialog _dialog;
  final BuildContext _context;
  final String _bananaOpenUrl;
  TermsCubit({ required TermsDialog termDialog,  required BuildContext context, required String bananaOpenUrl}) :
        _context = context,
        _dialog = termDialog,
        _bananaOpenUrl = bananaOpenUrl, super(const TermsState()){
    fetchTerms(_context);
  }

  Future<void> fetchTerms(BuildContext context)=> _getTerms().then(
          (value) {
        if(value == null){
          if(context.mounted){
            _dialog.closePage(context);
            context.read<VerseConfig>().browser.snackBar.showSnackBar( text: '현재 이용약관을 불러올 수 없습니다.', context: context);
          }
        } else{
          emit(state.copyWith(terms: value.result.first));
        }

      }
  );

  void clickDialog({
    required BuildContext context,
    required int index,
    required ScrollController sController1,
    required ScrollController sController2,
    required ScrollController sController3,
  }){
    _dialog.clickDialog(
        routerContext: context,
        index: index,
        tService: state.terms.tService, tPrivacy: state.terms.tPrivacy, tLocation: state.terms.tLocation, sController1: sController1, sController2: sController2, sController3: sController3);
  }

  Future<TermsT?> _getTerms() async{
    final String apiRoute = '$_bananaOpenUrl/terms';
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try {
      var response =
      await dio.post(
        apiRoute,
      );

      var data = response.data;

      TermsT api = TermsT.fromJson(data);
      if (api.status == 200){
        return api;
      }
      else {
        return null;
      }
    } on DioException catch (_) {
      return null;
    } finally{
      dio.close();
    }



  }

}