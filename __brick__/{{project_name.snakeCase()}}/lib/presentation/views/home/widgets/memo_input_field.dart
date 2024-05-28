import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/local/memo.dart';
import '../../../blocs/home/home_cubit.dart';

class MemoInputField extends StatefulWidget {
  const MemoInputField({super.key});

  @override
  MemoInputFieldState createState() => MemoInputFieldState();
}

class MemoInputFieldState extends State<MemoInputField> {
  final _memoController = TextEditingController();

  @override
  void dispose() {
    _memoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _memoController,
      decoration: InputDecoration(
          labelText: 'Enter Your Memo',
          suffixIcon: IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              final homeCubit = context.read<HomeCubit>();
              homeCubit.addMemo(Memo(content: _memoController.text, isImportant: false));

              if (_memoController.text.isNotEmpty) {
                _memoController.clear();
              }
            },
          )
      ),
    );
  }
}