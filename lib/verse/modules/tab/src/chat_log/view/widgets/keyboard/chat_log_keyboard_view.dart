import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/manager/chat_log_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/state/bloc/banana_chat_log_widget/banana_chat_log_widget_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/chat_log/state/cubit/banana_chat_log_socket/banana_chat_log_socket_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/bd_ripple_button_basic.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ChatLogKeyboardView extends StatelessWidget {
  const ChatLogKeyboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaChatLogSocketCubit, BananaChatLogSocketState, bool>(
        selector: (state) => state.isUsed,
        builder: (context, isUsed) => switch(isUsed){
          true => const Column(
            children: [
              _KeyBoard(),
              _MenuBar(),
              _ResizeForm()
            ],
          ),
          false => const SizedBox()
        }
    );
  }
}


class _KeyBoard extends StatefulWidget {
  const _KeyBoard();

  @override
  State<_KeyBoard> createState() => _KeyBoardState();
}

class _KeyBoardState extends State<_KeyBoard> {
  late final TextEditingController _keyBordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _keyBordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _keyBordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    OutlineInputBorder baseBorder = OutlineInputBorder(
        borderSide: BorderSide(
            color: greyCCCCCC,
            width: size.sizedBox1
        )
    );
    return Container(
      padding: EdgeInsets.all(
          size.sized12grid
      ),
      color: white,
      width: size.widthCommon, height: size.sizedBox70,
      child: Row(
        children: [
          BdRippleButtonBasic(
            onTap: (){
              if(_keyBordController.text != ''){
                _keyBordController.clear();
              }
              FocusScope.of(context).unfocus();
              context.read<BananaChatLogWidgetBloc>().add(const MenuBarClick());
            },
            child:  Icon(Icons.menu,
              color: grey999999,
              size: size.sizedBox32,
            ),
          ),
          const BdCustomPad(padEnum: PadEnum.width8),
          Expanded(
              child:
              TextFormField(
                onTap: (){
                  context.read<BananaChatLogWidgetBloc>().add(const MenuBarClick(isOpen: false));
                },
                expands: true,
                minLines: null,
                maxLines: null,
                maxLength: 5000,
                // focusNode: controller.focus,
                controller: _keyBordController,
                keyboardType: TextInputType.multiline,
                style: TextStyle(
                    color: blackWrite,
                    fontSize: size.sizedBox16
                ),
                cursorColor: yellow,
                decoration: InputDecoration(
                    counterText: '',
                    contentPadding:
                    EdgeInsets.only(
                        left: size.sizedBox14,
                        right: size.sizedBox5
                    ),
                    //모든 Input 상태의 기본 스타일 세팅
                    border: baseBorder,
                    focusedBorder: baseBorder.copyWith(
                        borderSide: baseBorder.borderSide.copyWith(
                          color: yellow,
                        )
                    )
                ),
              )
          ),
          const BdCustomPad(padEnum: PadEnum.width12),
          BdRippleButtonBasic(
            onTap: () async{
              context.read<BananaChatLogWidgetBloc>().add(const MenuBarClick(isOpen: false));
              final bool isConnect = await context.read<VerseConfig>().dio.getInternetStatus();
              if(context.mounted){
                if(isConnect){
                  context.read<BananaChatLogWidgetBloc>().scrollController.jumpTo(0.0);
                  context.read<BananaChatLogSocketCubit>().sendMessage(
                      messageText: _keyBordController.text.trim(),
                  );
                  _keyBordController.clear();
                }
                else{
                  context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: '네트워크 연결상태를 확인해주세요.');
                }
              }

            },
            padding: EdgeInsets.symmetric(horizontal: size.sized16grid),
            color: yellow,
            borderRadius: BorderRadius.circular(999),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text('전송',
                  style: TextStyle(
                      fontSize: size.callout,
                      color: brown,
                      fontWeight: FontWeight.w400
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MenuBar extends StatelessWidget {
  const _MenuBar();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaChatLogWidgetBloc, BananaChatLogWidgetState, bool>(
        selector: (state) => state.isMenu,
        builder: (context, isMenu) =>
        switch(isMenu){
          true => const _MenuBarDetail(),
          false => const SizedBox()
        }
    );
  }
}

class _MenuBarDetail extends StatelessWidget {
  const _MenuBarDetail();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      color: white,
      width: size.widthCommon,
      height: size.sizedBox100,
      child: Row(
        children: [
          _FlexibleButton(
            onTap: (){
              context.read<ChatLogManager>().gotoUploadView(context);
            },
            text: '사진 보내기',
            icon: Icons.image_outlined,
          ),
          _FlexibleButton(
            onTap: (){

            },
            text: '딜 초대하기',
            icon: Icons.mail_outline_outlined,
          ),
          _FlexibleButton(
            onTap: (){
              context.read<ChatLogManager>().gotoStoreDetailView(context);
            },
            text: '매장 상세보기',
            icon: Icons.storefront,
          ),
          _FlexibleButton(
            onTap: (){

            },
            text: '신고하기',
            icon: Icons.notifications_active_outlined,
          ),
        ],
      ),
    );
  }
}

class _FlexibleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData icon;
  final String text;
  const _FlexibleButton({
    required this.onTap,
    required this.icon,
    required this.text
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Flexible(
      fit: FlexFit.tight,
      child: Padding(
        padding: EdgeInsets.all(size.sizedBox3),
        child: BdRippleButtonBasic(
            onTap: onTap,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Icon(
                        icon,
                        size: size.title27,
                      ),
                    )
                ),
                const BdCustomPad(padEnum: PadEnum.height12),
                Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        text,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: size.sub,
                            color: karajeck
                        ),
                      ),
                    )
                ),

              ],
            )
        ),
      ),
    );
  }
}


class _ResizeForm extends StatelessWidget {
  const _ResizeForm();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final safeAreaPadding = MediaQuery.of(context).viewPadding.bottom;
        final keyboardHeight = MediaQuery.of(context).viewInsets.bottom - safeAreaPadding;
        final adjustedHeight = keyboardHeight > 0 ? keyboardHeight : 0.0;
        return AnimatedPadding(
          padding: EdgeInsets.only(bottom: adjustedHeight),
          duration: const Duration(milliseconds: 50),
          curve: Curves.easeOutQuad,
          child: const SizedBox(),
        );
      },
    );
  }
}



