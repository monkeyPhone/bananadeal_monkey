import 'dart:convert';
import 'package:banana_deal_by_monkeycompany/app/app_outs/function/app_outs_function.dart';
import 'package:banana_deal_by_monkeycompany/app/css/size.dart';
import 'package:banana_deal_by_monkeycompany/app/css/style.dart';
import 'package:banana_deal_by_monkeycompany/app/models/deal/phone_rate_plan_detail.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:get/get.dart';

class RateDetailDialogUi extends StatefulWidget {
  final String pIdx;
  final String baseUrl;
  const RateDetailDialogUi({super.key,
    required this.pIdx,
    required this.baseUrl
  });

  @override
  State<RateDetailDialogUi> createState() => _RateDetailDialogUiState();
}

class _RateDetailDialogUiState extends State<RateDetailDialogUi> {
  late ScrollController _controller;

  Future<List<detailList>> _getDetail({
    required String pIdx,
    required String monkeyUrl
  }) async{
    final String apiRoute = '$monkeyUrl.monkeyphone.co.kr/_app/plan/modeDetailData?p_idx=$pIdx';
    final BaseOptions baseOptions = BaseOptions(
      connectTimeout: const Duration(seconds: 15),
      sendTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 30),
    );
    final Dio dio = Dio(baseOptions);
    try {
      var response =
      await dio.get(apiRoute);
      Map<String, dynamic> data = jsonDecode(response.data);
      final PhoneRatePlanDetail entity = PhoneRatePlanDetail.fromJson(data);
      return entity.list;
    } catch (e) {
      return [];
    } finally{
      dio.close();
    }
  }

  @override
  void initState(){
    // TODO: implement initState
    super.initState();
    _controller = ScrollController();

  }


  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<detailList>>(
        future: _getDetail(pIdx: widget.pIdx, monkeyUrl: widget.baseUrl),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // 로딩 중
          }
          else if (snapshot.hasError) {
            Get.back();
            return CircularProgressIndicator(); // 에러 발생
          }
          else if (snapshot.hasData){
            if(snapshot.data!.isNotEmpty){
              return _Content(
                detail: snapshot.data!.first,
                scrollController: _controller,
              );
            }
            else {
              Get.back();
              return CircularProgressIndicator();
            }
          }
          else {
            Get.back();
            return CircularProgressIndicator(); // 데이터가 없는 경우
          }

        }
    );

  }
}


class _Content extends StatelessWidget {
  final detailList detail;
  final ScrollController scrollController;
  const _Content({required this.detail,
    required this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    final WidgetSize size = WidgetSize(context);
    return Dialog(
      backgroundColor: Style.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(size.dialogCircular))
      ),
      child: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                vertical: size.sizedBox16
            ),
            child: Scrollbar(
              controller: scrollController,
              thumbVisibility: true,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                    horizontal:  size.sizedBox16,
                    vertical: size.sizedBox16
                ),
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                child: SizedBox(
                  width: size.widthCommon,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Text(
                              detail.pPlanName!,
                              style: TextStyle(
                                  fontSize: size.sizedBox20,
                                  fontWeight: FontWeight.w600
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )

                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.sizedBox16
                            ),
                            child: Icon(Icons.close, size: size.sizedBox26, color: Style.white,),
                          )
                        ],
                      ),
                      SizedBox(
                        height: WidgetSize(context).sizedBox24,
                      ),
                      _IconArea(
                        size: size,
                        iconText: [
                          detail.pTel!, detail.pSms!, detail.pLte!
                        ],
                      ),
                      SizedBox(
                        height: WidgetSize(context).sizedBox24,
                      ),
                      HtmlWidget(
                        AppOutsFunction().convertHtml(detail.pInfo!),
                        textStyle: TextStyle(
                            fontSize: size.sizedBox15,
                            fontWeight: FontWeight.w400
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.sizedBox16,
            right: size.sizedBox16,
            child: GestureDetector(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Icon(Icons.close, size: size.sizedBox26,)
            ),
          ),
        ],
      ),
    );
  }
}




class _IconArea extends StatelessWidget {
  final WidgetSize size;
  final List<String> iconText;
  const _IconArea({
    required this.size,
    required this.iconText
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment:  CrossAxisAlignment.center,
        children: [
          Flexible(
            child:  _IconRow(
              size: size,
              icon: Icons.phone_outlined,
              text: iconText[0],
            ),
          ),
          Flexible(
            child:  _IconRow(
              size: size,
              icon: Icons.mail_outline,
              text: iconText[1],
            ),
          ),
          Flexible(
            child:  _IconRow(
              size: size,
              icon: Icons.signal_cellular_alt,
              text: iconText[2],
            ),
          ),
        ],
      ),
    );
  }
}


class _IconRow extends StatelessWidget {
  final IconData icon;
  final String text;
  final WidgetSize size;
  const _IconRow({
    required this.icon,
    required this.text,
    required this.size
  });

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
            flex: 2,
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Icon(icon,
                  size: size.sizedBox17,
                )
            )
        ),
        SizedBox(
          width: size.sizedBox16,
        ),
        Flexible(
            flex: 4,
            child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  text,
                  style: TextStyle(
                      fontSize: size.sizedBox15,
                      fontWeight: FontWeight.w600,
                      color: Style.blackWrite
                  ),
                )
            )
        ),
      ],
    );
  }
}