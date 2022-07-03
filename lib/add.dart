import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'folderModel.dart';
import 'definition.dart';

class addpage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final valueController = TextEditingController();
    final valueY = ref.read(shaftProvider.notifier);

    // final valueX = ref.watch(shaftProvider);

    return Scaffold(
      appBar: AppBar(title: Text('フォルダ追加画面')),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'フォルダ名を入力してください',
              ),
              controller: valueController,
            ),
            ElevatedButton(
              child: Text('新規登録'),
              onPressed: () {
                // TODO: 新規登録
                Definition inDF = Definition(
                    id: 1, name: valueController.text, tableName: 'folderName');
                valueY.changeInProvidermethod(inDF); //⭕️ポイント
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: Text('キャンセル'),
              onPressed: () {
                // TODO: キャンセル
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
