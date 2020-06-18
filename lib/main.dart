import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:inovolatask/screens/hike_screen.dart';
import 'package:inovolatask/utils/network_base.dart';
import 'package:inovolatask/utils/network_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final getIt = GetIt.instance;
  getIt.registerSingleton<NetworkBaseAPI>(NetworkHelper.getInstance());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inovola Task',
      debugShowCheckedModeBanner: false,
      home: Directionality(
          textDirection: TextDirection.rtl, child: CourseScreen()),
    );
  }
}
