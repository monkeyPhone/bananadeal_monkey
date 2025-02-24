import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../css/size.dart';
import '../../../../css/style.dart';
import '../../controllers/deep_link_store_controller.dart';


class GuestStoreProfile extends StatelessWidget {

  const GuestStoreProfile({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DeepLinkStoreController>(
      builder: (controller){
        bool isOpen = controller.makeTime();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          minWidth: 0,
                          maxWidth: WidgetSize(context).sizedBox200
                      ),
                      child: RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text:
                          controller.storeDetail.value.smStoreName == '' ? '- - - - -' :  controller.storeDetail.value.smStoreName,
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                            fontSize: WidgetSize(context).sizedBox24,
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
            SizedBox(height: WidgetSize(context).sizedBox12),
            ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: 0,
                  maxWidth: WidgetSize(context).width0921
              ),
              child: RichText(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.start,
                text: TextSpan(
                  text:
                  controller.storeDetail.value.smAddress == ''
                      ? '자세한 위치는 매장에 직접 문의해주세요.'
                      : controller.storeDetail.value.smAddress
                  ,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    fontSize: WidgetSize(context).sizedBox18,
                  ),
                ),
              ),
            ),
            SizedBox(height: WidgetSize(context).sizedBox14,),
            controller.storeDetail.value.smTimeStart == '' || controller.storeDetail.value.smTimeEnd == ''
                ?
            _greyTextB('상담시간 확인불가', context)
                :
            Row(
              children: [
                Icon(Icons.access_time_outlined, size: WidgetSize(context).width004, color: Style.grey666666,),
                _pad05(context),
                _pad05(context),
                _greyText('${controller.storeDetail.value.smTimeStart}', context),
                _pad05(context),
                _greyText('~', context),
                _pad05(context),
                _greyText('${controller.storeDetail.value.smTimeEnd}', context),
                _pad2(context),
                isOpen
                    ? _brownText('지금 상담 가능', context)
                    : _greyTextB('상담 종료', context)
              ],
            )
          ],
        );
      },
    );
  }

  Widget _pad2(BuildContext context){
    return SizedBox(width: WidgetSize(context).width002,);
  }

  Widget _pad05(BuildContext context){
    return SizedBox(width: WidgetSize(context).sizedBox2,);
  }

  Widget _brownText(String text, BuildContext context){
    return Text(text,
      style: TextStyle(fontSize: WidgetSize(context).sizedBox12, fontWeight: FontWeight.w700, color: Style.brown),);
  }

  Widget _greyTextB(String text, BuildContext context){
    return Text(text,
      style: TextStyle(fontSize: WidgetSize(context).sizedBox12, fontWeight: FontWeight.w700, color: Style.ultimateGrey),);
  }

  Widget _greyText(String text, BuildContext context){
    return Text(text,
      style: TextStyle(fontSize: WidgetSize(context).sizedBox12, fontWeight: FontWeight.w400, color: Style.grey999999),);
  }

}