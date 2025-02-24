import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/phone_spec_detail/model/action/phone_spec_detail_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/phone_spec_detail/model/func/phone_spec_detail_func.dart';
import 'package:banana_deal_by_monkeycompany/package/api/monkey/phone_spec_detail/model/phone_spec_detail_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/monkey/model_list_detail/src/model_list_detail_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list_detail/manager/model_list_detail_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list_detail/state/bloc/banana_model_list_detail/banana_model_list_detail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list_detail/view/widgets/detail/model_list_detail_body_detail_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list_detail/view/widgets/image/model_list_detail_body_image_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list_detail/view/widgets/spec/model_list_detail_body_spec_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_side.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/spin/bd_loading_spin.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ModelListDetailView extends StatelessWidget {
  final String psIdx;
  final String name;
  const ModelListDetailView({super.key,
    required this.psIdx,
    required this.name
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<PhoneSpecDetailApiImpl>(
              create: (BuildContext context) =>
                  const PhoneSpecDetailApiImpl(
                      action: PhoneSpecDetailAction(),
                      func: PhoneSpecDetailFunc()
                  )
          ),
          RepositoryProvider<ModelListDetailRepositoryImpl>(
            create: (BuildContext context) => ModelListDetailRepositoryImpl(
                phoneSpecDetailApi: context.read<PhoneSpecDetailApiImpl>(),
                monkeyUrl: context.read<VerseConfig>().url.monkeyUrl,
                dio: context.read<VerseConfig>().dio
            ),
          ),
          RepositoryProvider<ModelListDetailManager>(
            create: (BuildContext context) => ModelListDetailManager(
                psIdx: psIdx,
                name: name,
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BananaModelListDetailBloc>(
              create: (BuildContext context) =>
              BananaModelListDetailBloc(
                  repository: context.read<ModelListDetailRepositoryImpl>()
              )..add(InitModelDetail(psIdx: psIdx)),
            ),
          ],
          child: const _Canvas(),
        )
    );
  }
}



class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {
    return BdCanvas(
      canvasEnum: CanvasEnum.basic,
      appbar: (context.read<ModelListDetailManager>().name, null, null, null),
      body: const _Body(),
      navbarWidget: const _Navbar(),
      navNullAble: true,
    );

  }
}


class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaModelListDetailBloc, BananaModelListDetailState, StatusEnum>(
        selector: (state)=> state.statusEnum,
        builder: (context, status) =>
        status == StatusEnum.success
            ? const _BodySrc()
            :  const BdLoadingSpin()
    );
  }
}

class _BodySrc extends StatelessWidget {
  const _BodySrc();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaModelListDetailBloc, BananaModelListDetailState, ModelDetailEnum>(
        selector: (state) => state.modelDetailEnum,
        builder: (context, detail) =>
            IndexedStack(
              index: detail.index,
              children: const [
                ModelListDetailBodyImageView(),
                ModelListDetailBodyDetailView(),
                ModelListDetailBodySpecView()
              ],
            )
    );
  }
}




class _Navbar extends StatelessWidget {
  const _Navbar();

  @override
  Widget build(BuildContext context) {
    return BdLayoutSide(
      sidePadding: SidePadding.zero,
      child: BlocSelector<BananaModelListDetailBloc, BananaModelListDetailState, ModelDetailEnum>(
        selector: (state) => state.modelDetailEnum,
        builder: (context, detail) =>
            Row(
              children: [
                _NavbarButton(
                    onTap: (){
                      context.read<ModelListDetailManager>().changeDetailEnum(detailEnum: ModelDetailEnum.image, context: context);
                    },
                    text: '이미지',
                    isOk: detail == ModelDetailEnum.image
                ),
                _NavbarButton(
                    onTap: (){
                      context.read<ModelListDetailManager>().changeDetailEnum(detailEnum: ModelDetailEnum.detail, context: context);
                    },
                    text: '디테일',
                    isOk: detail == ModelDetailEnum.detail
                ),
                _NavbarButton(
                    onTap: (){
                      context.read<ModelListDetailManager>().changeDetailEnum(detailEnum: ModelDetailEnum.spec, context: context);
                    },
                    text: '스펙',
                    isOk: detail == ModelDetailEnum.spec
                ),
              ],
            ),
      ),
    );
  }
}

class _NavbarButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;
  final bool isOk;
  const _NavbarButton({
    required this.onTap,
    required this.text,
    required this.isOk,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: BdRippleButtonBasic(
        onTap: onTap,
        child: Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: BdTextWidget(
              text: text,
              textStyle: isOk
                  ? bodyBold
                  : bodyGreyBold,
            ),
          ),
        ),
      ),
    );
  }
}