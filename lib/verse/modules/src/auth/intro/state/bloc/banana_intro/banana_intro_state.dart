part of 'banana_intro_bloc.dart';

final class BananaIntroState extends Equatable {

  final StatusEnum statusEnum;
  final List<String> imageList;
  final int currentIndex;
  final List<String> defaultList;
  final JsonError error;

  const BananaIntroState({
    this.statusEnum = StatusEnum.initial,
    this.imageList = const [],
    this.currentIndex = 0,
    this.defaultList = const[onboardingDefault1, onboardingDefault2],
    this.error = ModelConfig.jsonError,
  });

  BananaIntroState copyWith({
    StatusEnum? statusEnum,
    List<String>? imageList,
    int? currentIndex,
    List<String>? defaultList,
    JsonError? error
  }) => BananaIntroState(
    statusEnum: statusEnum ?? this.statusEnum,
    imageList: imageList ?? this.imageList,
    currentIndex: currentIndex ?? this.currentIndex,
    defaultList: defaultList ?? this.defaultList,
    error: error ?? this.error
  );

  @override
  List<Object> get props => [statusEnum, imageList, currentIndex, defaultList, error];
}
