import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/local/memo.dart';
import '../../../data/repositories/binance_repository.dart';
import '../../../data/repositories/memo_repository.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final MemoRepository memoRepository;
  final BinanceRepository binanceRepository;

  HomeCubit({
    required this.memoRepository,
    required this.binanceRepository,
  }) : super(const HomeState());

  Future<void> readMemos() async {
    try {
      final memos = await memoRepository.readMemos();
      emit(state.copyWith(memos: memos, errorMessage: null));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> addMemo(Memo memo) async {
    try {
      await memoRepository.addMemo(memo);
      readMemos();
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> deleteMemo(Memo memo) async {
    try {
      await memoRepository.deleteMemo(memo);
      readMemos();
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> updateMemo(Memo memo) async {
    try {
      await memoRepository.updateMemo(memo);
      readMemos();
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }

  Future<void> fetchOrderBook({required String symbol, int? limit}) async {
    try {
      final response = await binanceRepository.fetchOrderBooks(symbol: symbol, limit: limit);
      emit(state.copyWith(orderBookResponse: response, errorMessage: null));
    } catch (e) {
      emit(state.copyWith(errorMessage: e.toString()));
    }
  }
}
