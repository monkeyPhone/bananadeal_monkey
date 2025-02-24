import 'package:banana_deal_by_monkeycompany/app/modules/src/pages/store/controllers/store_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../../components/custom_text_form.dart';
import '../../../../../../../../../css/size.dart';
import '../../../../../../../../../models/store/store_list_info.dart';
import '../../../../../../widgets/components/change_map_appbar_icon_button.dart';
import 'helper/store_appbar_search_alert.dart';
import 'helper/sort_button/store_appbar_sort_button.dart';


class StoreAppbar extends GetView<StoreController> {
  final List<Sinfo> store;
  final String storeInput;
  final inputStore;
  final TextEditingController storeText;
  final int rong;
  final List buttonName;
  final int currentButton;
  
  const StoreAppbar({
    required this.store,
    required this.storeInput,
    required this.inputStore,
    required this.storeText,
    required this.rong,
    required this.buttonName,
    required this.currentButton,
    super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // SizedBox(
        //   height: WidgetSize(context).sizedBox8,
        // ),
        SizedBox(
          height: WidgetSize(context).height60px,
          child: Padding(
            padding: WidgetSize(context).paddingBodyWhole,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomTextFormField(
                    onChanged: inputStore, textController: storeText,
                    onFieldSubmitted: inputStore,
                    enabled: store.isNotEmpty ? true : false ,
                    height: WidgetSize(context).sizedBox45,
                    focusNode: controller.focus,
                  ),
                ),
                SizedBox(
                  width: WidgetSize(context).sizedBox30,
                ),
                ChangeMapAppbarIconButton(),
              ],
            ),
          ),
        ),
        SizedBox(height: WidgetSize(context).sizedBox10,),
        StoreAppbarSortButton(rong: rong, buttonName: buttonName, currentButton: currentButton),
        StoreAppbarSearchArea(storeInput: storeInput),
      ],
    );
  }
  

}
