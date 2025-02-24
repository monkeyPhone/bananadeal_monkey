import 'package:banana_deal_by_monkeycompany/app/components/default_banana.dart';
import 'package:banana_deal_by_monkeycompany/app/components/loading/home_loading_bar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/controllers/deal_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/components/bd_list/bd_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../components/loading.dart';
import '../../../../../models/nav/deal/deal_status.dart';
import '../../../src_components/controllers/src_deal_controller.dart';
import 'components/bd_list_empty.dart';
import 'components/deal_appbar.dart';


class DealView extends GetView<DealController> {
  const DealView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DealAppbar(),
        Expanded(
          child: GetBuilder<SrcDealController>(
                  builder: (cnt) =>
                  Stack(
                    children: [
                      cnt.dealStatusNumber.value >= 500
                          ? DefaultBanana(
                          onPressed: () async{
                            await controller.clickRefresh(context, true);
                          }
                      )
                          :
                      cnt.dealList.isNotEmpty
                          ? BdList(
                              dealStatus: List<DealStatusList>.generate(cnt.dealList.length, (index) => cnt.dealList[index]).toList(),
                              dealStatusLength: cnt.dealList.length,
                              scrollController: cnt.sController,
                              isLoading: cnt.loading.value,
                            )
                          : cnt.dealList.isNotEmpty
                              ? BdListEmpty()
                              : const DefaultView(text1: '등록된 딜이 없어요.', text2: '+ 버튼을 눌러 새로운 딜을 시작해보세요!',),
                      _Loading(isLoading: cnt.loading.value,)
                    ],
                  ),
          ),
        ),
      ],
    );
  }
}


class _Loading extends StatelessWidget {
  final bool isLoading;
  const _Loading({
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? HomeLoadingBar()
        : SizedBox();
  }
}
