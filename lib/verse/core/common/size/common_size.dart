import 'package:flutter/material.dart';

import '../../util/color/const_color.dart' as Style;
import '../../util/string/const_label.dart' as Label;

class CommonSize{
  final double widthCommon;
  final double heightCommon;
  final double origin;

  final double staticMapSize;
  final double staticModalSize;

  // Height related
  final double height045;
  final double height05;
  final double height041;
  final double height001;
  final double height025;
  final double height1_2;
  final double etcH048;
  final double introCarousel;
  final double introImage;
  final double deviceMent;
  final double splashPad;

  // Sized related
  final double sizedSheet;
  final double sizedButtonNew;
  final double sizedButton;
  final double sizedAppbar;
  final double sizedNav;
  final double sizedNavWild;
  final double sizedDialogButton;
  final double sizedCategory;

  // Grid sizes
  final double sized32grid;
  final double sized24grid;
  final double sized20grid;
  final double sized16grid;
  final double sized12grid;
  final double sized8grid;
  final double sized6grid;
  final double sized4grid;
  final double sized2grid;

  // Padding sizes
  final double sizedPadding2;
  final double sizedPaddingQ;
  final double sizedPaddingW;
  final double sizedPaddingHalf;
  final double sizedPaddingHalfDouble;
  final double sizedPaddingOnlyAppBar;
  final double sizedSideGap;

  // Title sizes
  final double titleName;
  final double titleMain;
  final double titleButton;
  final double titleLittle;
  final double titleLarge;
  final double title27;

  // Text sizes
  final double body;
  final double callout;
  final double sub;
  final double special;
  final double foot;
  final double caption;

  // Theme
  final double extendsGap;
  final double sign2RowGap;

  // Width related
  final double widthChatCili;
  final double widthDec;
  final double widthCommon9_16;
  final double width01;
  final double width012;
  final double width016;
  final double width02;
  final double width03;
  final double width038;
  final double width0307;
  final double width001;
  final double width00234;
  final double width0021;
  final double width0017;
  final double width002;
  final double width005;
  final double width007;
  final double width0007;
  final double width0001;
  final double width00025;
  final double width003;
  final double width0038;
  final double width004;
  final double width0045;
  final double width0064;
  final double width0065;
  final double width00655;
  final double width0221;
  final double width0291;
  final double width024;
  final double width027;
  final double width06;
  final double width09;
  final double width0921;
  final double width0925;
  final double width057;

  // Heights
  final double height60px;
  final double height60px3n1;
  final double dialogCircular;
  final double dialogString;
  final double imageHeight;
  final double ratio58;
  final double ratio58_2;
  final double ratio58_33;
  final double ratio58_4;
  final double ratio58_3;
  final double ratioWidth;
  final double ratioHeight;
  final double imageWidth;
  final double srcFloatingActionBarSize;
  final double bannerWidth;
  final double permissionGap;
  final double characterSize;
  final double chatBoxPadding;

  // Sized boxes
  final double sizedBox0_5;
  final double sizedBox0_7;
  final double sizedBox1;
  final double sizedBox1_5;
  final double sizedBox2;
  final double sizedBox2_5;
  final double sizedBox3;
  final double sizedBox3_5;
  final double sizedBox4;
  final double sizedBox5;
  final double sizedBox6;
  final double sizedBox6_5;
  final double sizedBox7_5;
  final double sizedBox8;
  final double sizedBox9;
  final double sizedBox9_5;
  final double sizedBox10;
  final double sizedBox10_5;
  final double sizedBox11;
  final double sizedBox12;
  final double sizedBox13;
  final double sizedBox14;
  final double sizedBox15;
  final double sizedBox15_5;
  final double sizedBox16;
  final double sizedBox17;
  final double sizedBox18;
  final double sizedBox19;
  final double sizedBox20;
  final double sizedBox21;
  final double sizedBox22;
  final double sizedBox24;
  final double sizedBox25;
  final double sizedBox26;
  final double sizedBox28;
  final double sizedBox30;
  final double sizedBox32;
  final double sizedBox34;
  final double sizedBox35;
  final double sizedBox37;
  final double sizedBox39;
  final double sizedBox40;
  final double sizedBox42;
  final double sizedBox45;
  final double sizedBox48;
  final double sizedBox50;
  final double sizedSide1;
  final double sizedBox57;
  final double sizedBox585;
  final double sizedBox62;
  final double sizedBox65;
  final double sizedBox70;
  final double sizedBox72;
  final double sizedBox75;
  final double sizedBox77;
  final double sizedBox80;
  final double sizedBox84;
  final double sizedBox87_5;
  final double sizedBox88;
  final double sizedBox96;
  final double sizedBox100;
  final double sizedBox110;
  final double sizedBox114;
  final double sizedBox119;
  final double sizedBox119_2;
  final double sizedBox120;
  final double sizedBox121;
  final double sizedBox126;
  final double sizedBox128;
  final double sizedBox134;
  final double sizedBox136;
  final double sizedBox144;
  final double sizedBox148;
  final double sizedBox150;
  final double sizedBox151;
  final double sizedBox162;
  final double sizedBox165;
  final double sizedBox170;
  final double sizedBox181_5;
  final double sizedBox181;
  final double sizedBox182;
  final double sizedBox190;
  final double sizedBox200;
  final double sizedBox220;
  final double sizedBox220_5;
  final double sizedBox222;
  final double sizedBox225;

  // ETC sizes
  final double etcTitleSize;
  final double etcTimeGap;
  final double etcTimeSize;
  final double etcContentSize;
  final double sign2w1;
  final double sign2w2;
  final double listBox;
  final double sign2authE;
  final double sign2authE2;
  final double sizedBox0_1;
  final double sizedBox0_6;
  final double sizedBox0_62;
  final double sizedBox0_68;
  final double sizedBox1_4;
  final double etcList;
  final double chatMaxWidth065;
  final double chatMaxWidth075;
  final double textFromWidth;
  final double etc01;
  final double etc012;
  final double etc005;
  final double etc08;
  final double etc01325;
  final double etc0135;
  final double etc0156;
  final double etc041;
  final double reviewDialog;
  final double dealPad;
  final double etcStep;
  final double etcPad;

  const CommonSize({
    required this.widthCommon,
    required this.heightCommon,
    required this.origin,
  })
      :
        staticMapSize = heightCommon * 0.65,
        staticModalSize = heightCommon * 0.5,
        height045 = heightCommon * 0.45,
        height05 = heightCommon * 0.5,
        height041 = heightCommon * 0.41,
        height001 = heightCommon * 0.01,
        height025 = heightCommon * 0.25,
        height1_2 = heightCommon * 1.2,
        etcH048 = heightCommon * 0.48,
        introCarousel = heightCommon * 0.72,
        introImage = heightCommon * 0.8,
        deviceMent = heightCommon * 0.0,
        splashPad = heightCommon * 0.05,
        sizedSheet = origin * 0.14,
        sizedButtonNew = origin * 0.135,
        sizedButton = origin * 0.125,
        sizedAppbar = origin * 0.12,
        sizedNav = (origin * 0.135) + (origin * 0.04),  // sizedButtonNew + sized16grid
        sizedNavWild = (origin * 0.135) + (origin * 0.08),  // sizedButtonNew + sized32grid
        sizedDialogButton = origin * 0.115,
        sizedCategory = origin * 0.11,
        sized32grid = origin * 0.08,
        sized24grid = origin * 0.06,
        sized20grid = origin * 0.05,
        sized16grid = origin * 0.04,
        sized12grid = origin * 0.03,
        sized8grid = origin * 0.02,
        sized6grid = origin * 0.015,
        sized4grid = origin * 0.01,
        sized2grid = origin * 0.005,
        sizedPadding2 = origin * 0.07,
        sizedPaddingQ = origin * 0.045,
        sizedPaddingW = origin * 0.025,
        sizedPaddingHalf = origin * 0.02,
        sizedPaddingHalfDouble = origin * 0.015,
        sizedPaddingOnlyAppBar = origin * 0.03,
        sizedSideGap = (origin * 0.04) - (origin * 0.03),  // sized16grid - sizedPaddingOnlyAppBar
        titleName = origin * 0.055,
        titleMain = origin * 0.049,
        titleButton = origin * 0.044,
        titleLittle = origin * 0.041,
        titleLarge = origin * 0.077,
        title27 = origin * 0.063,
        body = origin * 0.038,
        callout = origin * 0.035,
        sub = origin * 0.033,
        special = origin * 0.030,
        foot = origin * 0.028,
        caption = origin * 0.026,
        extendsGap = origin * 0.0000001,
        sign2RowGap = origin * 0.0001,
        widthChatCili = origin * 0.67,
        widthDec = origin * 0.69,
        widthCommon9_16 = (origin * 9) / 16,
        width01 = origin * 0.1,
        width012 = origin * 0.12,
        width016 = origin * 0.16,
        width02 = origin * 0.2,
        width03 = origin * 0.3,
        width038 = origin * 0.38,
        width0307 = origin * 0.307,
        width001 = origin * 0.01,
        width00234 = origin * 0.0234,
        width0021 = origin * 0.021,
        width0017 = origin * 0.017,
        width002 = origin * 0.02,
        width005 = origin * 0.05,
        width007 = origin * 0.07,
        width0007 = origin * 0.007,
        width0001 = origin * 0.001,
        width00025 = origin * 0.0025,
        width003 = origin * 0.03,
        width0038 = origin * 0.038,
        width004 = origin * 0.04,
        width0045 = origin * 0.045,
        width0064 = origin * 0.064,
        width0065 = origin * 0.065,
        width00655 = origin * 0.0655,
        width0221 = origin * 0.221,
        width0291 = origin * 0.291,
        width024 = origin * 0.24,
        width027 = origin * 0.27,
        width06 = origin * 0.6,
        width09 = origin * 0.9,
        width0921 = origin * 0.921,
        width0925 = origin * 0.925,
        width057 = origin * 0.57,
        height60px = origin * 0.14,
        height60px3n1 = origin * 0.092,
        dialogCircular = origin * 0.028,
        dialogString = origin * 0.0468,
        imageHeight = (1/1.618) * origin,
        ratio58 = (5/8) * origin,
        ratio58_2 = ((5/8) * origin) / 2,
        ratio58_33 = ((5/8) * origin) / 3,
        ratio58_4 = ((5/8) * origin) / 4,
        ratio58_3 = ((5/8) * origin) / 4.2,
        ratioWidth = (5/8) * origin,
        ratioHeight = ((5/8) * origin * 5) / 8,
        imageWidth = origin * 0.45,
        srcFloatingActionBarSize = origin * 0.115,
        bannerWidth = origin * 0.5582,
        permissionGap = origin * 0.07,
        characterSize = origin * 0.55,
        chatBoxPadding = origin * 0.028,
        sizedBox0_5 = origin * 0.00125,
        sizedBox0_7 = origin * 0.00185,
        sizedBox1 = origin * 0.0025,
        sizedBox1_5 = origin * 0.0036,
        sizedBox2 = origin * 0.0046,
        sizedBox2_5 = origin * 0.0059,
        sizedBox3 = origin * 0.0072,
        sizedBox3_5 = origin * 0.008,
        sizedBox4 = origin * 0.0092,
        sizedBox5 = origin * 0.01165,
        sizedBox6 = origin * 0.013,
        sizedBox6_5 = origin * 0.014,
        sizedBox7_5 = origin * 0.018,
        sizedBox8 = origin * 0.0187,
        sizedBox9 = origin * 0.02,
        sizedBox9_5 = origin * 0.022,
        sizedBox10 = origin * 0.02326,
        sizedBox10_5 = origin * 0.025,
        sizedBox11 = origin * 0.0255,
        sizedBox12 = origin * 0.028,
        sizedBox13 = origin * 0.03,
        sizedBox14 = origin * 0.0326,
        sizedBox15 = origin * 0.035,
        sizedBox15_5 = origin * 0.036,
        sizedBox16 = origin * 0.0375,
        sizedBox17 = origin * 0.04,
        sizedBox18 = origin * 0.042,
        sizedBox19 = origin * 0.0443,
        sizedBox20 = origin * 0.0466,
        sizedBox21 = origin * 0.0491,
        sizedBox22 = origin * 0.0512,
        sizedBox24 = origin * 0.056,
        sizedBox25 = origin * 0.058,
        sizedBox26 = origin * 0.06,
        sizedBox28 = origin * 0.0655,
        sizedBox30 = origin * 0.07,
        sizedBox32 = origin * 0.075,
        sizedBox34 = origin * 0.08,
        sizedBox35 = origin * 0.082,
        sizedBox37 = origin * 0.087,
        sizedBox39 = origin * 0.0931,
        sizedBox40 = origin * 0.094,
        sizedBox42 = origin * 0.10428,
        sizedBox45 = origin * 0.105,
        sizedBox48 = origin * 0.1122,
        sizedBox50 = origin * 0.1165,
        sizedSide1 = origin * 0.127,
        sizedBox57 = origin * 0.13,
        sizedBox585 = origin * 0.135,
        sizedBox62 = origin * 0.15,
        sizedBox65 = origin * 0.155,
        sizedBox70 = origin * 0.1625,
        sizedBox72 = origin * 0.17,
        sizedBox75 = origin * 0.175,
        sizedBox77 = origin * 0.18,
        sizedBox80 = origin * 0.1865,
        sizedBox84 = origin * 0.196,
        sizedBox87_5 = origin * 0.21,
        sizedBox88 = origin * 0.214,
        sizedBox96 = origin * 0.22,
        sizedBox100 = origin * 0.2326,
        sizedBox110 = origin * 0.254,
        sizedBox114 = origin * 0.26,
        sizedBox119 = origin * 0.2769,
        sizedBox119_2 = origin * 0.2769 * 1.95,
        sizedBox120 = origin * 0.281,
        sizedBox121 = origin * 0.2825,
        sizedBox126 = origin * 0.295,
        sizedBox128 = origin * 0.3,
        sizedBox134 = origin * 0.31,
        sizedBox136 = origin * 0.32,
        sizedBox144 = origin * 0.34,
        sizedBox148 = origin * 0.351,
        sizedBox150 = origin * 0.355,
        sizedBox151 = origin * 0.36,
        sizedBox162 = origin * 0.377,
        sizedBox165 = origin * 0.388,
        sizedBox170 = origin * 0.4,
        sizedBox181_5 = origin * 0.42,
        sizedBox181 = origin * 0.424,
        sizedBox182 = origin * 0.43,
        sizedBox190 = origin * 0.45,
        sizedBox200 = origin * 0.5,
        sizedBox220 = origin * 0.513,
        sizedBox220_5 = origin * 0.517,
        sizedBox222 = origin * 0.531,
        sizedBox225 = origin * 0.535,
        etcTitleSize = origin * 0.042,
        etcTimeGap = origin * 0.014,
        etcTimeSize = origin * 0.0326,
        etcContentSize = origin * 0.0375,
        sign2w1 = origin * 0.12,
        sign2w2 = origin * 0.52,
        listBox = origin * 0.48,
        sign2authE = origin * 0.445,
        sign2authE2 = origin * 0.4,
        sizedBox0_1 = origin * 0.1,
        sizedBox0_6 = origin * 0.6,
        sizedBox0_62 = origin * 0.62,
        sizedBox0_68 = origin * 0.68326,
        sizedBox1_4 = origin * 1.4,
        etcList = origin,
        chatMaxWidth065 = origin * 0.65,
        chatMaxWidth075 = origin * 0.75,
        textFromWidth = origin * 0.7,
        etc01 = origin * 0.01,
        etc012 = origin * 0.012,
        etc005 = origin * 0.005,
        etc08 = origin * 0.08,
        etc01325 = origin * 0.1325,
        etc0135 = origin * 0.135,
        etc0156 = origin * 0.156,
        etc041 = origin * 0.41,
        reviewDialog = origin * 0.85,
        dealPad = origin * 0.05,
        etcStep = origin * 0.052,
        etcPad = origin * 0.055;




  //common
  EdgeInsets get paddingBodyWhole => EdgeInsets.symmetric(horizontal: origin*0.0375);
  EdgeInsets get paddingBodyWholeIcon => EdgeInsets.only(left: origin*0.0375, right: origin*0.02326);


  //store
  get paddingStoreList => EdgeInsets.only(right: origin*0.0375, left: origin*0.0375,); //store_container
  //map


  TextStyle switchTextStyle({String? label}) => switch(label) {

    Label.titleMain => TextStyle(
        color: Style.bananaBack,
        fontSize: titleMain,
        fontWeight: FontWeight.w400
    ),
    Label.titleMainGreenBold => TextStyle(
        color: Colors.green,
        fontSize: titleName,
        fontWeight: FontWeight.w700
    ),
    Label.titleMainBold => TextStyle(
        color: Style.bananaBack,
        fontSize: titleMain,
        fontWeight: FontWeight.w600
    ),
    Label.titleNameBold => TextStyle(
        color: Style.bananaBack,
        fontSize: titleName,
        fontWeight: FontWeight.w600
    ),
    Label.titleButton => TextStyle(
        color: Style.bananaBack,
        fontSize: titleButton,
        fontWeight: FontWeight.w400
    ),
    Label.titleButtonBold => TextStyle(
        color: Style.bananaBack,
        fontSize: titleButton,
        fontWeight: FontWeight.w600
    ),
    Label.titleButtonBrownBold => TextStyle(
        color: Style.brown,
        fontSize: titleButton,
        fontWeight: FontWeight.w600
    ),
    Label.titleButtonBrown => TextStyle(
        color: Style.brown,
        fontSize: titleButton,
        fontWeight: FontWeight.w400
    ),
    Label.titleButtonGrey => TextStyle(
        color: Style.ultimateGrey,
        fontSize: titleButton,
        fontWeight: FontWeight.w500
    ),
    Label.titleButtonGreyBold => TextStyle(
        color: Style.greyWrite,
        fontSize: titleButton,
        fontWeight: FontWeight.w600
    ),
    Label.titleButtonRedBold => TextStyle(
        color: Style.red,
        fontSize: titleButton,
        fontWeight: FontWeight.w600
    ),
    Label.titleLittle =>TextStyle(
        color: Style.bananaBack,
        fontSize: titleLittle,
        fontWeight: FontWeight.w400
    ),
    Label.titleLittleYellowBold =>TextStyle(
        color: Style.yellow,
        fontSize: titleLittle,
        fontWeight: FontWeight.w600
    ),
    Label.titleLittleBrown =>TextStyle(
        color: Style.brown,
        fontSize: titleLittle,
        fontWeight: FontWeight.w400
    ),
    Label.titleLittleBrownBold =>TextStyle(
        color: Style.brown,
        fontSize: titleLittle,
        fontWeight: FontWeight.w600
    ),
    Label.titleLittleGrey =>TextStyle(
        color: Style.greyWrite,
        fontSize: titleLittle,
        fontWeight: FontWeight.w400
    ),
    Label.titleLittleGreyBold =>TextStyle(
        color: Style.greyWrite,
        fontSize: titleLittle,
        fontWeight: FontWeight.w600
    ),
    Label.titleLittleWhite =>TextStyle(
        color: Style.white,
        fontSize: titleLittle,
        fontWeight: FontWeight.w400
    ),
    Label.titleLittleBold =>TextStyle(
        color: Style.bananaBack,
        fontSize: titleLittle,
        fontWeight: FontWeight.w600
    ),
  // body =>TextStyle(
  //     color: Style.bananaBack,
  //     fontSize: WidgetSize(context).body,
  //     fontWeight: FontWeight.w400
  // ),
    Label.bodyRed =>TextStyle(
        color: Style.red,
        fontSize: body,
        fontWeight: FontWeight.w400
    ),
    Label.bodyBlue =>TextStyle(
        color: Colors.blue,
        fontSize: body,
        fontWeight: FontWeight.w400
    ),
    Label.bodyRedB =>TextStyle(
        color: Style.red,
        fontSize: body,
        fontWeight: FontWeight.w600
    ),
    Label.bodyBlueB =>TextStyle(
        color: Colors.blue,
        fontSize: body,
        fontWeight: FontWeight.w600
    ),
    Label.bodyRedBold =>TextStyle(
        color: Style.red,
        fontSize: special,
        fontWeight: FontWeight.w600
    ),
    Label.bodyBold =>TextStyle(
        color: Style.bananaBack,
        fontSize: body,
        fontWeight: FontWeight.w600
    ),
    Label.bodyWhite =>TextStyle(
        color: Style.white,
        fontSize: body,
        fontWeight: FontWeight.w400
    ),
    Label.bodyWhiteBold =>TextStyle(
        color: Style.white,
        fontSize: body,
        fontWeight: FontWeight.w600
    ),
    Label.bodyGrey =>TextStyle(
        color: Style.greyWrite,
        fontSize: body,
        fontWeight: FontWeight.w400
    ),
    Label.bodyBrown =>TextStyle(
        color: Style.brown,
        fontSize: body,
        fontWeight: FontWeight.w400
    ),
    Label.bodyGreyBold =>TextStyle(
        color: Style.greyWrite,
        fontSize: body,
        fontWeight: FontWeight.w600
    ),
    Label.bodyBrownBold => TextStyle(
        color: Style.brown,
        fontSize: body,
        fontWeight: FontWeight.w600
    ),

    Label.sub => TextStyle(
        color: Style.bananaBack,
        fontSize: sub,
        fontWeight: FontWeight.w400
    ),
    Label.subBold => TextStyle(
        color: Style.bananaBack,
        fontSize: sub,
        fontWeight: FontWeight.w600
    ),
    Label.subGreyBold => TextStyle(
        color: Style.greyWrite,
        fontSize: sub,
        fontWeight: FontWeight.w600
    ),
    Label.subWhite => TextStyle(
        color: Style.white,
        fontSize: sub,
        fontWeight: FontWeight.w400
    ),
    Label.subRed => TextStyle(
        color: Style.red,
        fontSize: sub,
        fontWeight: FontWeight.w400
    ),
    Label.subRedB => TextStyle(
        color: Style.red,
        fontSize: sub,
        fontWeight: FontWeight.w600
    ),
    Label.subBlue => TextStyle(
        color: Colors.blue,
        fontSize: sub,
        fontWeight: FontWeight.w400
    ),
    Label.subYellow => TextStyle(
        color: Style.yellow,
        fontSize: sub,
        fontWeight: FontWeight.w400
    ),
    Label.subBrown => TextStyle(
        color: Style.brown,
        fontSize: sub,
        fontWeight: FontWeight.w400
    ),
    Label.subBrownBold => TextStyle(
        color: Style.brown,
        fontSize: sub,
        fontWeight: FontWeight.w600
    ),
    Label.subGrey => TextStyle(
        color: Style.greyWrite,
        fontSize: sub,
        fontWeight: FontWeight.w400
    ),
    Label.subGreyUp => TextStyle(
        color: Style.grey666666,
        fontSize: sub,
        fontWeight: FontWeight.w500
    ),
    Label.subAmber => TextStyle(
        color: Colors.brown,
        fontSize: sub,
        fontWeight: FontWeight.w400
    ),

    Label.foot => TextStyle(
        color: Style.bananaBack,
        fontSize: foot,
        fontWeight: FontWeight.w400
    ),
    Label.footBold => TextStyle(
        color: Style.bananaBack,
        fontSize: foot,
        fontWeight: FontWeight.w600
    ),
    Label.footBrown => TextStyle(
        color: Style.brown,
        fontSize: foot,
        fontWeight: FontWeight.w400
    ),
    Label.footGrey => TextStyle(
        color: Style.greyWrite,
        fontSize: foot,
        fontWeight: FontWeight.w400
    ),
    Label.footGreyBold => TextStyle(
        color: Style.greyWrite,
        fontSize: foot,
        fontWeight: FontWeight.w600
    ),

    Label.caption => TextStyle(
        color: Style.bananaBack,
        fontSize: caption,
        fontWeight: FontWeight.w400
    ),
    Label.captionBold => TextStyle(
        color: Style.bananaBack,
        fontSize: caption,
        fontWeight: FontWeight.w600
    ),

    Label.titleLarge => TextStyle(
        color: Style.bananaBack,
        fontSize: titleLarge,
        fontWeight: FontWeight.w400
    ),
    Label.titleLargeBold => TextStyle(
        color: Style.bananaBack,
        fontSize: titleLarge,
        fontWeight: FontWeight.w600
    ),

    Label.title27 => TextStyle(
        color: Style.bananaBack,
        fontSize: title27,
        fontWeight: FontWeight.w400
    ),
    Label.title27Bold => TextStyle(
        color: Style.bananaBack,
        fontSize: title27,
        fontWeight: FontWeight.w600
    ),
    Label.title27Ex => TextStyle(
        color: Style.bananaBack,
        fontSize: title27,
        fontWeight: FontWeight.w500
    ),

    Label.callout => TextStyle(
        color: Style.bananaBack,
        fontSize: callout,
        fontWeight: FontWeight.w400
    ),
    Label.calloutGrey => TextStyle(
        color: Style.greyWrite,
        fontSize: callout,
        fontWeight: FontWeight.w400
    ),
    Label.calloutGreyBold => TextStyle(
        color: Style.greyWrite,
        fontSize: callout,
        fontWeight: FontWeight.w600
    ),
    Label.calloutBold => TextStyle(
        color: Style.bananaBack,
        fontSize: callout,
        fontWeight: FontWeight.w600
    ),
    Label.calloutWhiteBold => TextStyle(
        color: Style.white,
        fontSize: callout,
        fontWeight: FontWeight.w600
    ),
    Label.calloutRed => TextStyle(
        color: Style.cocacolaRed,
        fontSize: callout,
        fontWeight: FontWeight.w400
    ),
    _ =>
        TextStyle(
            color: Style.bananaBack,
            fontSize: body,
            fontWeight: FontWeight.w400
        ),
  };
}


