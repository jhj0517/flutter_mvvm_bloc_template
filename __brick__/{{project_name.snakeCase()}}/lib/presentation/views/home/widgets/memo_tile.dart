import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/models.dart';
import '../../../blocs/home/home_cubit.dart';
import '../../../blocs/home/home_event.dart';

class MemoTile extends StatelessWidget {
  final Memo memo;

  const MemoTile({
    super.key,
    required this.memo,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('Name: ${memo.content}'),
      trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () {
            final homeBloc = context.read<HomeBloc>();
            homeBloc.add(
                DeleteMemo(memo)
            );
          }
      ),
    );
  }
}