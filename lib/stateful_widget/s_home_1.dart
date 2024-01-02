import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/stateful_widget/f_cart.dart';
import 'package:class_statement/stateful_widget/f_catalog.dart';
import 'package:flutter/material.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {

  // 현재 선택된 index
  int currentIndex = 0;
  // 선택된 catalog 정보를 담을 수 있는 자료구조 선언
  List<Catalog> catalogList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Catalog"),
      ),
      body: const IndexedStack(
        children: [
          CatalogWidget(),
          CartWidget(),
        ],
      ),
    );
  }
}
