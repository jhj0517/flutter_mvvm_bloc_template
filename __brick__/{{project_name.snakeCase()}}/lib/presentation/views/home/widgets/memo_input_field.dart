import 'package:flutter/material.dart';

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
              if (_memoController.text.isNotEmpty) {
                _memoController.clear();
              }
            },
          )
      ),
    );
  }
}