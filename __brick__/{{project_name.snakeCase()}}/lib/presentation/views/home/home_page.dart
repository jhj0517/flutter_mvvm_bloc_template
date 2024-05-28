import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../blocs/home/home_cubit.dart';
import '../../blocs/home/home_state.dart';
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
                  // Dispatch the FetchOrderBook event
                  final homeCubit = context.read<HomeCubit>();
                  homeCubit.fetchOrderBook(symbol: "BTCUSDT");
                },
                child: const Text("Debug Retrofit")
            ),
            const SizedBox(height: 20),
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state.orderBookResponse != null) {
                  return Text('Response: ${state.orderBookResponse!.toJson()}', maxLines: 5);
                }

                if (state.errorMessage != null) {
                  return Text('Error: ${state.errorMessage}');
                }

                return const Text('Retrofit Output');
              },
            ),
            const SizedBox(height: 20),
            const MemoInputField(),
            Expanded(
              child: BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (state.memos.isEmpty) {
                    return const Center(child: Text("No memos available"));
                  }

                  return ListView.builder(
                    itemCount: state.memos.length,
                    itemBuilder: (context, index) {
                      final memo = state.memos[index];
                      return MemoTile(memo: memo);
                    },
                  );
                },
              ),
            ),
          ],
        )
    );
  }
}
