import 'package:banana_deal_by_monkeycompany/app/css/app_basic_component/bagic_canvas.dart';
import 'package:flutter/material.dart';
import '../../../css/size.dart';
import '../../../css/style.dart';
import '../../../routes/const_element.dart';
import '../../src/styles/image_data.dart';

class BannerButtonPage extends StatelessWidget {
  const BannerButtonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasicCanvas(
      canPop: false,
      onPopInvoked: (bool didPop, Object? result) async{
        if(didPop){
          return;
        }
      },
        body: const Center(
          child: CircularProgressIndicator(
            color: Style.progressBar,
          ),
        ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Style.white,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        elevation: WidgetSize(context).sizedBox5,
        selectedItemColor: Style.crowdFlower2,
        unselectedItemColor: Style.grey999999,
        currentIndex: 0,
        selectedLabelStyle: TextStyle(
            fontSize: WidgetSize(context).sizedBox14,
            fontWeight: FontWeight.w700,
            color: Style.blackWrite
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: WidgetSize(context).sizedBox14,
          fontWeight: FontWeight.w700,
        ),
        items: [
          BottomNavigationBarItem(
            backgroundColor: Style.white,
            icon: _IconWidget(icon: AppElement.homeOff, color: Style.crowdFlower2),
            activeIcon: _IconWidget(icon: AppElement.homeOn, color: Style.crowdFlower2),
            label: '홈',
          ),
          BottomNavigationBarItem(
            backgroundColor: Style.white,
            icon: _IconWidget(icon: AppElement.storeOff, color: Style.grey999999),
            activeIcon: _IconWidget(icon: AppElement.storeOn, color: Style.grey999999),
            label: '동네매장',
          ),
          BottomNavigationBarItem(
            backgroundColor: Style.white,
            icon: _IconWidget(icon: AppElement.dealOff, color: Style.grey999999),
            activeIcon: _IconWidget(icon: AppElement.dealOn, color: Style.grey999999),
            label: 'My딜',
          ),
          BottomNavigationBarItem(
            backgroundColor: Style.white,
            icon: _IconWidget(icon: AppElement.chatOff, color: Style.grey999999),
            activeIcon: _IconWidget(icon: AppElement.chatOn, color: Style.grey999999),
            label: '채팅',
          ),
          BottomNavigationBarItem(
            backgroundColor: Style.white,
            icon: _IconWidget(icon: AppElement.otherOff, color: Style.grey999999),
            activeIcon:
            _IconWidget(icon: AppElement.other, color: Style.grey999999),
            label: '더보기',
          ),
        ],
      ),
    );
  }



}

class _IconWidget extends StatelessWidget {
  final String icon;
  final Color color;
  const _IconWidget({super.key
  , required this.icon,
    required this.color
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: WidgetSize(context).sizedBox2*2, top: WidgetSize(context).sizedBox2*2),
      child: ImageData(icon, color: color,),
    );
  }
}

