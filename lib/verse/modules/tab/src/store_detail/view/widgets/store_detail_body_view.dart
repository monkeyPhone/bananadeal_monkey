import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/manager/store_detail_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/state/bloc/banana_store_detail/banana_store_detail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/store_detail/view/widgets/body/list/store_detail_body_list_tile_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/loading/indicator/bd_refresh_indicator.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StoreDetailBodyView extends StatelessWidget {
  const StoreDetailBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        _List(),
        _BackButton()
      ],
    );
  }
}


class _List extends StatelessWidget {
  const _List();

  @override
  Widget build(BuildContext context) {
    return BdRefreshIndicator(
      onRefresh: ()async{
        context.read<StoreDetailManager>().refreshButton(context);
      },
      child: ListView.builder(
        itemCount: 1,
        physics: const ClampingScrollPhysics().applyTo(const AlwaysScrollableScrollPhysics()),
        controller: context.read<StoreDetailManager>().getController(context),
        itemBuilder: (BuildContext context, int index) =>
            StoreDetailBodyListTileView(
            )
      ),
    );
  }
}


class _BackButton extends StatefulWidget {
  const _BackButton();

  @override
  State<_BackButton> createState() => _BackButtonState();
}

class _BackButtonState extends State<_BackButton> {

  bool _change = false;
  bool _text = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<StoreDetailManager>().getController(context).addListener(() async{

      if(context.read<StoreDetailManager>().getController(context).position.pixels >= context.read<VerseConfig>().size.ratio58-context.read<VerseConfig>().size.sizedBox28) {
        setState(() {
          _change = true;
        });
        if(context.read<StoreDetailManager>().getController(context).position.pixels >= context.read<VerseConfig>().size.ratio58+context.read<VerseConfig>().size.sized12grid){
          setState(() {
            _text = true;
          });
        }
        else{
          setState(() {
            _text = false;
          });
        }
      }
      else{
        setState(() {
          _change = false;
          _text = false;
        });
        // if(context.read<StoreDetailManager>().getController(context).position.pixels >= context.read<SizeConfig>().widgetSize.ratio58/2 && context.read<StoreDetailManager>().getController(context).position.pixels <= context.read<SizeConfig>().widgetSize.ratio58/3*2 ){
        //   if(context.read<StoreDetailManager>().getController(context).position.userScrollDirection == ScrollDirection.forward){
        //     context.read<StoreDetailManager>().getController(context).jumpTo(0);
        //     setState(() {
        //       _change = false;
        //       _text = false;
        //     });
        //   }
        //   if(context.read<StoreDetailManager>().getController(context).position.userScrollDirection == ScrollDirection.reverse){
        //     context.read<StoreDetailManager>().getController(context).jumpTo(context.read<SizeConfig>().widgetSize.ratio58);
        //     setState(() {
        //       _change = true;
        //       _text = true;
        //     });
        //
        //   }
        // }
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return  Positioned(
        child: _text ? Container(
          color: white,
          height: context.read<VerseConfig>().size.sizedAppbar,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BackButton(
                onPressed: (){
                  context.read<StoreDetailManager>().route.closePage(context);
                },
                color: _change ? bananaBack : white,
              ),
              FittedBox(
                fit: BoxFit.scaleDown,
                child: BdTextWidget(
                  text: context.read<BananaStoreDetailBloc>().state.detailVO.smStoreName,
                  textStyle: titleNameBold,
                ),),
              _BookmarkButton(_change)
            ],
          ),
        ) : Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackButton(
              onPressed: (){
                context.read<StoreDetailManager>().route.closePage(context);
              },
              color: _change ? bananaBack : white,
            ),
            _BookmarkButton(_change)
          ],
        )
    );
  }
}

class _BookmarkButton extends StatelessWidget {
  final bool change;
  const _BookmarkButton(this.change);

  @override
  Widget build(BuildContext context) {
    return  BlocSelector<BananaStoreDetailBloc, BananaStoreDetailState, bool>(
      selector: (state) => state.isBookmark,
      builder: (context, isBookmark) =>
          IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: (){
              context.read<StoreDetailManager>().updateFavorite(context);
            },
            iconSize: context.read<VerseConfig>().size.sizedBox28,
            color: isBookmark ? yellow : change ? bananaBack : white,
            icon: Icon(isBookmark ? Icons.bookmark : Icons.bookmark_border) ,
          ),
    );
  }
}
