import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/etc/views/components/etc_some_inquiry/body/some_infquiry_body.dart';
import 'package:flutter/material.dart';
import '../../../../../../../../css/app_basic_component/bagic_canvas.dart';
import '../etc_some_inquiry_appbar.dart';
import '../etc_some_inquiry_navbar.dart';

class EtcSomeInquiry extends StatelessWidget {
  const EtcSomeInquiry({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
        canPop: true,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            EtcSomeInquiryAppBar(),
            Expanded(
              child: SomeInquiryBody(),
            )
          ],
        ),
        bottomNavigationBar: EtcSomeInquiryNavbar()
    );
  }
}
