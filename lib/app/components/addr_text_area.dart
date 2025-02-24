import 'package:flutter/material.dart';
import '../css/size.dart';
import '../css/style.dart';


class AddrTextArea extends StatelessWidget {
  final String address;
  const AddrTextArea({
    required this.address,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //위치 텍스트
          Row(
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    vertical: WidgetSize(context).sizedBox6,
                    horizontal: WidgetSize(context).sizedBox8),
                decoration: BoxDecoration(
                    border: Border.all(
                        width: WidgetSize(context).sizedBox2,
                        color: Style.yellow),
                    borderRadius: BorderRadius.circular(999)),
                child: Text('현재위치',
                  style: TextStyle(color: Style.brown, fontSize: WidgetSize(context).sizedBox15, fontWeight: FontWeight.w400),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                )
              ),
              SizedBox(
                width: WidgetSize(context).sizedBox14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(address,
                      style: TextStyle(color: Colors.black, fontSize: WidgetSize(context).sizedBox19, fontWeight: FontWeight.w400),
                      maxLines: 4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
