import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_list_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_image.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_string.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/manager/fcm_alert_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/fcm/view/widgets/body/tab/tab_list/components/fcm_body_tap_list_normal_box_components_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_stack.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/image/bd_image_binder_calculate_many.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class FcmBodyTabListEtcView extends StatelessWidget {
  final NotiEntity dto;
  final List<NotiEntity> dtoList;
  final int index;
  const FcmBodyTabListEtcView({super.key,
    required this.dto,
    required this.dtoList,
    required this.index
  });

  @override
  Widget build(BuildContext context) {
    return FcmBodyTapListNormalBoxComponentsView(
      isRead: dto.isRead,
      imageUrl: bananaLaunch,
      title:  dto.title == '' ? '바나나딜 공지': dto.title,
      content: dto.msg == '' ? '내용이 없네요.' : dto.msg,
      imageBox: _ExpandedImage(dto: dto, dtoList: dtoList, index: index,),
    );
  }
}


class _ExpandedImage extends StatelessWidget {
  final NotiEntity dto;
  final int index;
  final List<NotiEntity> dtoList;
  const _ExpandedImage({
    required this.dto,
    required this.index,
    required this.dtoList,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return   dto.img == ''
        ?  const SizedBox()
        : Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: size.sizedBox10,
        ),
        Container(
          width: size.widthCommon,
          constraints: const BoxConstraints(
              maxHeight: double.infinity
          ),
          child: LayoutBuilder(
            builder: (context, constraints)=>
                BdRippleButtonStack(
                  onTap: (){
                    if(dtoList.where((element) => element.img != '').isNotEmpty){
                      // 1. 이미지가 있는 항목만 필터링하여 리스트 생성
                      List<Map<String, dynamic>> imageWithIndex = dtoList
                          .asMap()
                          .entries
                          .where((entry) => entry.value.img.isNotEmpty)
                          .map((entry) => {'img': entry.value.img, 'index': entry.key})
                          .toList();


                      int currentIndex = imageWithIndex.indexWhere((element) => element['index'] == index);

                      List<String> imageList = imageWithIndex.map((e) => e['img'] as String).toList();
                      // List<String> image = dtoList.data.where((element) => element.img.isNotEmpty).map((e) => e.img).toList().reversed.toList();
                      // int index = image.indexWhere((element) => element == dto.img);
                      context.read<FcmAlertManager>().openImageDialog(
                          currentIndex: currentIndex,
                          imageList: imageList,
                          isDownload: false, context: context
                      );
                      // log('최대길이: ${imageList.length} 현재 인덱스: $currentIndex');
                    }

                  }, isDelay: true,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size.sizedBox8),
                    child: BdImageBinderCalculateMany(
                        imageUrl: '${context.read<VerseConfig>().url.imageBananaUrl}${dto.img}',
                        errUrl: defaultPhone,
                        imageWidth: constraints.maxWidth, aspectRatio: caseFree),
                  ),
                ),
          ),
        ),
        SizedBox(
          height: size.sizedBox5,
        ),
      ],
    );

  }
}


