part of 'banana_chat_log_socket_cubit.dart';


final class BananaChatLogSocketState extends Equatable {
  final bool isUp;
  final bool isUsed;
  final bool isDeal;
  final bool isDisconnect;
  final String errorMessage;
  final String message;
  final String imageUrl;
  final ChatLogDto messageData;
  const BananaChatLogSocketState({
    this.isUp = false,
    this.isUsed = true,
    this.isDeal = false,
    this.isDisconnect = false,
    this.errorMessage = '',
    this.message = '',
    this.imageUrl = '',
    this.messageData = ModelConfig.chatLogDto
  });

  BananaChatLogSocketState copyWith({
    bool? isUp,
    bool? isUsed,
    bool? isDeal,
    bool? isDisconnect,
    String? errorMessage,
    String? message,
    String? imageUrl,
    ChatLogDto? messageData
  }) => BananaChatLogSocketState(
      isUp: isUp ?? this.isUp,
      isUsed: isUsed ?? this.isUsed,
      isDeal: isDeal ?? this.isDeal,
      isDisconnect: isDisconnect ?? this.isDisconnect,
      errorMessage: errorMessage ?? this.errorMessage,
      message: message ?? this.message,
      imageUrl: imageUrl ?? this.imageUrl,
      messageData: messageData ?? this.messageData
  );


  @override
  List<Object> get props => [
    isUp,
    isUsed,
    isDeal,
    isDisconnect,
    errorMessage,
    message,
    imageUrl,
    messageData
  ];
}