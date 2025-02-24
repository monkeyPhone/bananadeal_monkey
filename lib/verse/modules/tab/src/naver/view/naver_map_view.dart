import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/naver_map/model/action/naver_map_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/naver_map/model/naver_map_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/data/naver_map_store_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/naver_map/src/naver_map_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/naver/manager/naver_map_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/naver/state/bloc/banana_naver_map/banana_naver_map_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/naver/view/widgets/body/change/naver_map_body_change_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/naver/view/widgets/body/fix/naver_map_body_fix_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/normal/bd_disabled_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NaverMapView extends StatelessWidget {
  final void Function(AddressVO addressVO) callback;
  final NaverMapStoreVO? info;
  final GpsVO? currentNat;
  const NaverMapView({super.key,
    this.currentNat,
    this.info,
    required this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return switch(info){
      null => MultiRepositoryProvider(
          providers: [
            RepositoryProvider<NaverMapApiImpl>(
                create: (BuildContext context) =>
                  const NaverMapApiImpl(
                      action: NaverMapAction()
                  )
            ),
            RepositoryProvider<NaverMapRepositoryImpl>(
              create: (BuildContext context) => NaverMapRepositoryImpl(
                api: context.read<NaverMapApiImpl>(),
                isIos: context.read<VerseConfig>().cache.mainCache.isIos
              ),
            ),
            RepositoryProvider<NaverMapManager>(
              create: (BuildContext context) => NaverMapManager(
                  callBack: callback
              ),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider<BananaNaverMapBloc>(
                create: (BuildContext context) => BananaNaverMapBloc(
                    repository: context.read<NaverMapRepositoryImpl>()
                ),
              ),
            ],
            child: _Canvas(currentNat),
          )
      ),
      _ => _CanvasStatic(info: info!,)
    };
  }
}


class _Canvas extends StatelessWidget {
  final GpsVO? currentNat;
  const _Canvas(this.currentNat);

  @override
  Widget build(BuildContext context) {

    return BdCanvas(
      canvasEnum: CanvasEnum.basic,
      appbar: ('위치설정', null, null, null),
      body: NaverMapBodyChangeView(currentNat: currentNat,),
      isCanPop: true,
      navbarWidget: _CanvasButton(),

    );
  }
}


class _CanvasButton extends StatelessWidget {
  const _CanvasButton();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocBuilder<BananaNaverMapBloc, BananaNaverMapState>(
        builder: (context, state) =>
        state.isInit ?
        state.isMove  ? const BdDisabledButton(text: '마커가 이동중입니다.')
                      : state.addressVO.dong == ''
                          ? const BdDisabledButton(text: '검색중입니다.')
                          : state.next
                            ? BdNeoButton(
          size: size,
          text: '설정하기',
          onPressed: () {
            context.read<NaverMapManager>().setAddress(
                context: context,
                data: state.addressVO
            );
          },
        )
            : const BdDisabledButton(text: '...')
            :const BdDisabledButton(text: '',)
    );
  }
}


class _CanvasStatic extends StatelessWidget {
  final NaverMapStoreVO info;
  const _CanvasStatic({
    required this.info
  });

  @override
  Widget build(BuildContext context) {

    return BdCanvas(
      canvasEnum: CanvasEnum.basic,
      appbar: (info.info.name, null, null, null),
      body: NaverMapBodyFixView(
        info: info,
      ),
      isCanPop: true,
      navbarWidget: BdNeoButton(
        size: context.read<VerseConfig>().size,
        text: '돌아가기',
        onPressed: () {
          context.read<VerseConfig>().route.closePage(context);
        },
      ),
    );

  }
}