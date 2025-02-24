import 'package:banana_deal_by_monkeycompany/package/api/chat_log/model/data/chat_log_dto.dart';
import 'package:banana_deal_by_monkeycompany/package/repository/chat_log/chat_log_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_chat_log_repo_event.dart';
part 'banana_chat_log_repo_state.dart';

class BananaChatLogRepoBloc extends Bloc<BananaChatLogRepoEvent, BananaChatLogRepoState> {
  final ChatLogRepository _repository;
  BananaChatLogRepoBloc({
    required ChatLogRepository repository,
  }) : _repository = repository, super(const BananaChatLogRepoState()) {
    on<GetChatLog>(_getChatLog);
    on<AddChatLog>(_addChatLog);
    on<SaveChatLog>(_saveChatLog);
    on<GetImageList>(_getImageList);
  }

  Future<void> _getChatLog(GetChatLog event, Emitter<BananaChatLogRepoState> emit) async{
    emit(state.copyWith(repoList: event.data));
  }

  Future<void> _addChatLog(AddChatLog event, Emitter<BananaChatLogRepoState> emit) async{
    List<ChatLogDto> edit = state.addList.toList();
    edit.add(event.data);
    emit(state.copyWith(addList: edit));
  }

  Future<void> _saveChatLog(SaveChatLog event, Emitter<BananaChatLogRepoState> emit) async{
    List<ChatLogDto> repo = state.repoList.toList();
    List<ChatLogDtoRow> convertRepo = repo.map((entity) => entity.toRow()).toList();
    List<ChatLogDto> add = state.addList.toList();
    if(add.isNotEmpty) {
      List<ChatLogDtoRow> convertAdd = add.map((entity) => entity.toRow())
          .toList();
      convertRepo.addAll(convertAdd);
    }
    (bool, List<ChatLogDto>) result = await _repository.setCache(loadChats: convertRepo,);
    if(result.$1 && add.isNotEmpty){
      add.clear();
      emit(state.copyWith(repoList: result.$2, addList: add));
    }
  }

  Future<void> _getImageList(GetImageList event, Emitter<BananaChatLogRepoState> emit) async{
    List<ChatLogDto> repo = state.repoList.toList();
    List<ChatLogDtoRow> convertRepo = repo.map((entity) => entity.toRow()).toList();
    List<ChatLogDto> add = state.addList.toList();
    if(add.isNotEmpty){
      List<ChatLogDtoRow> convertAdd = add.map((entity) => entity.toRow()).toList();
      convertRepo.addAll(convertAdd);
    }
    await _repository.setImage(loadChats: convertRepo);
  }

}
