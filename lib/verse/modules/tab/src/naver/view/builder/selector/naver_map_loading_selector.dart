import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/naver/state/bloc/banana_naver_map/banana_naver_map_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/naver/view/widgets/components/naver_map_positioned_icon_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NaverMapIconSelector extends StatelessWidget {

  const NaverMapIconSelector({super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaNaverMapBloc, BananaNaverMapState, bool>(
        selector: (state) => state.isInit,
        builder: (context, isInit) =>
            switch(isInit){
              true => const NaverMapPositionedIconView(),
              false => const SizedBox(),
            },
    );
  }
}

class NaverMapLoadingSelector extends StatelessWidget {
  const NaverMapLoadingSelector({super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaNaverMapBloc, BananaNaverMapState, bool>(
      selector: (state) => state.isInit,
      builder: (context, isInit) =>
      switch(isInit){
        false => Positioned.fill(
            child: Container(
              color: Colors.black54,
            )
        ),
        true => const SizedBox(),
      },
    );
  }
}




