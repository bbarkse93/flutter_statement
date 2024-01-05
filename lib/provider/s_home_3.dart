import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/common/w_bottom_bar.dart';
import 'package:class_statement/provider/f_cart.dart';
import 'package:class_statement/provider/f_catalog.dart';
import 'package:class_statement/provider/state/provider_badge.dart';
import 'package:class_statement/provider/state/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen3 extends StatefulWidget {
  const HomeScreen3({super.key});

  @override
  State<HomeScreen3> createState() => _HomeScreen3State();
}

class _HomeScreen3State extends State<HomeScreen3> {
  // 현재 선택된 index
  int currentIndex = 0;

  // 선택된 catalog 정보를 담을 수 있는 자료구조 선언
  List<Catalog> catalogList = [];

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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (c) => ProviderCart()),
        ChangeNotifierProvider(
            create: (context) =>
                ProviderBadge(providerCart: context.read<ProviderCart>()),),
        // ChangeNotifierProvider(create: (c) => ProviderCart()),
        // Provider 단점 - 동일한 상태를 등록하면 마지막에 선언된 상태 제공자에게만 접근 가능
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("My Catalog"),
        ),
        body: IndexedStack(
          index: currentIndex,
          children: [
            CatalogWidget(),
            CartWidget(),
          ],
        ),
        bottomNavigationBar: Consumer<ProviderBadge>(
          builder: (context, providerBadge, child) => BottomBar(
            currentIndex: currentIndex,
            cartTotal: '${providerBadge.counter}',
            onTap: (index) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
