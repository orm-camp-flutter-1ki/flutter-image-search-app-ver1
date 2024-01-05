import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'main_event.dart';
import 'main_view_model.dart';
import 'widget/image_item_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final searchTextEditingController = TextEditingController();

  StreamSubscription<MainEvent>? subscription;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      subscription = context.read<MainViewModel>().eventStream.listen((event) {
        switch (event) {
          case ShowSnackBar():
            final snackBar = SnackBar(
              content: Text(event.message),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          case ShowDialog():
          // showDialog(context: context, builder: (context) {
          // });
        }
      });
    });
  }

  @override
  void dispose() {
    subscription?.cancel();
    searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();
    final state = viewModel.state;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            children: [
              TextField(
                controller: searchTextEditingController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    // 둥글게 만들기 위해 BorderRadius 설정
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2), // 외곽선 컬러 설정
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    // 둥글게 만들기 위해 BorderRadius 설정
                    borderSide: const BorderSide(
                      width: 2,
                      color: Color(0xFF4FB6B2), // 외곽선 컬러 설정
                    ),
                  ),
                  hintText: 'Search',
                  suffixIcon: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Color(0xFF4FB6B2), // 외곽선 컬러 설정
                    ),
                    onPressed: () async {
                      await viewModel
                          .searchImage(searchTextEditingController.text);
                    },
                  ),
                ),
              ),
              const SizedBox(height: 24),
              state.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: GridView.builder(
                        itemCount: state.imageItems.length,
                        itemBuilder: (context, index) {
                          final imageItem = state.imageItems[index];
                          return ImageItemWidget(imageItem: imageItem);
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 32,
                          mainAxisSpacing: 32,
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
