import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdsView extends StatelessWidget {
  const AdsView({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: false,
        onPopInvokedWithResult: (bool didPop, Object? result) {
          if(didPop) {
            return;
          }
        },
        child: const _StandByBackGroundImage()

    );
  }
}


class _StandByBackGroundImage extends StatelessWidget {
  const _StandByBackGroundImage();

  @override
  Widget build(BuildContext context) {
    return switch(kIsWeb){
      true => const _InterNetPage(),
      false => const _AppPage()
    };
  }
}

class _InterNetPage extends StatelessWidget {
  const _InterNetPage();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage('http://release.bananadeal.co.kr:5000/UPLOAD/FILES/dev.png')
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
        ),
      ),
    );
  }
}

class _AppPage extends StatelessWidget {
  const _AppPage();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: CachedNetworkImageProvider('http://release.bananadeal.co.kr:5000/UPLOAD/FILES/dev.png')
            )
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          ),
        ),
      ),
    );
  }
}