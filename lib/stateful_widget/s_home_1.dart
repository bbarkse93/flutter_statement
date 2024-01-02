import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/common/w_bottom_bar.dart';
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
  List<Catalog> catalogList = [

  ];

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

  // 콜백 받을 메서드 선언
  void onPressedCatalog(Catalog catalog) {
    // 콜백이 일어나면 UI 업데이트 처리
    print("여기 HomeScreen 위젯 이벤트 발생");
    setState(() {
      if (catalogList.contains(catalog)) {
        catalogList.remove(catalog);
      } else {
        catalogList.add(catalog);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("My Catalog"),
      ),
      body: IndexedStack(
        index: currentIndex,
        children: [
          CatalogWidget(
              responseListData: responseListData,
              cartCatalogList: catalogList,
              onPressedCatalog: onPressedCatalog),
          CartWidget(
            cartList: catalogList,
            onPressedCatalog: onPressedCatalog,
          ),
        ],
      ),
      bottomNavigationBar: BottomBar(
        currentIndex: currentIndex,
        cartTotal: '${catalogList.length}',
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
    );
  }
}
