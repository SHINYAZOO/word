import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'folder.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'DB.dart';
import 'folderModel.dart';
import 'add.dart';

main() {
  runApp(
    ProviderScope(
      child: ScreenUtilInit(
          designSize: const Size(431, 732),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              initialRoute: '/',
              routes: <String, WidgetBuilder>{
                '/': (BuildContext context) => MainPage(),
                '/addpage': (BuildContext context) => addpage(),
              },
            );
          }),
    ),
  );
}
