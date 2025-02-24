import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/searh_address/model/action/search_address_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/searh_address/model/search_address_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/data/address_vo.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/address/src/address_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/address/manager/address_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/address/state/bloc/banana_address_bloc/banana_address_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/address/state/listener/banana_address_bloc_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/address/view/widgets/body/address_body_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/normal/bd_disabled_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressView extends StatelessWidget {
  final void Function(AddressVO addressVO) callBack;
  const AddressView({super.key,
    required this.callBack,
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<SearchAddressApiImpl>(
              create: (BuildContext context) =>
                  const SearchAddressApiImpl(
                      action: SearchAddressAction(),
                  )
          ),

          RepositoryProvider<AddressRepositoryImpl>(
            create: (BuildContext context) => AddressRepositoryImpl(
                api: context.read<SearchAddressApiImpl>(),
                dio: context.read<VerseConfig>().dio
            ),
          ),
          RepositoryProvider<AddressManager>(
            create: (BuildContext context) => AddressManager(
                callBack: callBack
            ),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider<BananaAddressBloc>(
              create: (BuildContext context) => BananaAddressBloc(
                  repository: context.read<AddressRepositoryImpl>(),
                  route:  context.read<VerseConfig>().route
              ),
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
      customFunction: (){
        context.read<AddressManager>().backSpaceEvent(context);
      },
      isForm: true,
      isCanPop: true,
      listener: const BananaAddressBlocListener(),
      appbar: ('위치 설정', null, null, null),
      body: const AddressBodyView(),
      navbarWidget: const _Nav(),
    );
  }
}

class _Nav extends StatelessWidget {

  const _Nav();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaAddressBloc, BananaAddressState>(
        builder: (context, state) =>
        switch(state.addressVO.dong){
          '' => state.search.isEmpty
              ? const BdDisabledButton(
            text: '설정된 위치가 없습니다.',
          )
              :
          const _NavPage(),
          _ =>
              BdNeoButton(
                  size: context.read<VerseConfig>().size,
                  text: '설정하기',
                  onPressed: () {
                    context.read<AddressManager>().setAddress(
                        data: state.addressVO, context: context
                    );
                  }
              ),
        }
    );
  }
}


class _NavPage extends StatelessWidget {
  const _NavPage();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaAddressBloc, BananaAddressState, int>(
        selector: (state) => state.currentPage,
        builder: (context, page) =>
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                page == 1
                    ?  const _DefaultButton()
                    : _PageButton(
                  onTap: () {
                    if(page > 1){
                      context.read<AddressManager>().fetchPage(currentPage: page-1, context: context);
                    }
                  },
                  text: '${page-1}',
                  isFore: true,
                ),
                Text('$page', style: TextStyle(color: bananaBack, fontSize: context.read<VerseConfig>().size.sizedBox20, fontWeight: FontWeight.w600)),
                BlocSelector<BananaAddressBloc, BananaAddressState, int>(
                  selector: (state) => state.maxPage,
                  builder: (context, max) =>
                  page != max && max != 0
                      ? _PageButton(
                    onTap: () {
                      if(page < max){
                        context.read<AddressManager>().fetchPage(currentPage: page+1, context: context);
                      }
                    },
                    text: '${page+1}',
                    isFore: false,
                  )
                      :  const _DefaultButton(),

                ),

              ],
            )
    );
  }
}


class _PageButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final String text;
  final bool isFore;
  const _PageButton({
    required this.onTap,
    required this.text,
    required this.isFore
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BdRippleButtonBasic(
      onTap: onTap,
      child: SizedBox(
        width: size.sizedBox70,
        child: Row(
          children: [
            isFore ? Expanded(child: FittedBox(fit: BoxFit.scaleDown,child: Text(
                text, style: TextStyle(color: Colors.grey,
              fontSize: size.sizedBox17,)))) : const SizedBox(),
            SizedBox(
              height: size.sizedBox50,
              width: size.sizedBox50,
              child:
              FittedBox(
                child: isFore ? const Icon(Icons.keyboard_arrow_left , color: bananaBack,)
                    : const Icon(Icons.keyboard_arrow_right, color: bananaBack,),
              ),
            ),
            isFore ? const SizedBox() : Expanded(child: FittedBox(fit: BoxFit.scaleDown,child: Text(text, style: TextStyle(color: Colors.grey,
              fontSize: size.sizedBox16,)))),
          ],
        ),
      ),
    );
  }
}



class _DefaultButton extends StatelessWidget {
  const _DefaultButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.read<VerseConfig>().size.sizedBox50,
      width: context.read<VerseConfig>().size.sizedBox70,
    );
  }
}