import 'package:banana_deal_by_monkeycompany/config/verse/verse.dart';
import 'package:banana_deal_by_monkeycompany/verse/core/util/enum/enum.dart';
import 'package:banana_deal_by_monkeycompany/verse/modules/tab/src/model_list_detail/state/bloc/banana_model_list_detail/banana_model_list_detail_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ModelListDetailManager {
  final String psIdx;
  final String name;
  const ModelListDetailManager({
    required this.psIdx,
    required this.name,
  });

  void openDialog({
    required BuildContext context,
    required int currentIndex,
    required List<String> imageList,
  }) => context.read<VerseConfig>().browser.image.openDialog(
      routerContext: context,
      currentIndex: currentIndex,
      imageList: imageList,
      isDownload: false,
      baseUrl: ''
  );


  void changeDetailEnum({
    required BuildContext context,
    required ModelDetailEnum detailEnum
  }) => context.read<BananaModelListDetailBloc>().add(ChangeDetailEnum(detailEnum));

  void changeColorIndex({
    required BuildContext context,
    required int index
  }) => context.read<BananaModelListDetailBloc>().add(ChangeColorIndex(index));

}