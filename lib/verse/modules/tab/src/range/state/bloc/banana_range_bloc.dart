import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'banana_range_event.dart';
part 'banana_range_state.dart';

class BananaRangeBloc extends Bloc<BananaRangeEvent, BananaRangeState> {
  BananaRangeBloc() : super(const BananaRangeState()) {
    on<FetchCurrent>(_fetchCurrent);
    on<FetchSelect>(_fetchSelect);
  }

  Future<void> _fetchCurrent(FetchCurrent event, Emitter<BananaRangeState> emit) async{
    final int range = event.currentRange;
    final int index = switch(event.currentRange){
      1 => 0,
      3 => 1,
      5 => 2,
      10 => 3,
      _ => 4,
    };

    emit(
        state.copyWith(
            currentRange: range,
            currentIndex: index,
            selectRange: range,
            selectIndex: index
        )
    );
  }

  Future<void> _fetchSelect(FetchSelect event, Emitter<BananaRangeState> emit) async{
    emit(state.copyWith(selectIndex: event.selectIndex,
        selectRange: switch(event.selectIndex){
          0 => 1,
          1 => 3,
          2 => 5,
          3 => 10,
          _ => 15,
        }
    ));
  }

}
