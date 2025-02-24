import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationTextBold extends StatelessWidget {
  final String text;

  const LocationTextBold({super.key,
    required this.text,
  });


  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: context.read<VerseConfig>().size.sizedBox18,
        color: blackWrite,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}

class LocationTextBrown extends StatelessWidget {
  final String text;
  const LocationTextBrown({
    super.key,
    required this.text,
});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: context.read<VerseConfig>().size.sizedBox14,
        color: brown,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class LocationTextBrownCenter extends StatelessWidget {
  final String text;
  const LocationTextBrownCenter({
    super.key,
    required this.text,
    }) ;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: context.read<VerseConfig>().size.sizedBox14,
        color: brown,
        fontWeight: FontWeight.w400,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class LocationTextBrownBigBold extends StatelessWidget {
  final String text;
  const LocationTextBrownBigBold({
    super.key,
    required this.text,
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: context.read<VerseConfig>().size.sizedBox20,
        color: brown,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}


class LocationTextGrey14 extends StatelessWidget {
  final String text;
  const LocationTextGrey14({
    super.key,
    required this.text,
    });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:  TextStyle(
        fontSize: context.read<VerseConfig>().size.sizedBox14,
        color: greyWrite,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}