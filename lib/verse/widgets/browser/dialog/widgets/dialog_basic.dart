import 'package:banana_deal_by_monkeycompany/config/verse/verse_config.dart';
import 'package:banana_deal_by_monkeycompany/package/common/bd_common.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/size/common_size.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DialogBasic extends StatelessWidget {
  final CommonSize size;
  final String mainText;
  final GestureTapCallback onTap;
  const DialogBasic({super.key,
    required this.size,
    required this.mainText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(size.dialogCircular))
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(
                top: size.sized32grid,
                bottom: size.sized24grid, right: size.sized16grid, left: size.sized16grid),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  mainText,
                  style: TextStyle(
                      color: blackWrite,
                      fontWeight: FontWeight.w500,
                      fontSize: size.titleButton
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height60px,
            child: Row(
              children: [
                Expanded(
                  child: BdRippleButtonBasic(
                      padding: EdgeInsets.symmetric(
                          horizontal: size.sized16grid
                      ),
                      onTap: (){
                        context.read<VerseConfig>().route.closeDialog(context);
                      },
                      color:  white,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(size.dialogCircular)
                      ),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '취소',
                            style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w400,
                                fontSize: size.titleLittle
                            ),
                          ),
                        ),
                      )
                  ),
                ),
                Expanded(
                  child: BdRippleButtonBasic(
                      padding: context.read<BdCommon>().edge.pad0016,
                      onTap: onTap,
                      color:  white,
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(size.dialogCircular),
                      ),
                      child: Center(
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            '확인',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.w400,
                                fontSize: size.titleLittle
                            ),
                          ),
                        ),
                      )
                  ),
                ),
              ],
            )
          ),
        ],
      ),
    );
  }
}
