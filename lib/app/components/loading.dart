import 'package:banana_deal_by_monkeycompany/app/components/widget_components/stack_loading_bar/basic_loading.dart';
import 'package:flutter/material.dart';
import '../css/size.dart';
import '../css/style.dart';
import '../routes/const_element.dart';
import 'image_provider/asset_image_box.dart';



class Loading2 extends StatelessWidget {
  final String text;
  Loading2({
    required this.text,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: Container(
          color: Style.white,
          width: WidgetSize(context).widthCommon,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BasicLoading(),
              SizedBox(height: WidgetSize(context).height60px,),
              Text(
                text,
                style: TextStyle(
                    fontSize: WidgetSize(context).sizedBox20,
                    color: Style.progressBar,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(height: WidgetSize(context).sizedBox100,),
            ],
          ),
        )),
        SizedBox(height: WidgetSize(context).sizedBox1,)
      ],
    );
  }
}

class DefaultView extends StatelessWidget {
  final String text1;
  final String text2;
  const DefaultView({
    required this.text1,
    required this.text2,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: WidgetSize(context).widthCommon,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //125 95
                AssetImageBox(imageHeight: WidgetSize(context).sizedBox120, imageWidth: WidgetSize(context).sizedBox148, imageUrl: AppElement.defaultList),
                SizedBox(
                  height: WidgetSize(context).height60px,
                ),
                Text(text1,
                  style: TextStyle(
                      fontSize: WidgetSize(context).sizedBox20,
                      fontWeight: FontWeight.w700,
                      color: Style.grey999999
                  ),
                ),
                Text(text2,
                  style: TextStyle(
                      fontSize: WidgetSize(context).sizedBox20,
                      fontWeight: FontWeight.w700,
                      color: Style.grey999999
                  ),
                ),
                SizedBox(
                  height: WidgetSize(context).sizedBox128,
                ),
              ],
            ),
          ),
          SizedBox(height: WidgetSize(context).width0001,),
        ],
      ),
    );
  }
}