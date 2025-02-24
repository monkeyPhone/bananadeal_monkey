import 'package:flutter/material.dart';


class WidgetSize{
  late BuildContext context;
  static final WidgetSize instance = WidgetSize._internal();
  WidgetSize._internal();

  factory WidgetSize(BuildContext context) {
    instance.context = context;
    return instance;
  }



  double get heightCommon => MediaQuery.of(context).size.height;
  double get widthCommon => MediaQuery.of(context).size.width;
  double get origin => MediaQuery.of(context).size.width > 600 ? ((heightCommon*78)/161) : widthCommon;
  double get originH => heightCommon;
  double get ratio58 => (5 / 8) * origin;
  double get ratio29 => ((5 / 8) * origin)/3;
  //theme
  double get extendsGap => origin*0.0000001;

  double get sign2RowGap => origin*0.0001;

  //common
  EdgeInsets get paddingBodyWhole => EdgeInsets.symmetric(horizontal: origin*0.0375);
  EdgeInsets get paddingBodyWholeIcon => EdgeInsets.only(left: origin*0.0375, right: origin*0.02326);

  double get fcmHeight => originH*0.25;
  double get height045 => originH*0.45;
  double get height05 => originH*0.5;
  double get height041 => originH*0.41;

  double get widthChatCili => origin*0.67;
  double get sizedButton => origin*0.125;
  double get widthDec => origin*0.69;
  double get widthCommon9_16 => (WidgetSize(context).widthCommon*9)/16;
  double get height60px => origin*0.14;

  // double get resize => ((heightCommon*78)/161)*0.14;


  double get height60px3n1 => origin*0.092;
  double get dialogCircular => origin*0.028;
  double get dialogString => origin*0.0466;
  double get titleButton => origin*0.044;
  //sign
  double get imageHeight => origin*0.46; //sign5 => sign_view_5
  double get imageWidth => origin*0.45; //sign5 => sign_view_5
  //src
  double get srcFloatingActionBarSize => origin*0.115; // srcComponent => SrcView
  //home
  double get bannerWidth => origin*0.5582;
  //store
  get paddingStoreList => EdgeInsets.only(right: origin*0.0375, left: origin*0.0375,); //store_container
  //map
  double get staticMapSize => originH * 0.65;
  double get staticModalSize => originH * 0.5;

  double get height001 =>originH*0.01;
  double get width01 => origin*0.1;
  double get width012 => origin*0.12;
  double get width016 => origin*0.16;
  double get width02 => origin*0.2;
  double get width03 => origin*0.3;
  double get width038 => origin*0.38;
  double get width0307 => origin*0.307;
  double get width001 => origin*0.01;
  double get width00234 => origin*0.0234;
  double get width0021 => origin*0.021;
  double get width0017 => origin*0.017;
  double get width002 => origin*0.02;
  double get width005 => origin*0.05;
  double get width007 => origin*0.07;
  double get width0007 => origin*0.007;
  double get width0001 => origin*0.001;
  double get width00025 => origin*0.0025;
  double get width003 => origin*0.03;
  double get width0038 => origin*0.038;
  double get width004 => origin*0.04;
  double get width0045 => origin*0.045;
  double get width0064 => origin*0.064;
  double get width0065 => origin*0.065;
  double get width00655 => origin*0.0655;
  double get width0221 => origin*0.221;
  double get width0291 => origin*0.291;
  double get width024 => origin*0.24;
  double get width027 => origin*0.27;
  double get width06 => origin*0.6;
  double get width09 => origin*0.9;
  double get width0921 => origin*0.921;
  double get width0925 => origin*0.925;
  double get width057 => origin*0.57;
  double get permissionGap => origin*0.07;

  double get chatBoxPadding => origin*0.028; // sizedBox12
  //common - SizedBox
  double get sizedBox0_5 => origin*0.00125;
  double get sizedBox1 => origin*0.0025;
  double get sizedBox1_5 => origin*0.0036;
  double get sizedBox2 => origin*0.0047;
  double get sizedBox2_5 => origin*0.00595;
  double get sizedBox3 => origin*0.0072;
  double get sizedBox4 => origin*0.0092;
  double get sizedBox5 => origin*0.01165;
  double get sizedBox6 => origin*0.013;
  double get sizedBox6_5 => origin*0.014;
  double get sizedBox7_5 => origin*0.018;
  double get sizedBox8 => origin*0.0187;
  double get sizedBox9 => origin*0.02;
  double get sizedBox9_5 => origin*0.022;
  double get sizedBox10 => origin*0.02326;
  double get sizedBox10_5 => origin*0.025;
  double get sizedBox11 => origin*0.0255;
  double get sizedBox12 => origin*0.028;
  double get sizedBox13 => origin*0.03;
  double get sizedBox14 => origin*0.0326;
  double get sizedBox15 => origin*0.035;
  double get sizedBox15_5 => origin*0.036;
  double get sizedBox16 => origin*0.0375;
  double get sizedBox18 => origin*0.042;
  double get etcTitleSize => origin*0.042;
  double get etcTimeGap => origin*0.014;
  double get etcTimeSize => origin*0.0326;
  double get etcContentSize => origin*0.0375;
  double get sizedBox17 => origin*0.0396;
  double get sizedBox19 => origin*0.0443;
  double get sizedBox20 => origin*0.0466;
  double get sizedBox21 => origin*0.0491;
  double get sizedBox22 => origin*0.0512;
  double get sizedBox24 => origin*0.056;
  double get sizedBox25 => origin*0.058;
  double get sizedBox26 => origin*0.06;
  double get sizedBox28 => origin*0.0655;
  double get sizedBox30 => origin*0.07;
  double get sizedBox32 => origin*0.075;
  double get sizedBox34 => origin*0.08;
  double get sizedBox35 => origin*0.082;
  double get sizedBox37 => origin*0.087;
  double get sizedBox39 => origin*0.0931;
  double get sizedBox40 => origin*0.094;
  double get sizedBox41 => origin*0.1;
  double get sizedBox42 => origin*0.10428;
  double get sizedBox45 => origin*0.105;
  double get sizedBox48 => origin*0.1122;
  double get sizedBox50 => origin*0.1165;
  double get sizedBox52 => origin*0.125;
  double get sizedBox57 => origin*0.13;
  double get sizedBox585 => origin*0.135;
  double get sizedBox62 => origin*0.15;
  double get sizedBox65 => origin*0.155;
  double get sizedBox70 => origin*0.1625;
  double get sizedBox72 => origin*0.17;
  double get sizedBox75 => origin*0.175;
  double get sizedBox77 => origin*0.18;
  double get sizedBox80 => origin*0.1865;
  double get sizedBox84 => origin*0.196;
  double get sizedBox87_5 => origin*0.21;
  double get sizedBox88 => origin*0.214;
  double get sizedBox96 => origin*0.22;
  double get sizedBox100 => origin*0.2326;
  double get sizedBox110 => origin*0.254;
  double get sizedBox114 => origin*0.26;
  double get sizedBox119 => origin*0.2769;
  double get sizedBox119_2 => origin*0.2769*1.95;
  double get sizedBox120 => origin*0.281;
  double get sizedBox121 => origin*0.2825;
  double get sizedBox126 => origin*0.295;
  double get sizedBox128 => origin*0.3;
  double get sizedBox134 => origin*0.31;
  double get sizedBox136 => origin*0.32;
  double get sizedBox144 => origin*0.34;
  double get sizedBox148 => origin * 0.351;
  double get sizedBox150 => origin*0.355;
  double get sizedBox151 => origin*0.36;
  double get sizedBox162 => origin*0.377;
  double get sizedBox165 => origin*0.388;
  double get sizedBox170 => origin*0.4;
  double get sizedBox181_5 => origin*0.42;
  double get sizedBox181 => origin*0.424;
  double get sizedBox182 => origin*0.43;
  double get sizedBox190 => origin*0.45;
  double get sizedBox200 => origin*0.5;
  double get sizedBox220 => origin*0.513;
  double get sizedBox220_5 => origin*0.517;
  double get sizedBox222 => origin*0.531;
  double get sizedBox225 => origin*0.535;

  double get characterSize => origin*0.55;

  double get sign2w1 => origin*0.12;
  double get sign2w2 => origin*0.52;

  double get sign2authE => origin*0.445;
  double get sign2authE2 => origin*0.4;

  double get sizedBox0_1 => origin*0.1;
  double get sizedBox0_6 => origin*0.6;
  double get sizedBox0_62 => origin*0.62;
  double get sizedBox0_68 => origin*0.68326;
  double get sizedBox1_4 => origin*1.4;
  double get height1_2 => originH*1.2;

  double get etcList => origin;
  double get chatMaxWidth065 => origin*0.65;
  double get chatMaxWidth075 => origin*0.75;
  double get textFromWidth => origin*0.7;

  double get etc01 => origin*0.01;
  double get etc012 => origin*0.012;
  double get etc005 => origin*0.005;
  double get etc08 => origin*0.08;
  double get etc01325 => origin*0.1325;
  double get etc0135 => origin*0.135;
  double get etc0156 => origin*0.156;
  double get etc041 => origin*0.41;
  double get etcH048 => originH*0.48;
  double get introCarousel => originH*0.72;
  double get introImage => originH*0.8;
  double get reviewDialog => origin*0.85;
  double get deviceMent => originH*0.0;



  double get splashPad => originH*0.05;
  double get dealPad=> origin*0.05;
  double get etcStep => origin*0.052;
  double get etcPad => origin*0.055;
}
