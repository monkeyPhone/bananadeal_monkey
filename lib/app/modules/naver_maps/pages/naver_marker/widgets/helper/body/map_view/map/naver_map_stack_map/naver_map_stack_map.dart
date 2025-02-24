import 'package:flutter/material.dart';
import 'package:flutter_naver_map/flutter_naver_map.dart';
import 'package:get/get.dart';
import '../../../../../../../../../../components/loading.dart';
import '../../../../../../../../../../css/style.dart';
import '../../../../../../naver_marker_controller.dart';
import '../../stack_icon/naver_map_stack_icon.dart';
import 'naver_map_stack_map_init.dart';

class NaverMapStackMap extends GetView<NaverMarkerController> {
  const NaverMapStackMap({
    super.key});

  @override
  Widget build(BuildContext context) {
    return  FutureBuilder<NLatLng>(
        future: controller.setPosition(),
        builder:(BuildContext context, AsyncSnapshot snapshot) {
          if(snapshot.connectionState == ConnectionState.waiting){
            return  Loading2(text: '잠시만 기다려주세요.',);
          }
          else if (!snapshot.hasData) {
            return DefaultView(text1: '지도 생성에 실패했습니다.', text2: ' 잠시 후, 다시 시도해주세요.');
          }
          //error가 발생하게 될 경우 반환하게 되는 부분
          else if (snapshot.hasError) {
            return DefaultView(text1: '지도 생성에 실패했습니다.', text2: ' 잠시 후, 다시 시도해주세요.');
          }
          // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
          else {
            return  Stack(
              children: [
                NaverStackMapInit(latitude: snapshot.data.latitude, longtitude: snapshot.data.longitude,),
                NaverMapStackIcon(),
              ],
            );
          }
        }
    );


    //   ObxValue( (location) =>
    // location.value.latitude == 0
    //     ?
    //     FutureBuilder(
    //         future: controller.setPosition(),
    //         builder:(BuildContext context, AsyncSnapshot snapshot) {
    //           if(snapshot.connectionState == ConnectionState.waiting){
    //             return  Loading2(text: '잠시만 기다려주세요.',);
    //           }
    //           else if (!snapshot.hasData) {
    //             return DefaultView(text1: '지도 생성에 실패했습니다.', text2: ' 잠시 후, 다시 시도해주세요.');
    //           }
    //           //error가 발생하게 될 경우 반환하게 되는 부분
    //           else if (snapshot.hasError) {
    //             return DefaultView(text1: '지도 생성에 실패했습니다.', text2: ' 잠시 후, 다시 시도해주세요.');
    //           }
    //                     // 데이터를 정상적으로 받아오게 되면 다음 부분을 실행하게 되는 것이다.
    //           else {
    //             return Center(child: CircularProgressIndicator(color: Style.progressBar,));
    //           }
    //         }
    //     )
    //     :
    // Stack(
    //   children: [
    //     NaverStackMapInit(latitude: controller.myLatLng.value.latitude, longtitude: controller.myLatLng.value.longitude,),
    //     NaverMapStackIcon(),
    //   ],
    // )
    //
    //     , controller.myLatLng
    // );
  }
}
