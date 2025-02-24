import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../components/image_provider/image_providers.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../models/store/store_list_info.dart';
import '../../../../../../../../../routes/api_url.dart';
import '../../../../../../../../../routes/const_element.dart';


class StoreThumbNailCard extends StatelessWidget {
  final List<Sinfo> store;
  final int index;
  const StoreThumbNailCard({
    required this.store,
    required this.index,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox15)
      ),
      elevation: WidgetSize(context).sizedBox3,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox15),
          child: ImageProviders(
              imageBorder: Border.all(
              width:  WidgetSize(context).sizedBox1,
              color: Style.greyC4C4C4
              ),
              imageRadius: WidgetSize(context).sizedBox15,
              imageWidth: WidgetSize(context).sizedBox114,
              imageHeight: WidgetSize(context).sizedBox114,
              imageUrl: ApiConsole.imageBananaUrl+store[index].smPathImg0,
              errUrl: AppElement.defaultStore,
              imageLabel: AppElement.caseThumb
          )

      ),
    );
  }
}
