import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_side.dart';
import 'package:flutter/material.dart';
import '../../../../../util/color/const_color.dart';

class LoadingAnimationWidget extends StatefulWidget {
  final Widget buildWidget;
  final bool? isIntro;
  const LoadingAnimationWidget({super.key,
    required this.buildWidget,
    this.isIntro,
  });

  @override
  State<LoadingAnimationWidget> createState() => _LoadingAnimationWidgetState();
}

class _LoadingAnimationWidgetState extends State<LoadingAnimationWidget> {

  bool page = false;
  late ModalRoute _modalRoute;


  void _handler(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      setState(() {
        page = true;
      });
      _modalRoute.animation!.removeStatusListener(_handler);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _modalRoute = ModalRoute.of(context)!;
    if (_modalRoute.animation != null) {
      _modalRoute.animation!.addStatusListener(_handler);
    } else {
      // setState(() {
      //   page = true;
      //   log('no check message');
      // });
    }
  }

  @override
  void dispose() {
    // dispose에서 상태 리스너 제거
    _modalRoute.animation!.removeStatusListener(_handler);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return switch(page){
      true => widget.buildWidget,
      false => switch(widget.isIntro){
        null => const _PlaceHolder2(),
        _ => const _PlaceHolder()
      }
    };
  }
}


class _PlaceHolder2 extends StatelessWidget {
  const _PlaceHolder2();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(),
      body: Column(children: [
        const BdLayoutSide(
            sidePadding: SidePadding.customAppbar,
            child: SizedBox()
        ),
        Expanded(child: Container(color: white,))
      ],),
    );


    //   const BdCanvas(
    //     canvasEnum: CanvasEnum.basic,
    //     appbar: ('', null, null, null),
    //     body: SizedBox()
    // );

  }
}


class _PlaceHolder extends StatelessWidget {
  const _PlaceHolder();

  @override
  Widget build(BuildContext context) {
    return const BdCanvas(
        canvasEnum: CanvasEnum.basic,
        appbar: ('', null, null, null),
        body: SizedBox()
    );
  }
}
