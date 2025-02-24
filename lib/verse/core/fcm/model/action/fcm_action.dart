import 'package:banana_deal_by_monkeycompany/verse/core/common/cache/singleton/noti_cache_singleton.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/fcm/model/data/noti_list_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_noti.dart' as ConstNoti;

class FcmAction{
  final NotiCacheSingleton notiCache;

  const FcmAction({
    required this.notiCache
  });

  Future<NotiEntity> notiRouteBack() async{
    final String? cache = await notiCache.getNoti(key: ConstNoti.notiRouteBack);
    NotiEntity noti = NotiEntity(idx: 0, title: '', msg: '', profile: '', type: '', name: '', time: '', img: '', send: '', isRead: false);

    NotiEntity pay = switch(cache){
      null => noti,
      _ => notiEntityFromJson(cache)
    };

    return pay;
  }

  Future<NotiListDto> getNoti(String key) async{
    final String? cache = await notiCache.getNoti(key: key);

    NotiListDto pay = switch(cache){
      null => NotiListDto(data: []),
      _ => notiListDtoFromJson(cache)
    };

    List<NotiEntity> noti = pay.data;
    if(noti.isNotEmpty){
      if(noti.length > 1){
        noti.sort((a,b)=>
            DateTime.parse(b.time).compareTo(DateTime.parse(a.time))
        );
      }
    }

    return NotiListDto(data: noti);

  }

  Future<NotiEntity> getNotiChat() async{
    final String? cache = await notiCache.getNoti(key: ConstNoti.notiChat);

    NotiEntity pay = switch(cache){
      null => NotiEntity(idx: 0, title: '', msg: '', profile: '', type: '', name: '', time: '', img: '', send: '', isRead: false),
      _ => notiEntityFromJson(cache)
    };

    return pay;

  }

}