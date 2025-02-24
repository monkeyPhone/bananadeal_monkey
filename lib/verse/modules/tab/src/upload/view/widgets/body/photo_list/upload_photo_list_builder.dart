import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/color/const_color.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/manager/upload_manager.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/state/bloc/banana_upload/banana_upload_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/state/bloc/banana_upload_crop/banana_upload_crop_bloc.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/upload/view/widgets/body/photo_list/upload_photo_list_builder_tile.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/button/ripple/special/bd_ripple_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photo_manager/photo_manager.dart';

class UploadPhotoListBuilder extends StatelessWidget {
  const UploadPhotoListBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BananaUploadBloc, BananaUploadState>(
      builder: (context, state) =>
      switch(state.currentAlbums){
        null => const SizedBox(),
        _ => _ImageList(
          currentAlbums: state.currentAlbums!,
          currentPage: state.currentPage,)
      },
    );
  }
}

class _ImageList extends StatefulWidget {
  final AssetPathEntity currentAlbums;
  final int currentPage;
  const _ImageList({
    required this.currentAlbums,
    required this.currentPage,
  });

  @override
  State<_ImageList> createState() => _ImageListState();
}

class _ImageListState extends State<_ImageList> {
  late final ScrollController _imageScroll;

  @override
  void initState() {
    super.initState();
    _imageScroll = ScrollController();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    _imageScroll.addListener(() async{
      if(_imageScroll.position.maxScrollExtent == _imageScroll.position.pixels){
        await context.read<UploadManager>().morePhoto(album: widget.currentAlbums, currentPage: widget.currentPage, context: context);
      }
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _imageScroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ImageHeader(
          scrollController: _imageScroll,
          currentAlbums: widget.currentAlbums.name,
        ),
        _ImageScrollList(_imageScroll)

      ],
    );
  }
}


class _ImageHeader extends StatelessWidget {
  final ScrollController scrollController;
  final String currentAlbums;
  const _ImageHeader({
    required this.scrollController,
    required this.currentAlbums
  });

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.sizedBox15, vertical: size.sizedBox10),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BlocBuilder<BananaUploadCropBloc, BananaUploadCropState>(
              builder: (context, state) =>
                  BlocSelector<BananaUploadBloc, BananaUploadState, List<AssetPathEntity>>(
                    selector: (state) => state.albums,
                    builder: (context, album) => GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(size.sizedBox20),
                                  topRight: Radius.circular(size.sizedBox20)),
                            ),
                            isScrollControlled: true,
                            builder: (_) => SafeArea(
                              child: SizedBox(
                                height: size.height05,
                                child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Center(
                                        child: Container(
                                          margin: EdgeInsets.only(top: size.sizedBox20),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(size.sizedBox10),
                                            color: Colors.black54,
                                          ),
                                          width: size.sizedBox32,
                                          height: size.sizedBox5,
                                        ),
                                      ),
                                      Expanded(
                                        child: SingleChildScrollView(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment: CrossAxisAlignment.stretch,
                                              children: List.generate(
                                                album.length,
                                                    (index) =>
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).pop();
                                                        context.read<UploadManager>().selectAlbum(album: album[index], context: context);
                                                        context.read<UploadManager>().selectImage(context: context);
                                                        if(scrollController.hasClients){
                                                          scrollController.jumpTo(0.0);
                                                        }
                                                      },
                                                      child: Container(
                                                          color: white,
                                                          padding: EdgeInsets.symmetric(
                                                              vertical: size.sizedBox24, horizontal: size.sizedBox20),
                                                          child: Text(
                                                            album[index].name,
                                                            style: TextStyle(
                                                              fontSize: size.sizedBox16,
                                                              color: Colors.black,
                                                              fontWeight: FontWeight.w400,
                                                            ),
                                                          )
                                                      ),
                                                    ),
                                              ),

                                            )

                                        ),
                                      )
                                    ]),
                              ),
                            ),
                          );
                        },
                        child: Padding(
                            padding: EdgeInsets.all(size.sizedBox8),
                            child: Row(
                              children: [
                                Text(
                                  currentAlbums,
                                  style: TextStyle(
                                    color: blackWrite,
                                    fontSize: size.sizedBox16,
                                  ),
                                ),
                                Icon(Icons.arrow_drop_down, color: blackWrite, size: size.sizedBox24,),
                              ],
                            )
                          // state.imageSize == ''
                          //     ?
                          //     : state.canSize
                          //     ? Text('파일 용량 (${state.imageSize} MB)',
                          //   style:  TextStyle(
                          //     color: Style.blackWrite,
                          //     fontSize: WidgetSize(context).sizedBox16,
                          //   ),
                          // )
                          //     : Text('용량 초과 (${state.imageSize} MB)',
                          //   style:  TextStyle(
                          //     color: Style.red,
                          //     fontSize: WidgetSize(context).sizedBox16,
                          //   ),
                          // )
                        )
                    ),
                  ),
            ),
            BlocSelector<BananaUploadBloc, BananaUploadState, bool>(
                selector: (state) => state.isLimit,
                builder: (context, limit) =>
                limit == false
                    ? const SizedBox()
                    : BdRippleTextButton(
                  size: size,
                  onTap: () { context.read<UploadManager>().crackPhoto(context); },
                  text: '사진 권한 추가',
                )

            )
          ]
      ),

    );
  }

}


class _ImageScrollList extends StatelessWidget {
  final ScrollController scrollController;
  const _ImageScrollList(this.scrollController);

  @override
  Widget build(BuildContext context) {
    final CommonSize size = context.read<VerseConfig>().size;
    return BlocSelector<BananaUploadBloc, BananaUploadState, List<AssetEntity>>(
        selector: (state) => state.assetList,
        builder: (context, asset) =>
        asset.isEmpty
            ? const SizedBox()
            :
        Expanded(
          child: Stack(
            children: [
              SingleChildScrollView(
                controller: scrollController,
                physics: const ClampingScrollPhysics(),
                child: GridView.builder(
                    physics:  const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                      mainAxisSpacing: size.sizedBox1_5,
                      crossAxisSpacing: size.sizedBox1_5,
                    ),
                    itemCount: asset.length,
                    itemBuilder: (BuildContext context, int index)  =>
                      UploadPhotoListBuilderTile(
                        key: ValueKey('${asset[index].title}_$index'),
                        asset: asset[index],
                        size: size,
                      )

                ),
              ),
            ],
          ),
        )
    );
  }
}
