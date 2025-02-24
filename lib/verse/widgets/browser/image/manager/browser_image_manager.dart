import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/widgets/browser/image/bloc/banana_browser_image/banana_browser_image_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BrowserImageManager {
  final String baseUrl;

  const BrowserImageManager({
    required this.baseUrl
  });

  void closeDialog(BuildContext context) => context.read<VerseConfig>().route.closeDialog(context);

  void getImageList({
    required BuildContext context,
    required int currentIndex,
    required List<String> imageList,
  }) => context.read<BananaBrowserImageBloc>().add(GetImageListBBIE(currentIndex: currentIndex, imageList: imageList));

  void changeIndex({
    required BuildContext context,
    required int currentIndex,
  }) =>
      context.read<BananaBrowserImageBloc>().add(ChangeIndexBBIE(currentIndex));

  void downLoadImage(BuildContext context) => context.read<BananaBrowserImageBloc>().add(DownLoadImageBBIE(baseUrl));

  void downLoadClose(BuildContext context) => context.read<BananaBrowserImageBloc>().add(const DownLoadCloseBBIE());
}