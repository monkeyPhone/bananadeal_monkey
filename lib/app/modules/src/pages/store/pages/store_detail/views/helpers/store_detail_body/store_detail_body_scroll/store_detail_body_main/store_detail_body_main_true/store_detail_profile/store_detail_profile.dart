import 'package:banana_deal_by_monkeycompany/app/components/rich_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_profile/store_detail_profile_button_route.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_profile/time/store_detail_profile_time.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_profile/store_detail_richtext.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/pages/store_detail/views/helpers/store_detail_body/store_detail_body_scroll/store_detail_body_main/store_detail_body_main_true/store_detail_profile/store_detail_text.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../../../../models/store/store_detail_info.dart';


class StoreDetailProfile extends StatelessWidget {
  final StoreDetail storeDetail;
  final int? indexs1;
  final int? rong;
  final bool isOpen;
  final String textString;
  const StoreDetailProfile({
    required this.storeDetail,
    required this.indexs1,
    required this.rong,
    required this.isOpen,
    required this.textString,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.scaleDown,
                child: RichTextWidget(
                    list: [
                      (storeDetail.smStoreName == '' ? '- - - - -' :  storeDetail.smStoreName,
                      TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: WidgetSize(context).sizedBox24,
                      )
                      ),
                      ('   ',
                      TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: WidgetSize(context).sizedBox10,
                      )
                      ),
                      ('★',
                      TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.yellow,
                        fontSize: WidgetSize(context).sizedBox22,
                      )
                      ),
                      (' ',
                      TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: WidgetSize(context).sizedBox10,
                      )
                      ),
                      (storeDetail.avgPoint == '' ? '0.0' : storeDetail.avgPoint,
                      TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontSize: WidgetSize(context).sizedBox20,
                      )
                      ),
                    ]
                ),
              ),
            ),
            SizedBox(width: WidgetSize(context).sizedBox8),
           StoreDetailProfileButtonRoute(rong: rong, indexs1: indexs1 ?? null, storeName: storeDetail.smStoreName)
          ],
        ),
        SizedBox(height: WidgetSize(context).sizedBox12),
        ConstrainedBox(
          constraints: BoxConstraints(
              minWidth: 0,
              maxWidth: WidgetSize(context).width0921
          ),
          child: StoreDetailRichText(
            text: storeDetail.smAddress == ''
                ? '자세한 위치는 매장에 직접 문의해주세요.'
                : storeDetail.smAddress,
            maxLines: 2,
            fontWeight: FontWeight.w400,
            fontSize: WidgetSize(context).sizedBox18,
          ),
        ),
        SizedBox(height: WidgetSize(context).sizedBox14,),
        StoreDetailProfileTime(storeDetail: storeDetail, isOpen: isOpen, textString: textString,)
      ],
    );
  }

  

}
