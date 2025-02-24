part of 'banana_browser_image_bloc.dart';

sealed class BananaBrowserImageEvent extends Equatable {
  const BananaBrowserImageEvent();

  @override
  List<Object> get props => [];
}

final class GetImageListBBIE extends BananaBrowserImageEvent{
  final int currentIndex;
  final List<String> imageList;
  const GetImageListBBIE({
    required this.currentIndex,
    required this.imageList,
  });
}

final class ChangeIndexBBIE extends BananaBrowserImageEvent{
  final int currentIndex;
  const ChangeIndexBBIE(this.currentIndex);
}

final class DownLoadImageBBIE extends BananaBrowserImageEvent{
  final String baseUrl;
  const DownLoadImageBBIE(this.baseUrl);

}


final class DownLoadCloseBBIE extends BananaBrowserImageEvent{

  const DownLoadCloseBBIE();

}

