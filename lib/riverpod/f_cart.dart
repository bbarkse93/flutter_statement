import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/riverpod/state/riverpod_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartWidget extends ConsumerWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// 상태관리 데이터가 변경 되었는 지 계속 확인 해야 함 => 구독 처리
    /// 전역변수로 세팅
    /// -> state -> List<Catalog>
    List<Catalog> cartProviderList = ref.watch(cartProvider);

    return Column(
      children: [
        // 카탈로그 아이템
        Expanded(
          flex: 5,
          child: ListView.builder(
            itemCount: cartProviderList.length,
            itemBuilder: (context, index) {
              // 하나의 오브젝트만 뽑자
              Catalog catalog = cartProviderList[index];
              return CatalogItem(
                  catalog: catalog,
                  isInCart: true,
                  // ref.read(cartProvider.notifier) ==> RiverpodCart
                  onPressedCatalog:
                      ref.read(cartProvider.notifier).onCatalogPressed);
            },
          ),
        ),
        // 구분선
        const Divider(
          height: 1,
          thickness: 1,
          color: Colors.green,
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              'SUM : ${cartProviderList.length}',
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        )
        // 합계 - 텍스트
      ],
    );
  }
}
