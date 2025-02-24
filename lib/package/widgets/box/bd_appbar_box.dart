import 'package:banana_deal_by_monkeycompany/package/common/bd_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdAppbarBox extends StatelessWidget {
  final Widget child;
  const BdAppbarBox({super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.read<BdCommon>().size.widthCommon,
      height: context.read<BdCommon>().size.sizedAppbar,
      child: child,
    );
  }
}


//magic 이 있으면 size.sizedCategory