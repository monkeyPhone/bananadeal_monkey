import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/info_edit/info_edit_repository.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/dio/api/dio/model/data/data_dto.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/string/const_label.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/tab/components/components_info_setting_page.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/tab/components/components_info_setting_title.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/brew/etc/tab/info_setting/tab/password/manager/password_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/route/state/cubit/banana_route/banana_route_cubit.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/neo/bd_neo_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/special/bd_ripple_check_icon.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/special/bd_ripple_search_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_custom_pad.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_form_custom.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/text/bd_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InfoSettingTabPasswordDialog extends StatelessWidget {
  final InfoEditRepository repository;
  const InfoSettingTabPasswordDialog({super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<PasswordManager>(
        create: (BuildContext context) =>
            PasswordManager(repository: repository),
        child: const _Dialog(),
    );
  }
}


class _Dialog extends StatelessWidget {
  const _Dialog();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Dialog(
        backgroundColor: white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(size.dialogCircular))
        ),
        child: const BdLayoutPadding(
          padding: PaddingEnum.dialog,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ComponentsInfoSettingTitle(title: '비밀번호 변경'),
              _Alert(),
              _Password(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Alert extends StatelessWidget {
  const _Alert();

  @override
  Widget build(BuildContext context) {
    return  const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BdTextWidget(
          text: '비밀번호는 5글자 이상\n영어 소문자 + 숫자조합만 가능합니다.',
          textStyle: subBrown,
          textAlign: TextAlign.start,
          maxLines: 3,
        ),
        BdCustomPad(padEnum: PadEnum.height20)
      ],
    );
  }
}



class _Password extends StatefulWidget {
  const _Password();

  @override
  State<_Password> createState() => _PasswordState();
}

class _PasswordState extends State<_Password> {
  bool _lock1 = true;
  late final TextEditingController _controller1;
  bool _lock2 = true;
  late final TextEditingController _controller2;

  String _validate1 = '';
  String _validate2 = '';
  bool _next1 = false;
  bool _next2 = false;
  bool _confirm = false;

  void _onChanged1(String val){
    setState(() {
      _validate1 = context.read<PasswordManager>().repository.passwordValidate(password: _controller1.text);
      _next2 = context.read<PasswordManager>().repository.passwordValidateDouble(password1: _controller1.text, password2: _controller2.text) == '';
      if(_validate1 == ''){
        _next1 = true;
      }
      else{
        _next1 = false;
      }
    });
  }

  void _onChanged2(String val){
    setState(() {
      _validate2 = context.read<PasswordManager>().repository.passwordValidateDouble(password1: _controller1.text, password2: _controller2.text);
      if(_validate2 == ''){
        _next2 = true;
      }
      else{
        _next2 = false;
      }
    });
  }

  void _changeLock1(){
    setState(() {
      _lock1 =! _lock1;
    });
  }

  void _changeLock2(){
    setState(() {
      _lock2 =! _lock2;
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller1 = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      children: [
        ComponentsInfoSettingPage(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BdTextWidget(text: '비밀번호', textStyle: captionBold,),
                const BdCustomPad(padEnum: PadEnum.height8),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: BdTextFormCustom(
                            onChanged: _onChanged1,
                              onFieldSubmitted: _onChanged1,
                              size: size,
                              enabled: true,
                              obscureText: _lock1,
                              textController: _controller1,
                              suffixIcon: BdRippleSearchButton(
                                  size: size,
                                  lock: _lock1,
                                  onTap: (){
                                    _changeLock1();
                                  }
                              ),
                          )
                      ),
                      const BdCustomPad(padEnum: PadEnum.width12),
                      BdRippleCheckIcon(
                        padding: size.sized4grid,
                        size: size, lock: _next1,)
                    ],
                  ),
                ),
              ],
            )
        ),
        const BdCustomPad(padEnum: PadEnum.height16),
        ComponentsInfoSettingPage(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BdTextWidget(text: '비밀번호 확인', textStyle: captionBold,),
                const BdCustomPad(padEnum: PadEnum.height8),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: BdTextFormCustom(
                            size: size,
                            onChanged: _onChanged2,
                            onFieldSubmitted: _onChanged2,
                            enabled: true,
                            obscureText: _lock2,
                            textController: _controller2,
                            suffixIcon: BdRippleSearchButton(
                                size: size,
                                lock: _lock2,
                                onTap: (){
                                  _changeLock2();
                                }
                            ),
                          )
                      ),
                      const BdCustomPad(padEnum: PadEnum.width12),
                      BdRippleCheckIcon(
                        padding: size.sized4grid,
                        size: size, lock: _next2,)
                    ],
                  ),
                ),
              ],
            )
        ),
        const BdCustomPad(padEnum: PadEnum.height16),
        ComponentsInfoSettingPage(
          child:  Center(
            child: _next1 && _next2 && !_confirm ? BdNeoButton(
                size: size,
                fontSize: size.titleLittle,
                height: size.sizedAppbar,
                onPressed: () async{
                  final DataDto dto = await context.read<PasswordManager>().repository.sendPw(
                      email: context.read<BananaRouteCubit>().state.userVO.mEmail,
                      pw: _controller2.text
                  );
                  final StatusEnum status = dto.statusEnum;
                  if(context.mounted){
                    if(status == StatusEnum.success){
                      setState(() {
                        _confirm = true;
                      });
                      context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: '비밀번호 변경이 완료되었습니다. 변견된 비밀번호로 다시 로그인해주세요!');
                      context.read<VerseConfig>().route.logout(
                          context: context,
                          idx: context.read<BananaRouteCubit>().state.userVO.mIdx,
                          how: true
                      );
                    }
                    else{
                      context.read<VerseConfig>().browser.snackBar.showSnackBar(context: context, text: '잠시 후, 다시 시도해주세요.');
                    }
                  }

                }, text: '변경하기'
            ) :BdTextWidget(
                  text: _validate1 == '' ? _validate2 : _validate1 != '' ? _validate1 : '입력완료',
                  textStyle: _next1 && _next2 ? subBrown : subRed,
                  textAlign: TextAlign.center,
                maxLines: 3,
              ),
          ),
          ),
      ],
    );
  }
}
