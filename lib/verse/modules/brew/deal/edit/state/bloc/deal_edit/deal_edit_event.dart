part of 'deal_edit_bloc.dart';



sealed class DealEditEvent extends Equatable {
  const DealEditEvent();

  @override
  List<Object> get props => [];
}

final class InitDealList extends DealEditEvent{
  final List<MyDealListVO> remote;

  const InitDealList({
    required this.remote
  });

}

final class AllDelete extends DealEditEvent{
  const AllDelete();
}

final class CancelDelete extends DealEditEvent{
  const CancelDelete();
}

final class FetchDelete extends DealEditEvent{
  final MyDealListVO value;
  const FetchDelete({
    required this.value
  });
}


final class FetchStatus extends DealEditEvent{
  final StatusEnum status;
  const FetchStatus(this.status);
}