import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/package/api/upload/model/action/upload_action.dart';
import 'package:banana_deal_by_monkeycompany/package/api/upload/model/upload_api_impl.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/upload/src/upload_repository_impl.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/common/method/api/model/data/canvas_enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/manager/upload_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/state/bloc/banana_upload/banana_upload_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/state/bloc/banana_upload_crop/banana_upload_crop_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/state/bloc/banana_upload_set/banana_upload_set_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/state/listener/upload_bloc_listener.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/view/widgets/body/upload_body_view.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/special/bd_ripple_icon_on_button.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/canvas/bd_canvas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadView extends StatelessWidget {
  final void Function(String thumbNail) callBack;
  final UploadEnum caseUpload;
  const UploadView({super.key,
    required this.callBack,
    required this.caseUpload
  });

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<UploadApiImpl>(
              create: (BuildContext context) =>
                  const UploadApiImpl(
                      action: UploadAction(),
                  )
          ),
          RepositoryProvider<UploadRepositoryImpl>(
            create: (BuildContext context) =>
                UploadRepositoryImpl(
                    api: context.read<UploadApiImpl>(),
                    isIos: context.read<VerseConfig>().cache.mainCache.isIos
            ),
          ),
          RepositoryProvider<UploadManager>(
            create: (BuildContext context) =>
                UploadManager(
                    callBack: callBack,
                    caseUpload: caseUpload,
                ),
          ),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<BananaUploadBloc>(
                create: (BuildContext context) => BananaUploadBloc(
                    repository: context.read<UploadRepositoryImpl>()
                )..add(BananaUploadFetchUploadImageListInit(caseUpload: caseUpload)

                ),
              ),
              BlocProvider<BananaUploadSetBloc>(
                create: (BuildContext context) => BananaUploadSetBloc(),
              ),
              BlocProvider<BananaUploadCropBloc>(
                create: (BuildContext context) => BananaUploadCropBloc(
                    context.read<UploadRepositoryImpl>()
                ),
              ),
            ],
            child: const _Canvas()
        )
    );
  }
}

class _Canvas extends StatelessWidget {
  const _Canvas();

  @override
  Widget build(BuildContext context) {

    return const BdCanvas(
      canvasEnum: CanvasEnum.basic,
      listener: UploadBlocListener(),
      appbar: ('이미지 업로드', null, null,  _Actions()),
      body: UploadBodyView(),
      navNullAble: true,
    );
  }
}


class _Actions extends StatelessWidget {
  const _Actions();

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return  BlocSelector<BananaUploadSetBloc, BananaUploadSetState, AssetEntity?>(
        selector: (state) => state.currentImage,
        builder: (context, photo) =>
        switch(photo){
          null => const SizedBox(),
          _ => BdRippleIconOnButton(
              size: size,
              onTap: () {
                photo.file.then(
                        (value) {
                          context.mounted ?
                          context.read<UploadManager>().cropImage(
                              context: context,
                              currentImagePath: value!.path
                          ) : null;
                    }
                );
              },
              icon: Icons.add_a_photo
          )
        }
    );
  }
}
