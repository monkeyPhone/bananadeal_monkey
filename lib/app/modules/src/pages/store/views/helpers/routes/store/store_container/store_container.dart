import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/views/helpers/routes/store/store_container/store_profile_card/store_profile_card.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/views/helpers/routes/store/store_container/store_thumbnail.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../../components/bookmark_button.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../css/style.dart';
import '../../../../../../../../../models/store/store_list_info.dart';

class StoreContainer extends StatelessWidget {
  final GestureTapCallback onTap;
  final List<Sinfo> store;
  final int index;
  final int rong;
  const StoreContainer({
    required this.onTap,
    required this.store,
    required this.index,
    required this.rong,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Style.white,
      child: InkWell(
        highlightColor: Colors.grey.shade300.withOpacity(0.3),
        splashColor: Colors.grey.shade300.withOpacity(0.3),
          onTap: onTap,
          child: Container(
              padding: WidgetSize(context).paddingStoreList,
              decoration: BoxDecoration(
                color: Colors.transparent,
                  border: Border(
                      bottom: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.greyDDDDDD)
                  )
              ),

              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: WidgetSize(context).sizedBox14,
                  ),
                  Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          StoreThumbNailCard(store: store, index: index),
                          SizedBox(width: WidgetSize(context).sizedBox14,),
                          StoreProFileCard(store: store, index: index, rong: rong),
                        ],
                      ),
                      Positioned(
                          top: 0,
                          right: 0,
                          child:  BookmarkButton(
                              rong: rong, index: index,
                            storeName: store[index].smStoreName,
                          ))
                    ],
                  ),
                  SizedBox(height: WidgetSize(context).sizedBox10,),
                  Container(
                      width: WidgetSize(context).widthCommon,
                      decoration: BoxDecoration(
                          border: Border.all(color: Style.yellow, width: WidgetSize(context).sizedBox1),
                          borderRadius: BorderRadius.circular(999)
                      ),
                      padding: EdgeInsets.all(WidgetSize(context).sizedBox8),
                      child:RichText(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        textAlign: TextAlign.start,
                        text: TextSpan(
                            text:
                            store[index].smStoreIntroduce == '' ? '' : store[index].smStoreIntroduce,
                            style: TextStyle(
                                color: store[index].smStoreIntroduce == '' ? Style.greyWrite : Style.blackWrite,
                                fontWeight: FontWeight.w400, fontSize: WidgetSize(context).sizedBox12)
                        ),
                      ),
                    ),

                  SizedBox(height: WidgetSize(context).sizedBox16,)
                ],
              )
          ),
        ),
    );
  }

 

  

}
