import 'package:banana_deal_by_monkeycompany/app/components/rich_text_widget.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/views/helpers/routes/store/store_container/store_profile_card/store_profile_card_range.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../../../../../models/store/store_list_info.dart';


class StoreProFileCard extends StatelessWidget {
  final List<Sinfo> store;
  final int index;
  final int rong;
  const StoreProFileCard({
    required this.store,
    required this.index,
    required this.rong,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,

      padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Container(
               color: Colors.transparent,
               constraints: BoxConstraints(
                 maxWidth: WidgetSize(context).sizedBox165,
                 maxHeight: double.infinity
               ),
               child: RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    textAlign: TextAlign.start,
                    text: TextSpan(
                      text:
                      store[index].smStoreName,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: WidgetSize(context).sizedBox18,
                      ),
                    ),
                  ),
             ),

              SizedBox(width: WidgetSize(context).sizedBox8,),
              StoreProfileCardRange(store: store, index: index)
            ],
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox9,
          ),
          RichTextWidget(
              list: [
                (
                '참여',
                TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: WidgetSize(context).sizedBox14,
                    color: Style.greyTextButton
                )
                ),
                ('  ',
                TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: WidgetSize(context).sizedBox10,
                )
                ),
                ('${store[index].sendDeal}건/${store[index].inviteDeal}건',
                TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: WidgetSize(context).sizedBox14,
                )
                ),
                (' ',
                TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: WidgetSize(context).sizedBox10,
                )
                ),
                (
                '${(double.parse(store[index].participation)*100).ceil()}%',
                TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: WidgetSize(context).sizedBox12,
                    color: Style.greyTextButton
                )
                )
              ]
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox4,
          ),
          RichTextWidget(
              list: [
                (
                '수락',
                TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: WidgetSize(context).sizedBox14,
                    color: Style.greyTextButton
                )
                ),
                ('  ',
                TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: WidgetSize(context).sizedBox10,
                )
                ),
                ('${store[index].openDeal}건',
                TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: WidgetSize(context).sizedBox14,
                )
                ),
              ]
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox4,
          ),
          RichTextWidget(
              list: [
                (
                '후기',
                TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: WidgetSize(context).sizedBox14,
                    color: Style.greyTextButton
                )
                ),
                ('  ',
                TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: WidgetSize(context).sizedBox10,
                )
                ),
                ('${store[index].reviewCnt}건',
                TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: WidgetSize(context).sizedBox14,
                )
                ),
              ]
          ),
          SizedBox(
            height: WidgetSize(context).sizedBox4,
          ),
          RichTextWidget(
              list: [
                (
                '평점',
                TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: WidgetSize(context).sizedBox14,
                    color: Style.greyTextButton
                )
                ),
                ('  ',
                TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: WidgetSize(context).sizedBox8,
                )
                ),
                ('★',
                TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.yellow,
                  fontSize: WidgetSize(context).sizedBox14,
                )
                ),
                (' ',
                TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: WidgetSize(context).sizedBox5,
                )
                ),
                (store[index].avgPoint == '' ? '0.0' : store[index].avgPoint,
                TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                  fontSize: WidgetSize(context).sizedBox14,
                )
                ),
              ]
          ),
        ],
      ),
    );
  }
}
