import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/manager/info_user_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/state/bloc/banana_info_user/banana_info_user_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/view/widgets/body/profile/form/info_user_profile_form_area_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/src/info/info_user/view/widgets/body/profile/image_area/info_user_profile_image_area_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_view_insets.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_top_text_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class InfoUserProfileView extends StatelessWidget {
  const InfoUserProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        BdTopTextArea(
          size: context.read<VerseConfig>().size,
          text2: '자신을 표현해보세요.',
          text3: '바나나딜에서 사용할 이미지와 닉네임을 설정해주세요.',
        ),
        const _InputArea()
      ],
    );
  }
}

class _InputArea extends StatelessWidget {
  const _InputArea();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocSelector<BananaInfoUserBloc, BananaInfoUserState, bool>(
        selector: (state) => state.isCrop,
        builder: (context, isCrop) =>
            Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    BdLayoutViewInsets(
                        child: Column(
                          children: [
                            SizedBox(
                              width: size.widthCommon,
                              height: size.sizedBox34,),
                            const InfoUserProfileImageAreaView(),
                          ],
                        )
                    ),
                    switch(isCrop){
                      true => SizedBox(
                        height: size.sizedBox200,
                      ),
                      false => const InfoUserProfileFormAreaView()
                    }
                  ],
                ),
                _ProfilePositioned(
                  isCrop: isCrop,
                )
              ],
            )
    );
  }
}


class _ProfilePositioned extends StatelessWidget {
  final bool isCrop;
  const _ProfilePositioned({required this.isCrop});

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: context.read<VerseConfig>().size.sizedBox128,
        right: 0,
        child: isCrop
            ? const _CropButton()
            : const SizedBox()
    );
  }
}


class _CropButton extends StatelessWidget {
  const _CropButton();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      padding: EdgeInsets.only(
          top: size.sizedBox8,
          right: size.sizedBox8,
          left: size.sizedBox8
      ),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(size.sizedBox8)
      ),
      child: Column(
          children: List.generate(
              4, (index) =>

          switch(index){
            0 =>
            const SizedBox(),
            _ =>
                BdRippleButtonBasic(
                    width: size.sizedBox181,
                    height: size.sizedBox40+size.sizedBox5,
                    boxShadow: const [
                      BoxShadow(
                          color: ultimateGrey,
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(1,1)
                      )
                    ],
                    padding: EdgeInsets.symmetric(vertical: size.sizedBox3, horizontal: size.sizedBox10),
                    margin: EdgeInsets.only(bottom: size.sizedBox8),
                    onTap: (){
                      context.read<InfoUserManager>().thumbNailFetchEvent(context: context, index: index);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          switch(index){
                            1 => '사진 보관함',
                            2 => '사진 찍기',
                            3 => '삭제하기',
                            _ => ''
                          },
                          style: TextStyle(
                              fontSize: size.sizedBox18,
                              color: switch(index){
                                3 => Colors.redAccent,
                                _ => blackWrite
                              },
                              fontWeight: FontWeight.normal
                          ),
                        ),
                        SizedBox(width: size.sizedBox40,),
                        Icon(
                          switch(index){
                            1 => Icons.image_outlined,
                            2 => Icons.camera_alt_outlined,
                            3 => Icons.delete_outline_outlined,
                            _ => Icons.image
                          },
                          color: switch(index){
                            3 => Colors.redAccent,
                            _ => blackWrite
                          },
                          size: size.sizedBox28,
                        )
                      ],
                    )
                )
          }
          )
      ),
    );
  }
}