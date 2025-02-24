import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/broad/manager/broad_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/data/user_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BdUiStateTextAppbar extends StatelessWidget {
  const BdUiStateTextAppbar({super.key,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocSelector<BananaRouteCubit, BananaRouteState, UserVO>(
        selector: (state) => state.userVO,
        builder: (context, user) =>
            BdRippleButtonBasic(
              padding: EdgeInsets.symmetric(
                  horizontal: size.sized8grid
              ),
              onTap: (){
                context.read<BroadManager>().mapEvent(context: context, userVO: user);
              },
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text('현재위치', style: TextStyle(color: bananaGreen, fontWeight: FontWeight.w400, fontSize: size.foot),),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        user.mAddDong,
                        style: TextStyle(
                            color: bananaBack,
                            fontWeight: FontWeight.w700,
                            fontSize: size.titleLittle

                        ),
                      ),
                    )
                  ],
                ),
              ),

            )
    );
  }
}


