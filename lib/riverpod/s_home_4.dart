import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/common/w_bottom_bar.dart';
import 'package:class_statement/riverpod/f_cart.dart';
import 'package:class_statement/riverpod/f_catalog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen4 extends StatefulWidget {
  const HomeScreen4({super.key});

  @override
  State<HomeScreen4> createState() => _HomeScreen4State();
}

class _HomeScreen4State extends State<HomeScreen4> {
  // 현재 선택된 index
  int currentIndex = 0;

    // 샘플 데이터 (local DB, 통신)
  late List<Catalog> responseListData;

  // 메모리에 올라갈 때 딱 한번만 초기화 되는 부분
  @override
  void initState() {
    super.initState();
    // initState <-- 위젯을 업데이트 하는 코드를 사용하면 안됨(버그 발생)
    // 가능한 한 데이터 초기화 처리만 사용
    responseListData = catalogListSample;
  }

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Catalog"),
        ),
        body: IndexedStack(
          index: currentIndex,
          children: const [
            CatalogWidget(),
            CartWidget(),
          ],
        ),
        bottomNavigationBar: BottomBar(
          currentIndex: currentIndex,
          cartTotal: '${0}',
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
          },
        ),
      ),
    );
  }
}
