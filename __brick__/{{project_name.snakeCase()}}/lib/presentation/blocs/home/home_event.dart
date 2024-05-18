abstract class HomeEvent {}

class LoadMemos extends HomeEvent {}

class AddMemo extends HomeEvent {
  final Memo memo;

  AddMemo(this.memo);
}

class DeleteMemo extends HomeEvent {
  final Memo memo;

  DeleteMemo(this.memo);
}

class UpdateMemo extends HomeEvent {
  final Memo memo;

  UpdateMemo(this.memo);
}

class FetchOrderBook extends HomeEvent {
  final String symbol;
  final int? limit;

  FetchOrderBook({required this.symbol, this.limit});
}
