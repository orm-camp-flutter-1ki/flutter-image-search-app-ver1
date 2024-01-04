import 'package:flutter/material.dart';
import 'package:image_search_app/data/repository/image_item_repository_impl.dart';
import 'package:image_search_app/di/di_setup.dart';
import 'package:image_search_app/ui/main_screen.dart';
import 'package:provider/provider.dart';

import 'ui/main_view_model.dart';

void main() {
  diSetup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => MainViewModel(
          repository: ImageItemRepositoryImpl(),
        ),
        child: const MainScreen(),
      ),
    );
  }
}
