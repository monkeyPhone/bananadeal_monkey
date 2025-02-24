import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../controllers/chat_log_controller.dart';

class ChatScrolldown extends GetView<ChatLogController> {
  const ChatScrolldown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  Positioned(
      left: WidgetSize(context).sizedBox16,
      bottom: WidgetSize(context).sizedBox16,
      child: ObxValue(
              (down)=>
          down.value
              ?
              RippleDecorationButton(
                  onTap: (){
                    controller.isHiddenFalse();
                    // controller.moveScrollInit();
                  },
                  borderRadius: BorderRadius.circular(999),
                  color: Colors.black38,
                  padding: EdgeInsets.symmetric(
                      vertical: WidgetSize(context).sizedBox10,
                      horizontal: WidgetSize(context).sizedBox16),
                  width:  WidgetSize(context).widthCommon-WidgetSize(context).sizedBox40,
                  widget: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ObxValue((hide) => Text(hide.value
                        ,style: TextStyle(fontSize: WidgetSize(context).sizedBox17, color: Style.white),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ), controller.hiddenText),
                    ],
                  )
              )
              :
          ObxValue((edge) =>
          !edge.value
              ? SizedBox(
            height: WidgetSize(context).sizedBox37,
            width: WidgetSize(context).sizedBox37,
            child: FittedBox(
              child: FloatingActionButton(
                elevation: 3,
                backgroundColor: Colors.white70,
                onPressed: () {
                  controller.moveScrollButton();
                },
                child: ObxValue((p0)=>
                p0.value == 0
                    ? Center(child: CircularProgressIndicator(color: Style.progressBar,),)
                    : SizedBox.expand(child: FittedBox(child: Icon(Icons.keyboard_arrow_down, color: Style.ultimateGrey,)))
                    ,controller.send),
              ),
            ),
          ) : SizedBox()
              ,controller.scrollEdge)
          , controller.isHidden)
      ,
    );

  }
}
