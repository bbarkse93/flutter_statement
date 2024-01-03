import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/inherited_widget/state_management/inh_cart_widget.dart';
import 'package:flutter/material.dart';

// 생성자 의존 주입 제거
class CatalogWidget extends StatelessWidget {
  const CatalogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("여기는 CatalogWidget Build 함수 실행");
    // 컨텍스트를 통해서 공유상태 데이터에 접근
    InheritedCartWidget inheritedCartWidget = InheritedCartWidget.of(context)!;

    return ListView.builder(
      itemCount: catalogListSample.length,
      itemBuilder: (context, index) {
        Catalog catalog = catalogListSample[index];

        return CatalogItem(
            catalog: catalog,
            isInCart: inheritedCartWidget.cartList.contains(catalog),
            onPressedCatalog: inheritedCartWidget.onPressedCatalog);
      },
    );
  }
}
