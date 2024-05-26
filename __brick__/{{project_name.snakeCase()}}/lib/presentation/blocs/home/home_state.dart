import 'package:equatable/equatable.dart';
import '../../../data/models/local/memo.dart';
import '../../../data/models/network/binance/orderbook_response.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class MemoInitial extends HomeState {
  final List<Memo> memos;
  const MemoInitial(this.memos);

  @override
  List<Object> get props => [];
}

class MemoLoaded extends HomeState {
  final List<Memo> memos;
  const MemoLoaded(this.memos);

  @override
  List<Object> get props => [];
}

class HomeError extends HomeState {
  final String message;

  const HomeError(
    this.message
  );

  @override
  List<Object> get props => [message];
}

class OrderBookLoaded extends HomeState {
  final OrderBookResponse response;

  const OrderBookLoaded(this.response);

  @override
  List<Object> get props => [response];
}