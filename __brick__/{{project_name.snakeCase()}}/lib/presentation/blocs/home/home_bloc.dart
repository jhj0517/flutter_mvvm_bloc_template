import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repositories/binance_repository.dart';
import '../../../data/repositories/memo_repository.dart';
import '../../../di/dependency_injection.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final memoRepository = locator<MemoRepository>();
  final binanceRepository = locator<BinanceRepository>();

  HomeBloc() : super(HomeInitial()) {
    on<ReadMemos>(_onReadMemos);
    on<AddMemo>(_onAddMemo);
    on<DeleteMemo>(_onDeleteMemo);
    on<UpdateMemo>(_onUpdateMemo);
    on<FetchOrderBook>(_onFetchOrderBook);
  }

  Future<void> _onReadMemos(ReadMemos event, Emitter<HomeState> emit) async {
    try {
      final memos = await memoRepository.readMemos();
      emit(MemoLoaded(memos));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onAddMemo(AddMemo event, Emitter<HomeState> emit) async {
    try {
      await memoRepository.addMemo(event.memo);
      final memos = await memoRepository.readMemos();
      emit(MemoLoaded(memos));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onDeleteMemo(DeleteMemo event, Emitter<HomeState> emit) async {
    try {
      await memoRepository.deleteMemo(event.memo);
      final memos = await memoRepository.readMemos();
      emit(MemoLoaded(memos));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onUpdateMemo(UpdateMemo event, Emitter<HomeState> emit) async {
    try {
      await memoRepository.updateMemo(event.memo);
      final memos = await memoRepository.readMemos();
      emit(MemoLoaded(memos));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }

  Future<void> _onFetchOrderBook(FetchOrderBook event, Emitter<HomeState> emit) async {
    try {
      final response = await binanceRepository.fetchOrderBooks(symbol: event.symbol, limit: event.limit);
      emit(OrderBookLoaded(response));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
