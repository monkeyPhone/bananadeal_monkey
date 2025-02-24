import 'package:banana_deal_by_monkeycompany/package/common/bd_common.dart';
import 'package:banana_deal_by_monkeycompany/package/common/size/common_size.dart';
import 'package:banana_deal_by_monkeycompany/package/widgets/button/ripple/basic/bd_button_ripple_basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DialogBasic extends StatelessWidget {
  final String mainText;
  final GestureTapCallback onTap;
  const DialogBasic({super.key,
    required this.mainText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: context.read<BdCommon>().size.edge.pad3216,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              mainText,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface
              ),
              textAlign: TextAlign.center,
            ),
            _Button(
              onTap: onTap,
            )
          ],
        ),
      ),
    );
  }
}


class _Button extends StatelessWidget {
  final GestureTapCallback onTap;
  const _Button({
    required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<BdCommon>().size;
    return SizedBox(
        height: size.height60px,
        child: Row(
          children: [
            Expanded(
              child: BdButtonRippleBasic(
                  padding: EdgeInsets.symmetric(
                      horizontal: size.sized16grid
                  ),
                  onTap: (){
                    context.read<BdCommon>().route.closeDialog(context);
                  },
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(size.dialogCircular)
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '취소',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.error
                        ),
                      ),
                    ),
                  )
              ),
            ),
            Expanded(
              child: BdButtonRippleBasic(
                  padding: context.read<BdCommon>().size.edge.pad0016,
                  onTap: onTap,
                  color:   Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(size.dialogCircular),
                  ),
                  child: Center(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '확인',
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: Theme.of(context).colorScheme.secondaryFixed
                        ),
                      ),
                    ),
                  )
              ),
            ),
          ],
        )
    );
  }
}
