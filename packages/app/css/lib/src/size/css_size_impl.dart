import 'package:css/src/size/css_size.dart';

class CssSizeImpl implements CssSize {
  @override
  final double widthCommon;
  @override
  final double heightCommon;
  @override
  final double origin;

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
  final double largeTitle;
  @override
  final double subTitle;
  @override
  final double body01;
  @override
  final double body02;
  @override
  final double button;
  @override
  final double caption;

  // Theme
  @override
  final double extendsGap;
  @override
  final double ratio;
  @override
  final double dialogCircular;

  const CssSizeImpl({
    required this.widthCommon,
    required this.heightCommon,
    required this.origin,
  }) :
        sized32grid = origin * 0.08,
        sized24grid = origin * 0.06,
        sized20grid = origin * 0.05,
        sized16grid = origin * 0.04,
        sized12grid = origin * 0.03,
        sized8grid = origin * 0.02,
        sized6grid = origin * 0.015,
        sized4grid = origin * 0.01,
        sized2grid = origin * 0.005,
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
        largeTitle = origin * 0.026,
        subTitle = origin * 0.026,
        body01 = origin * 0.026,
        body02 = origin * 0.026,
        caption = origin * 0.026,
        button = origin * 0.026,
        extendsGap = origin * 0.0000001,
        ratio = 1.1618 * origin,
        dialogCircular = origin*0.028
  ;
}