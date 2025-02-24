import 'package:flutter/material.dart';
import '../../../../../../../../../../css/size.dart';
import '../../../../../../../../../../css/style.dart';



class StoreAppbarSearchArea extends StatelessWidget {
  final String storeInput;
  const StoreAppbarSearchArea({
    required this.storeInput,
    super.key});

  @override
  Widget build(BuildContext context) {
    return storeInput != ''
        ?
    Padding(
      padding: EdgeInsets.only(left: WidgetSize(context).sizedBox16, bottom: WidgetSize(context).sizedBox8),
      child: Column(
        children: [
          SizedBox(height: WidgetSize(context).sizedBox8,),
          Row(
            children: [
              _searchText(text: "'${storeInput}' ", fontWeight: FontWeight.w700, context: context),
              _searchText(text: '검색 결과 ', fontWeight: FontWeight.w400, context: context),
            ],
          ),
        ],
      ),
    )
        :
    const SizedBox();
  }

  Widget _searchText({required text, required fontWeight, required BuildContext context}){
    return Text(text,
      style: TextStyle(
          fontSize: WidgetSize(context).sizedBox14,
          color: Style.blackWrite,
          fontWeight: fontWeight
      ),
    );
  }

}
