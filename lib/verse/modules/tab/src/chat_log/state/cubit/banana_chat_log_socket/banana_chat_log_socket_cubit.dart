import 'package:banana_deal_by_monkeycompany/config/model_config.dart';
import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/data/chat_room_vo.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/data/user_vo.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'banana_chat_log_socket_state.dart';

class BananaChatLogSocketCubit extends Cubit<BananaChatLogSocketState> {
  final UserVO _user;
  final ChatRoomVO _room;
  final String _chatUrl;
  final bool _isUsed;
  late IO.Socket socket;

  BananaChatLogSocketCubit({
    required UserVO user,
    required ChatRoomVO room,
    required String chatUrl,
    required bool isUsed,
  }) : _room = room, _chatUrl = chatUrl, _user = user, _isUsed = isUsed,
        super(const BananaChatLogSocketState());


  void socketConnect(){
    socket = IO.io(
        _chatUrl,
        <String, dynamic>{
          'transports': ['websocket'],
          'autoConnect': false,
          'query': {
            'userName': _user.mName,
          }
        }
    );
    socket.connect();

    socket.emit('join', {
      'C_room_idx' : '${_room.crIdx}',
      'C_type' : 'USER',
      'C_name' : _user.mName,  //test
      'token' :  _room.smToken, //test
    });

    socket.on('join', (_) {

    });


    _onDisconnect();

    socket.on('error', (err) {
      changeError(err['message']);
    });


    socket.on('chat', (message) async{
      if(message['C_message'].contains('님이 채팅을 종료했어요')){

      }

      messageSet(message: message['C_message'], messageData: ChatLogDto(
          cIdx: 0,
          cRoomIdx: _room.crIdx,
          cMessage: message['C_message'],
          cType: message['C_type'],
          cIsRead: 'Y',
          cRegdate: message['C_regdate']
      ));



    });



    emit(
      state.copyWith(
        isUsed: _isUsed,
        isDeal: _room.isDealing != 0,
      ),

    );
  }




  void changeError(String value){
    emit(state.copyWith(errorMessage: value));
  }

  void messageSet({
    required String message,
    required ChatLogDto messageData
  }){
    emit(state.copyWith(message: message, messageData: messageData));
  }


  void leaveChat() async{
    socket.emit('leave', {
      'C_room_idx' : '${_room.crIdx}',
    });
    await Future.delayed(const Duration(milliseconds: 100));
    socket.disconnect();
  }

  void _onDisconnect(){
    socket.onDisconnect((_){

    });
  }

  void changeDisconnect(bool value){
    emit(state.copyWith(isDisconnect: value));
  }

  void changeEdge(bool value){
    emit(state.copyWith(isUp: value));
  }

  void sendMessage({
    required String messageText,
  }){
    if(messageText != ''){
      Map<String, String> post = {
        'C_room_idx' : '${_room.crIdx}',
        'C_message': messageText,
        'C_type': 'USER',
        'token' : _room.smToken,
        'C_name' : _user.mName,
      };

      socket.emit('chat', post);
    }
  }

  void sendExit(){
    Map<String, String> post = {
      'C_room_idx' : '${_room.crIdx}',
      'C_message': '${_user.mName}님이 채팅을 종료했어요.',
      'C_type': 'USER',
      'token' : _room.smToken,
      'C_name' : _user.mName,
    };

    socket.emit('chat', post);
  }

  void changeImageUrl(String imageUrl) {
    emit(state.copyWith(imageUrl: imageUrl));
  }

  @override
  Future<void> close() async{
    // TODO: implement close
    try{
      leaveChat();
    } catch(_){
      socket.disconnect();
    }
    super.close();
  }



}
