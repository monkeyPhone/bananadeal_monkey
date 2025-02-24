import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/phone_detail_appbar.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/phone_detail_body.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/widgets/phone_detail/phone_detail_floating_action_button.dart';
import 'package:flutter/material.dart';
import '../../../../../../../css/app_basic_component/bagic_canvas.dart';



class SearchPhoneDetail extends StatelessWidget{
  final int psIdex;
  final String psName;
  const SearchPhoneDetail({
    required this.psName,
    required this.psIdex,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: true,
        body: Column(
          children: [
            PhoneDetailAppBar(psName: psName),
            Expanded(
              child: PhoneDetailBody(psIdex: psIdex,),
            ),
          ],
        ),
        bottomNavigationBar: const SafeArea(child: SizedBox(),),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: PhoneDetailFloatingActionButton(),
    );
  }

}
