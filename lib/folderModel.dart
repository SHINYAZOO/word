import 'package:riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'DB.dart';
import 'definition.dart';

//StateNotifierProviderはStateNotifierを監視する
//ups.updateDB(up);を作成しなければならない
// final folderStateProvider =
//     StateNotifierProvider<folderModel, AsyncValue<List<DFalder?>>>((ref) {
//   final dbfast = ref.read(dboperationProbider);
//   final dbvalue = ref.watch(folderState);
//   return folderModel(dbfast, dbvalue);
// });

//画面表示処理
final folderState =
    FutureProvider((ref) => ref.read(dboperationProvider).getDB());

//画面登録処理
final InProvider = FutureProvider.autoDispose.family<Future<void>, Definition>(
    (ref, inDF) => ref.read(dboperationProvider).insertDB(inDF));

//軸 再度画面を構築する処理　1.画面表示処理(folderState)
final shaftProvider =
    StateNotifierProvider<folderModel, AsyncValue<List<Definition?>>>((ref) {
  final getProvider = ref.watch(folderState); //状態を監視する＋変化性質も可能
  return folderModel(shaftProvider, getProvider);
});

class folderModel extends StateNotifier<AsyncValue<List<Definition?>>> {
  folderModel(shaftProvider, getProvider) : super(getProvider);

  DBoperation? shaftProvider;

  void changeInProvidermethod(Definition inDF) {
    InProvider(inDF); //❓呼び出しできるか不明　処理：インプット処理
  }
}
