import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/data/monkey/model/phone_spec_detail_entity.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/widget_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list_detail/state/bloc/banana_model_list_detail/banana_model_list_detail_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/layout/bd_layout_padding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';



class ModelListDetailBodyDetailView extends StatelessWidget {
  const ModelListDetailBodyDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scrollbar(
      thumbVisibility: true,
      child: BdLayoutPadding(
          padding: PaddingEnum.all,
          child:  SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: _Detail(),
          )
      ),
    );
  }
}


class _Detail extends StatelessWidget {
  const _Detail();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<BananaModelListDetailBloc, BananaModelListDetailState, PhoneSpecDetailEntity>(
        selector: (state) => state.modelDetailEntity,
        builder: (context, entity) =>
            BlocSelector<BananaModelListDetailBloc, BananaModelListDetailState, String>(
                selector: (state) => state.mk,
                builder: (context, mk) =>
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _ExPlainColumn(
                            child: Column(
                              children: [
                                _ExPlainRowText(
                                    text1: '제조사',
                                    text2: mk
                                ),
                                _ExPlainRowText(text1: '모델명', text2: entity.phoneSpecDetail.psModel),
                                _ExPlainRowText(text1: '출시일', text2: DateFormat('yyyy년 MM월 dd일').format(entity.phoneSpecDetail.psReleaseDate)),
                                const _ExPlainPad()
                              ],
                            )
                        ),
                        _ExPlainColumn(
                            child: Column(
                              children: [
                                _ExPlainRowText(text1: 'OS', text2: entity.phoneSpecDetail.psOs),
                                _ExPlainRowText(text1: 'CPU', text2: entity.phoneSpecDetail.psCpu),
                                const _ExPlainPad()
                              ],
                            )
                        ),
                        _ExPlainColumn(
                            child: Column(
                              children: [
                                _ExPlainRowText(text1: 'RAM', text2: entity.phoneSpecDetail.psRam),
                                _ExPlainRowText(text1: '내장메모리', text2: entity.phoneSpecDetail.psInMemory),
                                _ExPlainRowText(text1: '외장메모리', text2: entity.phoneSpecDetail.psExMemory),
                                const _ExPlainPad()
                              ],
                            )
                        ),
                        _ExPlainColumn(
                            child: Column(
                              children: [
                                _ExPlainRowText(text1: '배터리', text2: entity.phoneSpecDetail.psBattery),
                                const _ExPlainPad()
                              ],
                            )
                        ),
                        _ExPlainColumn(
                            child: Column(
                              children: [
                                _ExPlainRowText(text1: '무게', text2: entity.phoneSpecDetail.psWeight),
                                _ExPlainRowText(text1: '디스플레이', text2: entity.phoneSpecDetail.psDisplay),
                                _ExPlainRowText(text1: '화면', text2: entity.phoneSpecDetail.psDisplaySize),
                                _ExplainRowCamera(text1: entity.phoneSpecDetail.psCameraFront, text2: entity.phoneSpecDetail.psCameraBack),
                              ],
                            )
                        ),
                        _ExplainRowEtc(
                          nfc: entity.phoneSpecDetail.psSpecNfc,
                          usim: entity.phoneSpecDetail.psSpecUsim, type: entity.phoneSpecDetail.psSpecType, film: entity.phoneSpecDetail.psSpecFilm,
                          aod: entity.phoneSpecDetail.psSpecAod, pay: entity.phoneSpecDetail.psSpecPay, ip: entity.phoneSpecDetail.psSpecIp,
                          component: entity.phoneSpecDetail.psSpecComponent,),
                        const _ExPlainPad()
                      ],
                    )
            )
    );
  }
}


class _ExPlainColumn extends StatelessWidget {
  final Widget child;
  const _ExPlainColumn({
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      margin: EdgeInsets.only(
          bottom: size.sizedBox20
      ),
      decoration: BoxDecoration(
          color: white,
          border: Border(
            bottom: BorderSide(color: greyDDDDDD, width: size.sizedBox1_5),
          )
      ),
      child: child,
    );
  }
}

class _ExPlainRowText extends StatelessWidget {
  final String text1;
  final String text2;
  const _ExPlainRowText({
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      color: white,
      padding: EdgeInsets.only(bottom: size.sized16grid),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Text(text1,
              style: TextStyle(
                  color: blackWrite,
                  fontWeight: FontWeight.w600,
                  fontSize: size.body
              ),
            ),
          ),
          Flexible(
            flex: 9,
            fit: FlexFit.tight,
            child: Container(
                padding:EdgeInsets.only(left: size.sizedBox15),
                decoration:BoxDecoration(
                    border: Border(left: BorderSide(color: greyDDDDDD, width: size.sizedBox1))
                ),
                child:
                RichText(
                  overflow:
                  TextOverflow.ellipsis,
                  maxLines: 3,
                  textAlign: TextAlign.start,
                  text: TextSpan(
                    text: text2,
                    style: TextStyle(
                      fontWeight:
                      FontWeight.w400,
                      color: bananaBack,
                      fontSize:
                      size.body,
                    ),
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
}

class _ExPlainPad extends StatelessWidget {
  const _ExPlainPad();

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: context.read<VerseConfig>().size.sizedBox5,);
  }
}

class _ExplainRowEtc extends StatelessWidget {
  final String nfc;
  final String usim;
  final String type;
  final String film;
  final String aod;
  final String pay;
  final String ip;
  final String component;
  const _ExplainRowEtc({
    required this.nfc,
    required this.usim,
    required this.type,
    required this.film,
    required this.aod,
    required this.pay,
    required this.ip,
    required this.component,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              color: white,
              border: Border(
                  bottom: BorderSide(width: size.sizedBox1, color: greyCCCCCC)
              )
          ),
          padding: EdgeInsets.only(bottom: size.sizedBox10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: _ExplainMenuText(text: 'NFC',),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: _ExplainSubText(text: nfc,),
                          ),
                        ],
                      )
                  ),
                  const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox()),
                  Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: _ExplainMenuText(text: 'USIM',),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: _ExplainSubText(text: usim,),
                          ),
                        ],
                      )
                  ),
                ],
              ),
              SizedBox(height: size.sizedBox20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: _ExplainMenuText(text: '충전타입',),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: _ExplainSubText(text: type,),
                          ),
                        ],
                      )
                  ),
                  const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox()),
                  Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: _ExplainMenuText(text: '필름부착',),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: _ExplainSubText(text: film,),
                          ),
                        ],
                      )
                  ),
                ],
              ),
              SizedBox(height: size.sizedBox20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: _ExplainMenuText(text: 'AOD',),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: _ExplainSubText(text: aod,),
                          ),
                        ],
                      )
                  ),
                  const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox()),
                  Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: _ExplainMenuText(text: '페이기능',),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: _ExplainSubText(text: pay,),
                          ),
                        ],
                      )
                  ),
                ],
              ),
              SizedBox(height: size.sizedBox20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: _ExplainMenuText(text: '방진방수',),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: _ExplainSubText(text: ip,),
                          ),
                        ],
                      )
                  ),
                  const Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: SizedBox()),
                  const Flexible(
                      flex: 11,
                      fit: FlexFit.tight,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Flexible(
                            flex: 4,
                            fit: FlexFit.tight,
                            child: _ExplainMenuText(text: '',),
                          ),
                          Flexible(
                            flex: 6,
                            fit: FlexFit.tight,
                            child: _ExplainSubText(text: '',),
                          ),
                        ],
                      )
                  ),
                ],
              ),
              SizedBox(height:size.sizedBox10,),
            ],
          ),
        ),
        SizedBox(height: size.sizedBox20,),
        Text('구성품',
          style: TextStyle(
              color: specPink,
              fontSize: size.titleButton,
              fontWeight: FontWeight.w700
          ),
        ),
        SizedBox(height: size.sizedBox10,),
        Container(
          padding: EdgeInsets.all(size.sizedBox12),
          width: size.widthCommon,
          decoration: BoxDecoration(
              color: white,
              border: Border.all(width: size.sizedBox1, color: greyCCCCCC)
          ),
          child: _ExplainSubText(text: component,),
        ),
        SizedBox(height: size.sizedBox10,)
      ],
    );
  }

}



class _ExplainMenuText extends StatelessWidget {
  final String text;
  const _ExplainMenuText({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          color: specBlue,
          fontWeight: FontWeight.w700,
          fontSize: context.read<VerseConfig>().size.body
      ),
    );
  }
}

class _ExplainSubText extends StatelessWidget {
  final String text;
  const _ExplainSubText({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text,
      style: TextStyle(
          color: bananaBack,
          fontWeight: FontWeight.w400,
          fontSize: context.read<VerseConfig>().size.body
      ),
    );
  }
}

class _ExplainRowCamera extends StatelessWidget {
  final String text1;
  final String text2;
  const _ExplainRowCamera({
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Container(
      color: white,
      padding: EdgeInsets.only(bottom: size.sizedBox12),
      child: Row(
        children: [
          Flexible(
            flex: 3,
            fit: FlexFit.tight,
            child: Text('카메라',
              style: TextStyle(
                  color: blackWrite,
                  fontWeight: FontWeight.w600,
                  fontSize: size.body
              ),
            ),
          ),
          Flexible(
            flex: 9,
            fit: FlexFit.tight,
            child: Container(
                padding:EdgeInsets.only(left: size.sizedBox15),
                decoration:BoxDecoration(
                    border: Border(left: BorderSide(color: greyDDDDDD, width: size.sizedBox1))
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child:  Text('전면',
                            style: TextStyle(
                                color: ultimateGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: size.body
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 11,
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                overflow:
                                TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: text1,
                                  style: TextStyle(
                                    fontWeight:
                                    FontWeight.w400,
                                    color: bananaBack,
                                    fontSize:
                                    size.body,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.sizedBox7_5,),
                    Row(
                      children: [
                        Flexible(
                          flex: 2,
                          fit: FlexFit.tight,
                          child: Text('후면',
                            style: TextStyle(
                                color: ultimateGrey,
                                fontWeight: FontWeight.w400,
                                fontSize: size.body
                            ),
                          ),
                        ),
                        Flexible(
                          flex: 11,
                          fit: FlexFit.tight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                overflow:
                                TextOverflow.ellipsis,
                                maxLines: 2,
                                textAlign: TextAlign.start,
                                text: TextSpan(
                                  text: text2,
                                  style: TextStyle(
                                    fontWeight:
                                    FontWeight.w400,
                                    color: bananaBack,
                                    fontSize:
                                    size.body,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                )
            ),
          ),
        ],
      ),
    );
  }
}