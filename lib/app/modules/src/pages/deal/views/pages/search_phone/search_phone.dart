import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/search_phone/newbie/search_phone_case_newbie.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/deal/views/pages/search_phone/components/search_phone/telecom/search_phone_case_telecom.dart';
import 'package:flutter/material.dart';
import '../../../../../../../css/style.dart';
import 'components/common/search_top_appbar.dart';

class SearchPhone extends StatelessWidget {
  final int routeCase;
  final String agency;
  final int agencyNum;
  const SearchPhone(
      {required this.routeCase,
      required this.agency,
      required this.agencyNum,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Style.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Style.white,
        surfaceTintColor: Style.white,
        toolbarHeight: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Style.white,
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchTopAppbar(),
              Expanded(
                child: routeCase == 0
                        ? SearchPhoneCaseNewBie(routeCase: routeCase, agency: agency, agencyNum: agencyNum)
                        : SearchPhoneCaseTelecom(agencyNum: agencyNum,),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
