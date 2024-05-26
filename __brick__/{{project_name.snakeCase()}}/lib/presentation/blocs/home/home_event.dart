import 'package:equatable/equatable.dart';

import '../../../data/models/models.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class ReadMemos extends HomeEvent {}

class AddMemo extends HomeEvent {
  final Memo memo;

  const AddMemo(this.memo);

  @override
  List<Object> get props => [memo];
}

class DeleteMemo extends HomeEvent {
  final Memo memo;

  const DeleteMemo(this.memo);

  @override
  List<Object> get props => [memo];
}

class UpdateMemo extends HomeEvent {
  final Memo memo;

  const UpdateMemo(this.memo);

  @override
  List<Object> get props => [memo];
}

class FetchOrderBook extends HomeEvent {
  final String symbol;
  final int? limit;

  const FetchOrderBook({required this.symbol, this.limit});

  @override
  List<Object> get props => [symbol, limit ?? -1];
}
