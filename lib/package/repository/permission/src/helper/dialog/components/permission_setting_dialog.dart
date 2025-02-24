import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_deal.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PermissionSettingsDialog extends StatelessWidget {
  final List<String> permission;
  final int sdkVersion;
  final GestureTapCallback cancelTap;
  final GestureTapCallback confirmTap;

  const PermissionSettingsDialog({super.key,
    required this.permission,
    required this.sdkVersion,
    required this.cancelTap,
    required this.confirmTap,

  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Dialog(
      backgroundColor: white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(size.dialogCircular))
      ),
      child: Container(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(size.sizedBox16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('필수권한 허용 안내',
                    style: TextStyle(
                        color: blackWrite,
                        fontWeight: FontWeight.w700,
                        fontSize: size.sizedBox19),
                    maxLines: 2,
                    textAlign: TextAlign.start,
                  ),
                  const BdCustomPad(padEnum: PadEnum.height8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '아래와 같은 이유로 권한 허용이 필요합니다.',
                        style: TextStyle(
                            color: blackWrite,
                            fontWeight: FontWeight.w400,
                            fontSize: size.sizedBox17
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const BdCustomPad(padEnum: PadEnum.height16),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(permission.length,
                                (index) =>
                            permission[index] == ''
                                ? const SizedBox()
                                :
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(' · ',
                                      style: TextStyle(
                                          color: blackWrite,
                                          fontWeight: FontWeight.w400,
                                          fontSize: size.sizedBox17
                                      ),
                                      textAlign: TextAlign.start,
                                    ),
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          switch(permission[index]){
                                            permissionNoti => '알림',
                                            permissionLocation => '위치',
                                            permissionPhoto => sdkVersion == 0 || sdkVersion >= 33 ? '사진' : '저장소',
                                            permissionCamera => '카메라',
                                            _ => ''
                                          },
                                          style: TextStyle(
                                              color: blackWrite,
                                              fontWeight: FontWeight.w400,
                                              fontSize: size.sizedBox17
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                        SizedBox(
                                          height: size.sizedBox4,
                                        ),
                                        Text(
                                          permission[index],
                                          style: TextStyle(
                                              color: blackWrite,
                                              fontWeight: FontWeight.w400,
                                              fontSize: size.sizedBox17
                                          ),
                                          textAlign: TextAlign.start,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                const BdCustomPad(padEnum: PadEnum.height8),
                              ],
                            )
                        ),
                      )
                    ],
                  ),
                ],),
            ),
            Container(
              color: Colors.transparent,
              height: size.sizedBox57,
              child: Row(
                children: [
                  Expanded(
                      child: BdRippleButtonBasic(
                          onTap: cancelTap,
                          borderRadius:  BorderRadius.only(
                              bottomLeft: Radius.circular(size.dialogCircular)
                          ),
                          border: Border(
                            top: BorderSide(
                              width: size.sizedBox1_5,
                              color: greyEAEAEA,
                            ),
                            right: BorderSide(
                              width: size.sizedBox1_5,
                              color: greyEAEAEA,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '닫기',
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.sizedBox17
                              ),
                            ),
                          )
                      )

                  ),
                  Expanded(
                      child: BdRippleButtonBasic(
                          onTap: confirmTap,
                          borderRadius: BorderRadius.only(
                              bottomRight: Radius.circular(size.dialogCircular)
                          ),
                          border: Border(
                            top: BorderSide(
                              width: size.sizedBox1_5,
                              color: greyEAEAEA,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '설정',
                              style: TextStyle(
                                  color: Colors.lightBlue,
                                  fontWeight: FontWeight.w500,
                                  fontSize: size.sizedBox17
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
      ),
    );
  }
}