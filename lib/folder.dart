import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'folderModel.dart';
import 'add.dart';
import 'definition.dart';

class MainPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stateX = ref.watch(folderState);

    Widget _counterText(String text) =>
        Text(text, style: Theme.of(context).textTheme.headline4);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'WordStoc',
          style: TextStyle(color: Color.fromARGB(255, 199, 221, 239)),
        ),
        backgroundColor: Color.fromARGB(255, 177, 176, 176),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 90.h), //●

        child: ListView(
          //リストビューに変更
          children: [
            Container(
              margin: EdgeInsets.only(
                  left: 10.w, right: 10.w, top: 20.h, bottom: 20.h), //●
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // ここまで
                color: Color.fromARGB(255, 177, 176, 176),
              ),
              child: ListTile(
                leading: // Icon(Icons.folder,color: Color.fromARGB(255, 199, 221, 239),size: 50.sp,),
                    stateX.when(
                  loading: () => _counterText('読み込み中...'),
                  error: (error, _) => _counterText('$error'),
                  data: (x) => ListView.builder(
                    itemBuilder: (context, int index) =>
                        Text('$Definition( name: x[index],'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 530.h), //●
        child: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 199, 221, 239),
          child: Icon(Icons.create_new_folder,
              color: Color.fromARGB(255, 177, 176, 176)),
          onPressed: () {
            Navigator.of(context).pushNamed("/addpage");
          },
        ),
      ),
    );
  }
}
