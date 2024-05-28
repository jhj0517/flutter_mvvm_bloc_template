import 'package:equatable/equatable.dart';
import '../../../data/models/local/memo.dart';
import '../../../data/models/network/binance/orderbook_response.dart';

// Use Copy With
// https://medium.com/google-developer-experts/bloc-single-state-class-5a66fdffb270

class HomeState extends Equatable {
  final List<Memo> memos;
  final OrderBookResponse? orderBookResponse;
  final String? errorMessage;

  const HomeState({
    this.memos = const [],
    this.orderBookResponse,
    this.errorMessage,
  });

  HomeState copyWith({
    List<Memo>? memos,
    OrderBookResponse? orderBookResponse,
    String? errorMessage,
  }) {
    return HomeState(
      memos: memos ?? this.memos,
      orderBookResponse: orderBookResponse ?? this.orderBookResponse,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [memos, orderBookResponse, errorMessage];
}
