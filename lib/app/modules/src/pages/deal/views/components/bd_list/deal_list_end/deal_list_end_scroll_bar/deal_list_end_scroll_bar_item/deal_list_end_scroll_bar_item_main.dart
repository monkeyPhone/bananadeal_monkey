import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/components/bd_list/deal_list_end/deal_list_end_scroll_bar/deal_list_end_scroll_bar_item/deal_list_end_scroll_bar_item_main_image_area.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/components/bd_list/deal_list_textarea.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../models/nav/deal/deal_status.dart';

class DealListEndScrollBarItemMain extends StatelessWidget {
  final List<DealStatusList>  dealStatus;
  final int index;
  final GestureTapCallback onTap;
  const DealListEndScrollBarItemMain({
    required this.dealStatus,
    required this.index,
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        margin: EdgeInsets.only(bottom: WidgetSize(context).sizedBox34),
        width: WidgetSize(context).widthCommon,
        height: WidgetSize(context).sizedBox136,
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: WidgetSize(context).sizedBox5,
                  horizontal: WidgetSize(context).sizedBox8
              ),
              height: WidgetSize(context).sizedBox121,
              width: WidgetSize(context).sizedBox119,
              decoration: BoxDecoration(
                  color: Style.white,
                  border: Border.all(
                    color: Style.greyD7D7D7,
                    width: WidgetSize(context).sizedBox1,
                  ),
                  borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox15)
              ),
              child: DealListEndScrollBarItemMainImageArea(
                dealStatus: dealStatus,
                index: index,
              )
            ),
            SizedBox(width: WidgetSize(context).sizedBox15,),
            Container(
              color: Colors.transparent,
              padding: EdgeInsets.symmetric(
                horizontal: WidgetSize(context).sizedBox5,
                vertical: WidgetSize(context).sizedBox8,
              ),
              height: WidgetSize(context).sizedBox121,
              width: WidgetSize(context).sizedBox119*2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DealListTextArea(
                    text:
                    dealStatus[index].diHopePhone,
                    style22: TextStyle(
                        fontSize: WidgetSize(context).sizedBox22,
                        fontWeight: FontWeight.w700,
                        color: Style.grey999999
                    ),
                    style18: TextStyle(
                        fontSize: WidgetSize(context).sizedBox18,
                        fontWeight: FontWeight.w700,
                        color: Style.grey999999
                    ),
                  ),

                  Row(
                    children: [
                      Text('받은 딜  ', style: TextStyle(
                          fontSize: WidgetSize(context).sizedBox18,
                          fontWeight: FontWeight.w700,
                          color: Style.grey999999
                      ),),
                      Text(dealStatus[index].diEstimateCnt.toString(), style: TextStyle(
                          fontSize: WidgetSize(context).sizedBox18,
                          fontWeight: FontWeight.w700,
                          color: Style.grey999999
                      ),),
                      Text('건 ', style: TextStyle(
                          fontSize: WidgetSize(context).sizedBox18,
                          fontWeight: FontWeight.w700,
                          color: Style.grey999999
                      ),),
                    ],
                  ),

                ],
              ),
            ),
            Expanded(
                child: Center(
                  child: Icon(Icons.arrow_forward_ios, color: Style.grey999999, size: WidgetSize(context).sizedBox22,),
                )
            )
          ],
        ),
      ),
    );
  }
}
