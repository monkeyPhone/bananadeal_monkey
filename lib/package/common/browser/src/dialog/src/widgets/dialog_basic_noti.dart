import 'package:banana_deal_by_monkeycompany/package/common/bd_common.dart';
import 'package:banana_deal_by_monkeycompany/package/common/size/common_size.dart';
import 'package:banana_deal_by_monkeycompany/package/widgets/button/ripple/basic/bd_button_ripple_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DialogBasicNoti extends StatelessWidget {
  final String title;
  final String content;
  final String date;
  final String result;
  final bool isBox;
  final bool isOneButton;
  final GestureTapCallback confirm;
  final GestureTapCallback refuse;
  const DialogBasicNoti({
    super.key,
    required this.title,
    required this.content,
    required this.date,
    required this.result,
    required this.isBox,
    required this.isOneButton,
    required this.confirm,
    required this.refuse,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<BdCommon>().size;
    return Dialog(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: size.sizedBox20,
          ),
          Padding(
            padding: !isBox ? size.edge.pad0016 : size.edge.pad0008,
            child: SizedBox(
              height: size.height60px,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            ),
          ),
          !isBox
              ? const SizedBox()
              : Container(
            padding: size.edge.pad1616,
            margin: size.edge.pad1600,
            color: Theme.of(context).colorScheme.surfaceContainer,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '일시: $date',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface
                  ),
                  textAlign: TextAlign.center,
                ),
                isOneButton
                    ? const SizedBox()
                    :
                Text(
                  '내용: $result',
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Container(
            color: Colors.transparent,
            padding: EdgeInsets.symmetric(
                vertical: size.sizedBox20,
                horizontal:
                !isBox
                    ? size.sizedBox8
                    : size.sizedBox34
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  content,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          SizedBox(
            height:  size.sizedBox20,
          ),
          SizedBox(
            height: size.sizedBox57,
            child: switch(isOneButton){
              true => BdButtonRippleBasic(
                  onTap: refuse,
                  borderRadius:  BorderRadius.only(
                      bottomLeft: Radius.circular(size.dialogCircular),
                      bottomRight: Radius.circular(size.dialogCircular)
                  ),
                  border: Border(
                    top: BorderSide(
                      width: size.sizedBox1_5,
                      color: Theme.of(context).colorScheme.surfaceContainerLow,
                    ),
                    right: BorderSide(
                      width: size.sizedBox1_5,
                      color: Theme.of(context).colorScheme.surfaceContainerLow,
                    ),
                  ),
                  child: Center(
                    child: Text( '닫기',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.onTertiary
                      ),
                    ),
                  )
              ),
              false => Row(
                children: [
                  Expanded(
                      child: BdButtonRippleBasic(
                          onTap: refuse,
                          borderRadius:  BorderRadius.only(
                              bottomLeft: Radius.circular(size.dialogCircular)
                          ),
                          border: Border(
                            top: BorderSide(
                              width: size.sizedBox1_5,
                              color: Theme.of(context).colorScheme.surfaceContainerLow,
                            ),
                            right: BorderSide(
                              width: size.sizedBox1_5,
                              color: Theme.of(context).colorScheme.surfaceContainerLow,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              !isBox ? '미동의' : '닫기',
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context).colorScheme.onTertiary
                              ),
                            ),
                          )
                      )

                  ),
                  Expanded(
                      child: BdButtonRippleBasic(
                          onTap: confirm,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(size.dialogCircular)
                          ),
                          border: Border(
                            top: BorderSide(
                              width: size.sizedBox1_5,
                              color: Theme.of(context).colorScheme.surfaceContainerLow,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              !isBox ? '동의' : '변경',
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: Theme.of(context).colorScheme.tertiary
                              ),
                            ),
                          )
                      )
                  )
                ],
              )
            },
          ),
        ],
      ),
    );
  }
}
