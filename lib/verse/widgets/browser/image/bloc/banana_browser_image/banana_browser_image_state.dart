part of 'banana_browser_image_bloc.dart';


final class BananaBrowserImageState extends Equatable {
  final List<String> imageList;
  final int currentIndex;
  final DownLoadEnum downloadState;
  final String value;


  const BananaBrowserImageState({
    this.imageList = const [],
    this.currentIndex = 0,
    this.downloadState = DownLoadEnum.initial,
    this.value = ''
  });

  BananaBrowserImageState copyWith({
    List<String>? imageList,
    int? currentIndex,
    DownLoadEnum? downloadState,
    String? value
  }) => BananaBrowserImageState(
      imageList:  imageList ?? this.imageList,
      currentIndex: currentIndex ?? this.currentIndex,
      downloadState: downloadState ?? this.downloadState,
      value: value ?? this.value
  );

  @override
  List<Object> get props => [imageList, currentIndex, downloadState, value];
}
