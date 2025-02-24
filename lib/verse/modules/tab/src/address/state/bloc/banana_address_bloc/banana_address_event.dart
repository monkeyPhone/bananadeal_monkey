part of 'banana_address_bloc.dart';

sealed class BananaAddressEvent extends Equatable {
  const BananaAddressEvent();

  @override
  List<Object> get props => [];
}


final class InitAddress extends BananaAddressEvent{

  const InitAddress();
}

final class FetchAddress extends BananaAddressEvent{
  final String search;
  final int currentPage;

  const FetchAddress({required this.search, required this.currentPage});
}

final class FetchPage extends BananaAddressEvent{
  final int currentPage;
  const FetchPage( this.currentPage);
}

final class FetchLocation extends BananaAddressEvent{
  final AddressVO data;
  const FetchLocation({ required this.data});
}

final class BackSpaceEvent extends BananaAddressEvent{
  final BuildContext context;

  const BackSpaceEvent({
    required this.context,
  });
}
