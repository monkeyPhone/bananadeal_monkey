import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../css/size.dart';

class ImageData extends StatelessWidget {
  final String icon;
  final Color? color;
  ImageData(this.icon,{Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: color != null
      ? SvgPicture.asset(
        icon,
        width: WidgetSize(context).sizedBox24,
        colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
      )
      : SvgPicture.asset(
        icon,
        width: WidgetSize(context).sizedBox24,
      ),
    );
  }
}



class ImageData2 extends StatelessWidget {
  final double size;
  final String icon;
  final Color? color;
  ImageData2(this.icon, this.size, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: color != null
      ? SvgPicture.asset(
        icon,
        width: size,
        colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
      )
      : SvgPicture.asset(
        icon,
        width: size,
      ),
    );
  }
}

class ImageData3 extends StatelessWidget {
  final String icon;
  final Color? color;
  ImageData3(this.icon, {Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Center(
        child:
        color != null
        ?
        SvgPicture.asset(
          icon,
          colorFilter: ColorFilter.mode(color!, BlendMode.srcIn),
        )
        :
        SvgPicture.asset(
          icon,
        )
        ,
      ),
    );
  }
}


