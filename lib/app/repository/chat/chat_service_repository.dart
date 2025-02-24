import 'dart:io';
import 'package:banana_deal_by_monkeycompany/app/managers/dio_service_manager.dart';
import 'package:banana_deal_by_monkeycompany/app/models/chat_image_info.dart';
import 'package:banana_deal_by_monkeycompany/app/models/room_list_page.dart';
import 'package:banana_deal_by_monkeycompany/config/datetime_config.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import '../../models/auth_basic_api.dart';
import '../../modules/src/pages/widgets/service/service_model/chat_user_chat_list.dart';
import '../../modules/src/pages/widgets/service/service_model/chat_user_room_list.dart';


class ChatServiceRepository {
  final DioServiceManager _dsm;
  final String _bananaPrivateUrl;
  final String _bananaChat;
  final String _bananaChatServer;
  final String router505;
  final String rp;

  const ChatServiceRepository({
    required DioServiceManager dsm,
    required String bananaPrivateUrl,
    required String bananaChat,
    required String bananaChatServer,
    this.router505 = 'main',
    this.rp = 'ChatServiceRepository-'
  }) :  _dsm = dsm,
        _bananaPrivateUrl = bananaPrivateUrl,
        _bananaChat = bananaChat,
        _bananaChatServer = bananaChatServer;


  Future<AuthBagicApi> findChatRoom({
    required String crMidx, required String crSmMid,
  }) async {
    final String apiRoute = '$_bananaPrivateUrl/room/find';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}findChatRoom',
        router505: router505,
        form: {
          "CR_m_idx": crMidx,
          "CR_sm_m_id": crSmMid,
        }
    );
    final AuthBagicApi room = AuthBagicApi.fromJson(data);
    return room;

  }

  Future<AuthBagicApi> createChatRoom({
    required String crMidx, required String crSmMid, required String userMessage,
      }) async {
    final String apiRoute = '$_bananaPrivateUrl/room/create';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}createChatRoom',
        router505: router505,
        form: {
          "CR_m_idx": crMidx,
          "CR_sm_m_id": crSmMid,
          "User_message": userMessage,
        }
    );

    final AuthBagicApi room = AuthBagicApi.fromJson(data);
    return room;

  }

  Future<RoomListPage> getRoomPage({
    required int mIdx,
    required int page,
  }) async {
    final String apiRoute = '$_bananaPrivateUrl/room/list/page';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getRoomPage',
        router505: router505,
        form: {
          "CR_m_idx": mIdx,
          "page": page,
          "limit": 15
        }
    );

    final RoomListPage room = RoomListPage.fromJson(data);

    return room;
  }

  Future<ChatUserRoomList> getRoomList({
    required int mIdx
  }) async {
    final String apiRoute = '$_bananaPrivateUrl/room/list';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getRoomList',
        router505: router505,
        form: {
          "CR_m_idx": mIdx,
        }
    );

   final ChatUserRoomList room = ChatUserRoomList.fromJson(data);

   return room;

  }

  Future<AuthBagicApi> getCisReadTotal({
    required int mIdx,
  }) async {
    final String apiRoute = '$_bananaPrivateUrl/room/list/cisread';
    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getCisReadTotal',
        router505: router505,
        form: {
          "CR_m_idx": mIdx,
        }
    );
    final AuthBagicApi result = AuthBagicApi.fromJson(data);
    return result;
  }


  Future<ChatUserChatList> getChatList({
    required String crMidx, required String cLimit
  }) async {
    final String apiRoute = '$_bananaChatServer/chat/list';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}getChatList',
        router505: router505,
        form: {
          "CR_idx": crMidx,
          "C_limit": cLimit,
        }
    );

    final ChatUserChatList chat = ChatUserChatList.fromJson(data);
    return chat;

  }


  //TODO : C_room_idx 테스트로 추가된거임
  Future<AuthBagicApiChat> sendImage({
    required String cri,
    required String mPathImageEdit}) async {
    final String apiRoute = '$_bananaChat/chat/image';
    var file = File(mPathImageEdit);
    MultipartFile multi = MultipartFile.fromFileSync(file.path,);
    FormData formData = FormData.fromMap(
        {
          "C_room_idx":  cri,
          "C_message": multi,
          "C_regdate": DateFormat("yyyyMMdd").format(DateTimeConfig().now)
        }
    );

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}sendImage',
        router505: router505,
        formData: formData
    );
    final AuthBagicApiChat image = AuthBagicApiChat.fromJson(data);

    return image;

  }

  Future<AuthBagicApi> roomLeave({
    required int crMidx,
  }) async {
    final String apiRoute = '$_bananaPrivateUrl/room/leave';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}roomLeave',
        router505: router505,
        form:   {
          "CR_idx": crMidx,
        }
    );

    final AuthBagicApi chat = AuthBagicApi.fromJson(data);

    return chat;

  }

  Future<ChatUserRoomList> getRoomByIdx({
    required int crIdx,
  }) async {
    final String apiRoute = '$_bananaPrivateUrl/room/list/byidx/info';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}roomLeave',
        router505: router505,
        form:   {
          "CR_idx": crIdx,
        }
    );

    final ChatUserRoomList room = ChatUserRoomList.fromJson(data);

    return room;

  }

  Future<ChatUserRoomList> getRoomByIdxSMid({
    required int mIdx,
    required String smId,
  }) async {
    final String apiRoute = '$_bananaPrivateUrl/room/list/byidx/smid';

    final Map<String, dynamic> data = await _dsm.getData(
        apiRoute: apiRoute,
        repo: '${rp}roomLeave',
        router505: router505,
        form:   {
          "M_idx": mIdx,
          "SM_m_id": smId,
        }
    );

    final ChatUserRoomList room = ChatUserRoomList.fromJson(data);

    return room;

  }




}