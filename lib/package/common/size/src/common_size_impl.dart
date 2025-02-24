import 'package:banana_deal_by_monkeycompany/package/common/edge/common_edge.dart';
import 'package:banana_deal_by_monkeycompany/package/common/size/common_size.dart';

class CommonSizeImpl implements CommonSize {
  @override
  final CommonEdge edge;
  @override
  final double widthCommon;
  @override
  final double heightCommon;
  @override
  final double origin;

  @override
  final double staticMapSize;
  @override
  final double staticModalSize;

  // Height related
  @override
  final double height045;
  @override
  final double height05;
  @override
  final double height041;
  @override
  final double height001;
  @override
  final double height025;
  @override
  final double height1_2;
  @override
  final double etcH048;
  @override
  final double introCarousel;
  @override
  final double introImage;
  @override
  final double deviceMent;
  @override
  final double splashPad;

  // Sized related
  @override
  final double sizedSheet;
  @override
  final double sizedButtonNew;
  @override
  final double sizedButton;
  @override
  final double sizedAppbar;
  @override
  final double sizedNav;
  @override
  final double sizedNavWild;
  @override
  final double sizedDialogButton;
  @override
  final double sizedCategory;

  // Grid sizes
  @override
  final double sized32grid;
  @override
  final double sized24grid;
  @override
  final double sized20grid;
  @override
  final double sized16grid;
  @override
  final double sized12grid;
  @override
  final double sized8grid;
  @override
  final double sized6grid;
  @override
  final double sized4grid;
  @override
  final double sized2grid;

  // Padding sizes
  @override
  final double sizedPadding2;
  @override
  final double sizedPaddingQ;
  @override
  final double sizedPaddingW;
  @override
  final double sizedPaddingHalf;
  @override
  final double sizedPaddingHalfDouble;
  @override
  final double sizedPaddingOnlyAppBar;
  @override
  final double sizedSideGap;

  // Title sizes
  @override
  final double titleName;
  @override
  final double titleMain;
  @override
  final double titleButton;
  @override
  final double titleLittle;
  @override
  final double titleLarge;
  @override
  final double title27;

  // Text sizes
  @override
  final double body;
  @override
  final double callout;
  @override
  final double sub;
  @override
  final double special;
  @override
  final double foot;
  @override
  final double caption;

  // Theme
  @override
  final double extendsGap;
  @override
  final double sign2RowGap;

  // Width related
  @override
  final double widthChatCili;
  @override
  final double widthDec;
  @override
  final double widthCommon9_16;
  @override
  final double width01;
  @override
  final double width012;
  @override
  final double width016;
  @override
  final double width02;
  @override
  final double width03;
  @override
  final double width038;
  @override
  final double width0307;
  @override
  final double width001;
  @override
  final double width00234;
  @override
  final double width0021;
  @override
  final double width0017;
  @override
  final double width002;
  @override
  final double width005;
  @override
  final double width007;
  @override
  final double width0007;
  @override
  final double width0001;
  @override
  final double width00025;
  @override
  final double width003;
  @override
  final double width0038;
  @override
  final double width004;
  @override
  final double width0045;
  @override
  final double width0064;
  @override
  final double width0065;
  @override
  final double width00655;
  @override
  final double width0221;
  @override
  final double width0291;
  @override
  final double width024;
  @override
  final double width027;
  @override
  final double width06;
  @override
  final double width09;
  @override
  final double width0921;
  @override
  final double width0925;
  @override
  final double width057;

  // Heights
  @override
  final double height60px;
  @override
  final double height60px3n1;
  @override
  final double dialogCircular;
  @override
  final double dialogString;
  @override
  final double imageHeight;
  @override
  final double ratio58;
  @override
  final double ratio58_2;
  @override
  final double ratio58_33;
  @override
  final double ratio58_4;
  @override
  final double ratio58_3;
  @override
  final double ratioWidth;
  @override
  final double ratioHeight;
  @override
  final double imageWidth;
  @override
  final double srcFloatingActionBarSize;
  @override
  final double bannerWidth;
  @override
  final double permissionGap;
  @override
  final double characterSize;
  @override
  final double chatBoxPadding;

  // Sized boxes
  @override
  final double sizedBox0_5;
  @override
  final double sizedBox0_7;
  @override
  final double sizedBox1;
  @override
  final double sizedBox1_5;
  @override
  final double sizedBox2;
  @override
  final double sizedBox2_5;
  @override
  final double sizedBox3;
  @override
  final double sizedBox3_5;
  @override
  final double sizedBox4;
  @override
  final double sizedBox5;
  @override
  final double sizedBox6;
  @override
  final double sizedBox6_5;
  @override
  final double sizedBox7_5;
  @override
  final double sizedBox8;
  @override
  final double sizedBox9;
  @override
  final double sizedBox9_5;
  @override
  final double sizedBox10;
  @override
  final double sizedBox10_5;
  @override
  final double sizedBox11;
  @override
  final double sizedBox12;
  @override
  final double sizedBox13;
  @override
  final double sizedBox14;
  @override
  final double sizedBox15;
  @override
  final double sizedBox15_5;
  @override
  final double sizedBox16;
  @override
  final double sizedBox17;
  @override
  final double sizedBox18;
  @override
  final double sizedBox19;
  @override
  final double sizedBox20;
  @override
  final double sizedBox21;
  @override
  final double sizedBox22;
  @override
  final double sizedBox24;
  @override
  final double sizedBox25;
  @override
  final double sizedBox26;
  @override
  final double sizedBox28;
  @override
  final double sizedBox30;
  @override
  final double sizedBox32;
  @override
  final double sizedBox34;
  @override
  final double sizedBox35;
  @override
  final double sizedBox37;
  @override
  final double sizedBox39;
  @override
  final double sizedBox40;
  @override
  final double sizedBox42;
  @override
  final double sizedBox45;
  @override
  final double sizedBox48;
  @override
  final double sizedBox50;
  @override
  final double sizedSide1;
  @override
  final double sizedBox57;
  @override
  final double sizedBox585;
  @override
  final double sizedBox62;
  @override
  final double sizedBox65;
  @override
  final double sizedBox70;
  @override
  final double sizedBox72;
  @override
  final double sizedBox75;
  @override
  final double sizedBox77;
  @override
  final double sizedBox80;
  @override
  final double sizedBox84;
  @override
  final double sizedBox87_5;
  @override
  final double sizedBox88;
  @override
  final double sizedBox96;
  @override
  final double sizedBox100;
  @override
  final double sizedBox110;
  @override
  final double sizedBox114;
  @override
  final double sizedBox119;
  @override
  final double sizedBox119_2;
  @override
  final double sizedBox120;
  @override
  final double sizedBox121;
  @override
  final double sizedBox126;
  @override
  final double sizedBox128;
  @override
  final double sizedBox134;
  @override
  final double sizedBox136;
  @override
  final double sizedBox144;
  @override
  final double sizedBox148;
  @override
  final double sizedBox150;
  @override
  final double sizedBox151;
  @override
  final double sizedBox162;
  @override
  final double sizedBox165;
  @override
  final double sizedBox170;
  @override
  final double sizedBox181_5;
  @override
  final double sizedBox181;
  @override
  final double sizedBox182;
  @override
  final double sizedBox190;
  @override
  final double sizedBox200;
  @override
  final double sizedBox220;
  @override
  final double sizedBox220_5;
  @override
  final double sizedBox222;
  @override
  final double sizedBox225;

  // ETC sizes
  @override
  final double etcTitleSize;
  @override
  final double etcTimeGap;
  @override
  final double etcTimeSize;
  @override
  final double etcContentSize;
  @override
  final double sign2w1;
  @override
  final double sign2w2;
  @override
  final double listBox;
  @override
  final double sign2authE;
  @override
  final double sign2authE2;
  @override
  final double sizedBox0_1;
  @override
  final double sizedBox0_6;
  @override
  final double sizedBox0_62;
  @override
  final double sizedBox0_68;
  @override
  final double sizedBox1_4;
  @override
  final double etcList;
  @override
  final double chatMaxWidth065;
  @override
  final double chatMaxWidth075;
  @override
  final double textFromWidth;
  @override
  final double etc01;
  @override
  final double etc012;
  @override
  final double etc005;
  @override
  final double etc08;
  @override
  final double etc01325;
  @override
  final double etc0135;
  @override
  final double etc0156;
  @override
  final double etc041;
  @override
  final double reviewDialog;
  @override
  final double dealPad;
  @override
  final double etcStep;
  @override
  final double etcPad;

  const CommonSizeImpl({
    required this.edge,
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
        sizedNav = (origin * 0.135) + (origin * 0.04),
  // sizedButtonNew + sized16grid
        sizedNavWild = (origin * 0.135) + (origin * 0.08),
  // sizedButtonNew + sized32grid
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
        sizedSideGap = (origin * 0.04) - (origin * 0.03),
  // sized16grid - sizedPaddingOnlyAppBar
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
        imageHeight = (1 / 1.618) * origin,
        ratio58 = (5 / 8) * origin,
        ratio58_2 = ((5 / 8) * origin) / 2,
        ratio58_33 = ((5 / 8) * origin) / 3,
        ratio58_4 = ((5 / 8) * origin) / 4,
        ratio58_3 = ((5 / 8) * origin) / 4.2,
        ratioWidth = (5 / 8) * origin,
        ratioHeight = ((5 / 8) * origin * 5) / 8,
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


//   //common
//   EdgeInsets get paddingBodyWhole =>
//       EdgeInsets.symmetric(horizontal: origin * 0.0375);
//
//   EdgeInsets get paddingBodyWholeIcon =>
//       EdgeInsets.only(left: origin * 0.0375, right: origin * 0.02326);
//
//
//   //store
//   get paddingStoreList =>
//       EdgeInsets.only(
//         right: origin * 0.0375, left: origin * 0.0375,); //store_container
// //map


}


