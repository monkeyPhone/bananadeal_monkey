import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/searh_address/model/data/address_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/address/src/address_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/address/state/bloc/banana_address_bloc/banana_address_bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class AddressManager {
  final void Function(AddressVO addressVO) callBack;

  const AddressManager({
    required this.callBack,
  });

  void backSpaceEvent(BuildContext context) {
    if( MediaQuery
        .of(context)
        .viewInsets
        .bottom > 0) {
      FocusScope.of(context).unfocus();
    }
    else{
      context.read<BananaAddressBloc>().add(BackSpaceEvent(context: context));
    }
  }

  void closePage(BuildContext context) => context.read<VerseConfig>().route.closePage(context);
  void closeDialog(BuildContext context) => context.read<VerseConfig>().route.closeDialog(context);

  void showSnackBar({
    required BuildContext context,
    required String text,
  }) =>
      context.read<VerseConfig>().browser.snackBar.showSnackBar(text: text, context: context,);


  void initAddress(BuildContext context){
    context.read<BananaAddressBloc>().add(const InitAddress());
  }

  void fetchAddress({
    required BuildContext context,
    required String search,
    required int currentPage,
  }) => context.read<BananaAddressBloc>().add(FetchAddress(search: search, currentPage: currentPage));

  void gotoNaverMapView({
    required BuildContext context,
    required (double, double) currentNat,
  })  =>
      context.read<VerseConfig>().tab.gotoNaverMapView(
          context: context,
          callback: (data){
            updateNew(context: context, data: data);
          },
          currentNat: GpsVO(lat: currentNat.$1, lnt: currentNat.$2)
      );

  void fetchPage({
    required BuildContext context,
    required int currentPage
  }) => context.read<BananaAddressBloc>().add(FetchPage(currentPage));

  void updateNew({
    required BuildContext context,
    required AddressVO data,
  }) =>
      context.read<BananaAddressBloc>().add(
          FetchLocation(
              data: data
          )
      );

  void clickList({
    required BuildContext context,
    required Juso juso,
  }) =>
      // AddressEventHelper().eventCall(juso: juso, routerContext: routerContext,);
  switch(!kIsWeb){
    true =>
      context.read<AddressRepositoryImpl>().makePlaceMarks(
          address: juso.roadAddrPart1,
          address2: juso.engAddr,
          address3: juso.jibunAddr,
        ).then(
                (value) =>
                    context.mounted
                        ?  value.lnt == 0.0
                              ? showSnackBar(text: '위치를 확인할 수 없는 장소입니다.', context: context,)
                              : updateNew(
                                  context: context,
                                  data: AddressVO(
                                      address: juso.roadAddr != ''
                                                  ?  juso.roadAddr
                                                  : juso.jibunAddr != ''
                                                      ? juso.jibunAddr
                                                      : '알 수 없음',
                                      dong: juso.emdNm,
                                      coordinate: value
                                  )
                                )
                        : null
        ),
    false =>
        updateNew(
            context: context,
            data: AddressVO(address: juso.roadAddr != ''
                ?  juso.roadAddr
                : juso.jibunAddr != ''
                ? juso.jibunAddr
                : '알 수 없음', dong: juso.emdNm, coordinate: ModelConfig.coordinate)
        )
  };

  void initListChoice(BuildContext context) =>
      updateNew(context: context, data: ModelConfig.addressVO);


  void setAddress({
    required BuildContext context,
    required AddressVO data
  }){
    callBack(data);
    closePage(context);
  }


}