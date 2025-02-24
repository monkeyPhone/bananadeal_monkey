part of 'banana_broad_nav_bloc.dart';


sealed class BananaBroadNavEvent extends Equatable {
  const BananaBroadNavEvent();

  @override
  List<Object> get props => [];
}


final class ChangePage extends BananaBroadNavEvent {
  final NavEnum page;
  const ChangePage(this.page);
}

final class BackSpace extends BananaBroadNavEvent {
  final BuildContext context;
  const BackSpace(this.context);
}