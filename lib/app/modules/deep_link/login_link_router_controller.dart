import 'dart:async';
import 'package:app_links/app_links.dart';
import 'package:banana_deal_by_monkeycompany/app/components/common_widgets.dart';
import 'package:banana_deal_by_monkeycompany/app/managers/register_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/store/convert_store.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_info_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/modules/src/src_components/controllers/src_route_controller.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/bdbot/bd_bot_nav_rapository.dart';
import 'package:banana_deal_by_monkeycompany/app/repository/etc/etc_event_repository.dart';
import 'package:get/get.dart';
import '../src/pages/etc/views/components/etc_event/etc_event_detail/etc_event_detail_view.dart';
import '../src/pages/etc/views/components/etc_event/etc_event_detail/etc_evnet_detail_controller.dart';

class LoginLinkRouterController extends GetxController{
  final BdBotNavRepository _bdBotNavRepository = const RegisterManager().getBdBotNavRepository();
  final EtcEventRepository _etcEventRepository = const RegisterManager().getEtcEventRepository();
  final CommonWidgets _commonWidgets = CommonWidgets();
  final String links;

  LoginLinkRouterController(this.links);

  Future<void> getUri() async{
   try{
     final String uri = links;
     if(uri.toString() != ''){
       final log = uri.toString();
       String log1 = log.substring(13,18); // 종류
       String log2 = log.substring(19);// index
       if(log1 == 'store'){
         ConvertStore api = await _bdBotNavRepository.convertID(smIdx: log2);
         SrcRouteController.to.gotoStoreDetail(smid: api.result.first.smMId, midx: SrcInfoController.to.infoM.value.mIdx, index1: null, rong: 0);
         deleteController();
       }
       else{
         if(log1 == 'event'){
           Get.to(
                   () => EtcEventDetailView(
                 eventIdx: int.parse(log2),
                 email: SrcInfoController.to.infoM.value.mEmail,
               ), binding:
           BindingsBuilder(
                   () {
                 Get.put(EtcEventDetailController(
                     etcEventRepository: _etcEventRepository,
                     commonWidgets: _commonWidgets
                 ));
               }
           )
           );
           deleteController();
         }
       }
     }
   }catch(e){
     _commonWidgets.customSnackbar('링크 접근에 실패하였어요. 다시 한번 시도해주세요.');
     deleteController();
   }
  }

  void deleteController(){
    Timer(const Duration(milliseconds: 200), ()
    {
      Get.delete<LoginLinkRouterController>();
    }
    );
  }

  @override
  void onInit() async{
    // TODO: implement onInit

    super.onInit();
    await getUri();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

}