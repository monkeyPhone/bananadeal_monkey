import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/common/bd_common.dart';
import 'package:banana_deal_by_monkeycompany/package/common/size/common_size.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



class DialogCustomColumnWidget extends StatelessWidget {
  final String mainText;
  final String? cancelText;
  final String confirmText;
  final GestureTapCallback conFirmOnTap;
  final GestureTapCallback cancelOnTap;


  const DialogCustomColumnWidget({super.key,
    required this.mainText,
    required this.cancelText,
    required this.confirmText,
    required this.conFirmOnTap,
    required this.cancelOnTap
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<BdCommon>().size;
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            color: Theme.of(context).colorScheme.surfaceDim,
            padding: EdgeInsets.symmetric(
                vertical: size.sizedBox45,
                horizontal: size.sizedBox16
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  mainText,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Theme.of(context).colorScheme.onSurface
                  ),
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          SizedBox(
            height: size.sizedBox120,
            child: Column(
              children: [
                Expanded(
                    child: BdRippleButtonBasic(
                        border: Border(
                            top: BorderSide(width: size.sizedBox1, color: Theme.of(context).colorScheme.surfaceContainerLowest),
                            bottom: BorderSide(width: size.sizedBox1, color: Theme.of(context).colorScheme.surfaceContainerLowest)
                        ),
                        padding: size.edge.pad0016,
                        onTap: cancelOnTap,
                        color: Theme.of(context).colorScheme.surface,
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              cancelText ?? '',
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: Theme.of(context).colorScheme.tertiary
                              ),
                            ),
                          ),
                        )
                    )

                ),
                Expanded(
                    child: BdRippleButtonBasic(
                        padding: size.edge.pad0016,
                        onTap: conFirmOnTap,
                        color:  Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(size.dialogCircular),
                            bottomLeft: Radius.circular(size.dialogCircular)
                        ),
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              confirmText,
                              style: Theme.of(context).textTheme.titleSmall!.copyWith(
                                  color: Theme.of(context).colorScheme.onTertiary
                              ),
                            ),
                          ),
                        )
                    )
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
