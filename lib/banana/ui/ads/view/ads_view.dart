import 'package:cached_network_image/cached_network_image.dart';
import 'package:css/css.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        child: Stack(
          children: [
            const _StandByBackGroundImage(),
            Positioned(
                bottom: context.read<CssSizeImpl>().sized32grid,
                right: context.read<CssSizeImpl>().sized32grid,
                child: SizedBox(
                  height: context.read<CssSizeImpl>().sized32grid,
                  width: context.read<CssSizeImpl>().sized32grid,
                  child: GestureDetector(
                    onTap: (){
                      if (kDebugMode) {
                        print('${context.read<CssSizeImpl>().sized32grid}');
                      }},
                    child: Container(
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                  ),
                )
            )
          ],
        )

    );
  }
}

class _StandByBackGroundImage extends StatelessWidget {
  const _StandByBackGroundImage();

  @override
  Widget build(BuildContext context) {
    return switch(kIsWeb){
      true => const _WebImageArea(),
      false => const _AppImageArea()
    };
  }
}


class _AppImageArea extends StatelessWidget {

  const _AppImageArea();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
                image: AssetImage('assets/image/ads/ads.png')
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

class _WebImageArea extends StatelessWidget {

  const _WebImageArea();

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.contain,
                image: NetworkImage('assets/image/ads/ads.png')
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