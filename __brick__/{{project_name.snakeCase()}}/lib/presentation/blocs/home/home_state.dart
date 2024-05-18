import 'package:equatable/equatable.dart';
import '../../../data/models/local/memo.dart';

abstract class HomeState extends Equatable {
  final List<Memo> memos;
  const HomeState({required this.memos});
}

class MemoInitial extends HomeState {
  const MemoInitial({required super.memos});

  @override
  List<Object> get props => [];
}

class MemoLoading extends HomeState {
  const MemoLoading({required super.memos});

  @override
  List<Object> get props => [];
}

class MemoLoaded extends HomeState {
  const MemoLoaded({required super.memos});

  @override
  List<Object> get props => [];
}

class MemoError extends HomeState {
  const MemoError({
    required super.memos
  });

  @override
  List<Object> get props => [];
}