import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../managers/device_manager.dart';
import '../../../../../../../../../../../routes/const_element.dart';
import '../../../../../../../../deal/controllers/search_phone_controllers/search_phone_detail_controller.dart';
import '../../../../../../../../deal/views/pages/search_phone/search_phone_detail.dart';


class HomeRankList extends StatelessWidget {
  final String imageSrc;
  final int idx;
  final String description;
  final double fontSzie;
  final GestureTapCallback onPressed;
  const HomeRankList({
    Key? key,
    required this.imageSrc,
    required this.idx,
    required this.description,
    required this.onPressed,
    required this.fontSzie
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  RippleImageButton(
                    image: ImageProviders(
                        imageWidth: WidgetSize(context).sizedBox110,
                        imageHeight: WidgetSize(context).sizedBox110,
                        imageUrl: imageSrc,
                        errUrl: AppElement.defaultPhone,
                        imageLabel: AppElement.caseHeight
                    ),
                    onTap: () async{
                      await DeviceManager.overLayClients();
                      Get.to(
                              () => SearchPhoneDetail(
                                  psIdex: idx,
                                  psName: description
                              ),
                          binding: BindingsBuilder(
                                  () {
                                    Get.put(SearchPhoneDetailController());
                                    }
                                  )
                      );
                    },
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox6_5),
                child: Container(
                  color: Style.white,
                  width: WidgetSize(context).sizedBox96,
                  height: WidgetSize(context).sizedBox34,
                  child: Center(
                    child: RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      text: TextSpan(
                          text:
                          description,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                            fontSize: fontSzie
                          ),
                      ),
                    ),
                  ),
                ),
              ),

              RippleDecorationButton(
                  onTap: onPressed,
                  color: Style.yellow,
                  borderRadius: BorderRadius.circular(999),
                  width: WidgetSize(context).sizedBox100,
                  height: WidgetSize(context).sizedBox28,
                  widget: Center(
                    child: Text('딜 만들기', style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Style.brown,
                      fontSize: WidgetSize(context).sizedBox12,
                    ),),
                  )
              )
            ],
          ),
        ),
      ],
    );
  }

}
