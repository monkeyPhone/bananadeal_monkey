import 'package:banana_deal_by_monkeycompany/app/routes/const_element.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../css/size.dart';
import '../../../../css/style.dart';
import '../../styles/image_data.dart';
import 'controllers/bd_bot_nav_chat_controller.dart';
import 'controllers/bd_bot_nav_controller.dart';

class BdBotNav extends GetView<BdBotNavController> {
  const BdBotNav({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ObxValue(
            (page) => BottomNavigationBar(
              backgroundColor: Style.white,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              elevation: WidgetSize(context).sizedBox5,
              selectedItemColor: Style.crowdFlower2,
              unselectedItemColor: Style.grey999999,
              currentIndex: page.value,
              selectedLabelStyle: TextStyle(
                  fontSize: WidgetSize(context).sizedBox13,
                  fontWeight: FontWeight.w700,
                  color: Style.blackWrite
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: WidgetSize(context).sizedBox13,
                fontWeight: FontWeight.w700,
              ),
              onTap: controller.valueChanged,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: Style.white,
                  icon: _IconWidget(icon: AppElement.homeOff, color: Style.grey999999),
                  activeIcon: _IconWidget(icon: AppElement.homeOn, color: Style.crowdFlower2),
                  label: '홈',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Style.white,
                  icon: _IconWidget(icon: AppElement.storeOff, color: Style.grey999999),
                  activeIcon: _IconWidget(icon: AppElement.storeOn, color: Style.crowdFlower2),
                  label: '동네매장',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Style.white,
                  icon: _IconWidget(icon: AppElement.dealOff, color: Style.grey999999),
                  activeIcon: _IconWidget(icon: AppElement.dealOn, color: Style.crowdFlower2),
                  label: 'My딜',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Style.white,
                  icon: _IconStackWidget(icon: AppElement.chatOff, color: Style.grey999999),
                  activeIcon: _IconStackWidget(icon: AppElement.chatOn, color: Style.crowdFlower2),
                  label: '채팅',
                ),
                BottomNavigationBarItem(
                  backgroundColor: Style.white,
                  icon: _IconWidget(icon: AppElement.otherOff, color: Style.grey999999),
                  activeIcon:
                  _IconWidget(icon: AppElement.other, color: Style.crowdFlower2),
                  label: '더보기',
                ),
              ],
            )
        , controller.pageIndex);
  }


}



class _IconWidget extends StatelessWidget {
  final String icon;
  final Color color;
  const _IconWidget({
    super.key,
    required this.icon,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox5, top: WidgetSize(context).sizedBox5),
      child: ImageData(icon, color: color,),
    );
  }
}


class _IconStackWidget extends StatelessWidget {
  final String icon;
  final Color color;
  const _IconStackWidget({
    super.key,
    required this.icon,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox5, top: WidgetSize(context).sizedBox5),
          child: ImageData(icon, color: color,),
        ),
        Positioned(
            top: 0,
            right: WidgetSize(context).sizedBox24,
            child: GetBuilder<BdBotNavChatController>(builder: (bdc){
              return
                bdc.chatLength.value > 0
                    ?
                Container(
                  decoration: BoxDecoration(
                      color: Style.red,
                      borderRadius: BorderRadius.circular(WidgetSize(context).sizedBox30)
                  ),
                  padding: EdgeInsets.symmetric(vertical: WidgetSize(context).sizedBox3, horizontal: WidgetSize(context).sizedBox5 ),
                  child: Center(
                    child: Text(
                      bdc.chatLength.value < 100
                          ?
                      bdc.chatLength.value.toString()
                          :
                      '99+', style: TextStyle(
                        fontSize: WidgetSize(context).sizedBox10,
                        color: Style.white
                    ),)
                    ,
                  ),
                ) :
                SizedBox();
            })
        )
      ],
    );
  }
}




//   BottomNavigationBar(
//   backgroundColor: Style.karajeck,
//   type: BottomNavigationBarType.fixed,
//   showSelectedLabels: true,
//   showUnselectedLabels: true,
//   elevation: 0,
//   selectedItemColor: Style.yellow,
//   unselectedItemColor: Style.grey999999,
//   currentIndex: bdC.pageIndex.value,
//   selectedLabelStyle: SrcStyle.iconActiveText,
//   unselectedLabelStyle: SrcStyle.iconText,
//   onTap: (value) async{
//     bdC.changeBottomNav(value);
//     StoreController.to.paged.value = 0;
//     switch(bdC.pageIndex.value){
//       case 1:
//         if(SrcInfoController.to.infoM.value.mIsUsed != '이용중'){
//         }else{
//           if(SrcInfoController.to.infoM.value.mLatitude == '' || SrcInfoController.to.infoM.value.mLongitude == ''){
//             SrcRouteController.to.initSetting();
//           }
//           else{
//             await BdBotNavStoreController.to.getStore(start: 0);
//           }
//         }
//         break;
//       case 3:
//         if(SrcInfoController.to.infoM.value.mIsUsed != '이용중'){
//
//         }else{
//           await BdBotNavChatController.to.getChatList();
//         }
//         break;
//     }
//   },
//   items: [
//     BottomNavigationBarItem(
//       icon: _iconWidget(IconsPath.homeOff, Style.ultimateGrey),
//       activeIcon: _iconWidget(IconsPath.homeOn, Style.yellow),
//       label: '홈',
//     ),
//     BottomNavigationBarItem(
//       icon: _iconWidget(IconsPath.storeOff, Style.ultimateGrey),
//       activeIcon: _iconWidget(IconsPath.storeOn, Style.yellow),
//       label: '동네매장',
//     ),
//     BottomNavigationBarItem(
//       icon: _iconWidget(IconsPath.dealOff, Style.ultimateGrey),
//       activeIcon: _iconWidget(IconsPath.dealOn, Style.yellow),
//       label: 'My딜',
//     ),
//     BottomNavigationBarItem(
//       icon: _iconStackWidget(IconsPath.chatOff, Style.ultimateGrey),
//       activeIcon: _iconStackWidget(IconsPath.chatOn, Style.yellow),
//       label: '채팅',
//     ),
//     BottomNavigationBarItem(
//       icon: _iconWidget(IconsPath.otherOff, Style.ultimateGrey),
//       activeIcon:
//       _iconWidget(IconsPath.other, Style.yellow),
//       label: '더보기',
//     ),
//   ],
// )