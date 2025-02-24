import 'package:banana_deal_by_monkeycompany/app/components/widget_components/ripple_button/ripple_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/helper/rank_index_stack/rank_index_stack_list_icon_button.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/helper/rank_index_stack/rank_index_stack_list_inkwell.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/widgets/rank_phone_page/helper/rank_index_stack/rank_index_stack_list_rich_text.dart';
import 'package:banana_deal_by_monkeycompany/app/routes/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../css/size.dart';
import '../../../../../../../css/style.dart';
import '../../../../../../../managers/device_manager.dart';
import '../../../../../../../models/rank/rank_list.dart';
import '../../../../../../../routes/const_element.dart';
import '../../../../deal/controllers/search_phone_controllers/search_phone_detail_controller.dart';
import '../../../../deal/views/pages/search_phone/search_phone_detail.dart';

class RankIndexStackListColumn extends StatelessWidget {
  final List<Rankinfo> ranks;
  const RankIndexStackListColumn({
    required this.ranks,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(ranks.length,
              (index) =>
                  ranks[index].piPath != ''
                    ? Container(
                    margin: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox2*3,),
                    key: UniqueKey(),
                    width: WidgetSize(context).widthCommon,
                    height: WidgetSize(context).sizedBox77,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                width: WidgetSize(context).sizedBox1,
                                color: Style.greyD7D7D7))),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                RippleImageButton(
                                    image: ImageProviders(
                                        imageWidth: WidgetSize(context).height60px,
                                        imageHeight: WidgetSize(context).height60px,
                                        imageUrl: '${ApiConsole.monkeyImageUrl}${ranks[index].piPath}',
                                        errUrl: AppElement.defaultPhone,
                                        imageLabel: AppElement.caseHeight
                                    ),
                                    onTap: () async{
                                      await DeviceManager.overLayClients();
                                      Get.to(
                                              () => SearchPhoneDetail(
                                              psIdex: ranks[index].psIdx,
                                              psName: ranks[index].psName
                                          ), binding: BindingsBuilder(() {
                                        Get.put(SearchPhoneDetailController());
                                      })
                                      );
                                    }
                                ),
                                SizedBox(width: WidgetSize(context).sizedBox12,),
                                SizedBox(
                                  width: WidgetSize(context).sizedBox170,
                                  height: WidgetSize(context).height60px,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        RankIndexStackListRichText(rank: ranks[index],),
                                      ],
                                    )),
                              ],
                            ),
                            //이거 뭔지 찾아야됨
                            Row(
                              children: [
                                SizedBox(width: WidgetSize(context).sizedBox12,),
                                RankIndexStackListIconButton(rank: ranks, index: index),
                                SizedBox(width: WidgetSize(context).sizedBox12,),
                                RankIndexStackListInkWell(rank: ranks[index],),
                              ],
                            )
                          ],
                        ),

                      ],
                    ),
                  )
                      : SizedBox()
      ).toList(),
    );
  }
}
