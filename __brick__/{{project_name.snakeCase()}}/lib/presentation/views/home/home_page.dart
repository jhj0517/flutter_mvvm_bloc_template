import 'package:flutter/material.dart';
import 'package:flutter_mvvm_bloc_temp/data/models/local/memo.dart';
import 'package:intl/intl.dart';

import '../widgets/common/common.dart';
import 'widgets/memo_tile.dart';
import 'widgets/memo_input_field.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: NormalAppBar(title: Intl.message("appTitle")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const SizedBox(height: 20),
            OutlinedButton(
                onPressed: () async {
                },
                child: const Text("DEBUG RETROFIT")
            ),
            const SizedBox(height: 20),
            const MemoInputField(),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (context, index) {
                  final memo = Memo(content: "sample", isImportant: false);
                  return MemoTile(memo: memo);
                },
              ),
            ),
          ],
        )
    );
  }
}
