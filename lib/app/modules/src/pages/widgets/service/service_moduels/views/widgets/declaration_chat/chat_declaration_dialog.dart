import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../../../../dialog/type/declaration_chat_dialog_page.dart';
import '../../../controllers/chat_declaration_controller.dart';

class ChatDeclarationDialog{
  void openDeclarationDialog(BuildContext routerContext){
    Get.to(()=> DeclarationChatPage(),
        binding: BindingsBuilder(() {
          Get.put(ChatDeclarationController());
        })
    );
    // Future.delayed(Duration.zero,
    //     (){
    //       showDialog(
    //           barrierDismissible: false,
    //           context: routerContext,
    //           builder: (BuildContext context)=>
    //               Dialog(
    //                 shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.all(Radius.circular(WidgetSize(context).sizedBox12))
    //                 ),
    //                 child: GetX<ChatDeclarationController>(
    //                     init: ChatDeclarationController(),
    //                     builder: (controller) {
    //                       Widget _dialogTopTextCancleIcon(){
    //                         return Row(
    //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                           crossAxisAlignment: CrossAxisAlignment.end,
    //                           children: [
    //                             Text('신고하기', style: TextStyle(
    //                                 fontSize: WidgetSize(context).sizedBox24,
    //                                 fontWeight: FontWeight.w700,
    //                                 color: Style.blackWrite
    //                             ),
    //                             ),
    //                             GestureDetector(
    //                               onTap: (){
    //                                 controller.initDeclaration();
    //                                 Get.back();
    //                               },
    //                               child: Icon(Icons.close, color: Style.blackWrite, size: WidgetSize(context).sizedBox28,),
    //                             )
    //                           ],
    //                         );
    //                       }
    //                       Widget _dialogNameArea(){
    //                         return Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Text("'${controller.nickName.value}'",
    //                               style: TextStyle(color: Style.red, fontWeight: FontWeight.w700, fontSize: WidgetSize(context).sizedBox18),
    //                             ),
    //                             Text('${controller.text.value}', style: TextStyle(
    //                                 fontSize: WidgetSize(context).sizedBox18,
    //                                 fontWeight: FontWeight.w700,
    //                                 color: Style.blackWrite
    //                             ),
    //                             ),
    //                           ],
    //                         );
    //                       }
    //
    //                       Future modalOnTap() {
    //                         final ScrollController _firstController = ScrollController();
    //                         return showModalBottomSheet(
    //                             isDismissible: true,
    //                             context: context,
    //                             isScrollControlled: true,
    //                             builder: (context) {
    //                               return Container(
    //                                 color: Style.white,
    //                                 child: SafeArea(
    //                                   child: Container(
    //                                     child: Container(
    //                                       height: Get.width*0.156*controller.items.length,
    //                                       child: Scrollbar(
    //                                         thumbVisibility: true,
    //                                         controller: _firstController,
    //                                         child: ListView(
    //                                           controller: _firstController,
    //                                           children: [
    //                                             Column(
    //                                               mainAxisSize: MainAxisSize.min,
    //                                               mainAxisAlignment: MainAxisAlignment.center,
    //                                               crossAxisAlignment: CrossAxisAlignment.start,
    //                                               children: List.generate(
    //                                                   controller.items.length,
    //                                                       (index) => InkWell(
    //                                                     onTap: () {
    //                                                       controller.dropdownValue.value = controller.items[index];
    //                                                       Navigator.pop(context);
    //                                                     },
    //                                                     child: Container(
    //                                                       height: Get.width * 0.156,
    //                                                       decoration: BoxDecoration(
    //                                                         border: Border(
    //                                                             bottom: BorderSide(
    //                                                                 width: Get.width * 0.0025,
    //                                                                 color: Style.greyDDDDDD)),
    //                                                       ),
    //                                                       child: Center(
    //                                                           child: Text(
    //                                                             controller.items[index],
    //                                                             style: TextStyle(
    //                                                                 color: Style.blackWrite,
    //                                                                 fontWeight: FontWeight.w400,
    //                                                                 fontSize: Get.width * 0.0326),
    //                                                           )),
    //                                                     ),
    //                                                   )),
    //                                             ),
    //                                           ],
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ),
    //                                 ),
    //                               );
    //                             });
    //                       }
    //
    //                       Widget _dialogModalSelectReason(){
    //                         return GestureDetector(
    //                           onTap: () async{
    //                             await modalOnTap();
    //                           },
    //                           child: Container(
    //                               height: WidgetSize(context).height60px,
    //                               width: WidgetSize(context).widthCommon,
    //                               decoration: BoxDecoration(
    //                                   color: Style.white,
    //                                   borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox8),
    //                                   border: Border.all(width: WidgetSize(context).sizedBox1, color:
    //                                   controller.dropdownValue.value == ''
    //                                       ? Style.greyCCCCCC
    //                                       : Style.yellow)
    //                               ),
    //                               child: Container(
    //                                 padding: EdgeInsets.all(WidgetSize(context).sizedBox3),
    //                                 height: WidgetSize(context).sizedBox45,
    //                                 width: WidgetSize(context).widthCommon,
    //                                 child: Container(
    //                                     padding: EdgeInsets.symmetric(horizontal: WidgetSize(context).sizedBox4),
    //                                     color: Style.white,
    //                                     child: Row(
    //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                                       children: [
    //                                         Text(
    //                                           controller.dropdownValue.value == ''
    //                                               ? '신고하는 이유를 선택해주세요 (필수)'
    //                                               :  controller.dropdownValue.value
    //                                           , style: TextStyle(
    //                                             color:
    //                                             controller.dropdownValue.value == ''
    //                                                 ? Style.grey999999
    //                                                 : Style.blackWrite, fontSize: WidgetSize(context).sizedBox14, fontWeight: FontWeight.w400),),
    //                                         Icon(Icons.arrow_drop_down, color: Style.yellow, size: WidgetSize(context).sizedBox34,)
    //                                       ],
    //                                     )),
    //                               )
    //                           ),
    //                         );
    //                       }
    //
    //                       Widget _dialogTextField(){
    //                         return TextField(
    //                           onChanged: controller.inputDeclaration,
    //                           focusNode: controller.focus,
    //                           style: TextStyle(fontSize: WidgetSize(context).sizedBox14, color: Style.blackWrite),
    //                           keyboardType: TextInputType.multiline,
    //                           maxLines: 8,
    //                           maxLength: 1000,
    //                           cursorColor: Style.ultimateGrey,
    //                           decoration: InputDecoration(
    //                               hintStyle: TextStyle(fontSize: WidgetSize(context).sizedBox14, color: Style.grey999999),
    //                               hintText: '상세하게 적어주세요 (선택사항)',
    //                               focusedBorder: OutlineInputBorder(
    //                                   borderSide: BorderSide(width: WidgetSize(context).sizedBox1, color: Style.ultimateGrey)
    //                               ),
    //                               enabledBorder: OutlineInputBorder(
    //                                   borderSide:  BorderSide(width: WidgetSize(context).sizedBox1, color:
    //                                   controller.declarationInput.value == ''
    //                                       ? Style.greyCCCCCC
    //                                       : Style.yellow
    //                                   )
    //                               )
    //                           ),
    //                         );
    //                       }
    //
    //                       Widget _defaultImage(){
    //                         return Center(
    //                           child: SvgPicture.asset(
    //                             AppElement.defaultImgIcon,
    //                             fit: BoxFit.fitHeight,
    //                             colorFilter: ColorFilter.mode(Style.greyCCCCCC, BlendMode.srcIn),
    //                             // color: ,
    //                           ),
    //                         );
    //                       }
    //
    //                       Widget _imageArea(int index) {
    //                         return controller.imagePath[index] == null
    //                             ?
    //                         GestureDetector(
    //                             onTap:  (){
    //                               controller.focus.unfocus();
    //                               controller.switchRouteCaseUpload(index);
    //                             },
    //                             child: Container(
    //                               margin: EdgeInsets.only(right: WidgetSize(context).sizedBox16),
    //                               padding: EdgeInsets.all(WidgetSize(context).sizedBox16),
    //                               width: controller.imageSize,
    //                               height: controller.imageSize,
    //                               decoration: BoxDecoration(
    //                                   border: Border.all(width: WidgetSize(context).sizedBox1, color: Style.greyCCCCCC)
    //                               ),
    //                               child: _defaultImage(),
    //                             )
    //                         ) : GestureDetector(
    //                           onTap: (){
    //                             controller.switchRouteCaseDelete(
    //                                 context: context,
    //                                 index:index
    //                             );
    //                           },
    //                           child: Container(
    //                             margin: EdgeInsets.only(right: WidgetSize(context).sizedBox16),
    //                             width: controller.imageSize,
    //                             height: controller.imageSize,
    //                             child: Image.file(File(controller.imagePath[index]!.path), fit: BoxFit.cover,),
    //                           ),
    //                         );
    //
    //                       }
    //
    //                       return GestureDetector(
    //                         onTap: controller.focus.unfocus,
    //                         child: Container(
    //                           decoration: BoxDecoration(
    //                               color: Style.white,
    //                               borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox12)
    //                           ),
    //
    //                           padding: EdgeInsets.symmetric(
    //                               horizontal: WidgetSize(context).sizedBox16,
    //                               vertical: WidgetSize(context).sizedBox20
    //                           ) ,
    //                           child: SingleChildScrollView(
    //                             child: Column(
    //                               mainAxisAlignment: MainAxisAlignment.start,
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 _dialogTopTextCancleIcon(),
    //                                 SizedBox(
    //                                   height: WidgetSize(context).sizedBox24,
    //                                 ),
    //                                 _dialogNameArea(),
    //                                 SizedBox(height: WidgetSize(context).sizedBox14,),
    //                                 _dialogModalSelectReason(),
    //                                 SizedBox(height: WidgetSize(context).sizedBox14,),
    //                                 _dialogTextField(),
    //                                 SizedBox(height: WidgetSize(context).sizedBox14,),
    //                                 SingleChildScrollView(
    //                                   scrollDirection: Axis.horizontal,
    //                                   child: Row(
    //                                     children: List.generate(3, (index) =>
    //                                         _imageArea(index)
    //                                     ),
    //                                   ),
    //                                 ),
    //                                 SizedBox(height: WidgetSize(context).sizedBox20,),
    //                                 controller.declarationNoti.value != 0
    //                                     ?
    //                                 Container(
    //                                   decoration: BoxDecoration(
    //                                     borderRadius: BorderRadius.circular(Get.width),
    //                                     color: Style.ultimateGrey,
    //                                   ),
    //                                   width: Get.width,
    //                                   height: WidgetSize(context).sizedBox40,
    //                                   child: Center(child: Text('잠시만 기다려주세요...', style: TextStyle(color: Style.white, fontSize: Get.width*0.0326, fontWeight: FontWeight.w400),)),
    //                                 )
    //                                     :
    //                                 GestureDetector(
    //                                   onTap: () async{
    //                                     if(Get.isSnackbarOpen == true){
    //                                       Get.back();
    //                                     } else{
    //                                       if(controller.dropdownValue.value == ''){
    //                                         CommonWidgets().customSnackbar('신고 이유 선택은 필수입니다.');
    //                                       } else{
    //                                         await controller.postDeclaration(
    //                                           bruMidx: SrcInfoController.to.infoM.value.mIdx,
    //                                           bruRoomIdx: controller.roomIdx.value,
    //                                           bruType: controller.type.value, bruMidxPe: controller.userIdx.value, bruSmMid: controller.smId.value, bruTitle: controller.dropdownValue.value,
    //                                           bruContent: controller.declarationInput.value, bruPathImageEdit1: controller.imagePath[0] == null ? '' : controller.imagePath[0]!.path,
    //                                           bruPathImageEdit2: controller.imagePath[1] == null ? '' : controller.imagePath[1]!.path,
    //                                           bruPathImageEdit3: controller.imagePath[2] == null ? '' : controller.imagePath[2]!.path,
    //                                         );
    //
    //                                       }
    //                                     }
    //                                   },
    //                                   child: Container(
    //                                     decoration: BoxDecoration(
    //                                       borderRadius: BorderRadius.circular(Get.width),
    //                                       color: Style.yellow,
    //                                     ),
    //                                     width: Get.width,
    //                                     height: WidgetSize(context).sizedBox40,
    //                                     child: Center(child: Text('신고하기', style: TextStyle(color: Style.brown, fontSize: Get.width*0.0326, fontWeight: FontWeight.w400),)),
    //                                   ),
    //                                 )
    //                               ],
    //                             ),
    //                           ),
    //                         ),
    //                       );
    //                     }
    //                 ),
    //               )
    //       );
    //     }
    // );
  }
}