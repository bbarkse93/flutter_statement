import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/common/w_show_alert_dialog.dart';
import 'package:class_statement/inherited_widget/state_management/inh_cart_widget.dart';
import 'package:flutter/material.dart';

// InheritedWidget을 활용하면
// 생성자 의존 주입을 하지 않아도 됨
class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print("여기는 Cart Build 함수 실행");
    // BuildContext 안에서 사용해야 함
    InheritedCartWidget? inheritedCartWidget = InheritedCartWidget.of(context);
    return inheritedCartWidget == null
        ? CustomDialogManager.createAlert(context, '경고', '잘못된 접근', () {})
        : Column(
            children: [
              // 카탈로그 아이템
              Expanded(
                flex: 5,
                child: ListView.builder(
                  itemCount: inheritedCartWidget.cartList.length,
                  itemBuilder: (context, index) {
                    // 하나의 오브젝트만 뽑자
                    Catalog catalog = inheritedCartWidget.cartList[index];
                    return CatalogItem(
                        catalog: catalog,
                        isInCart: true,
                        onPressedCatalog: inheritedCartWidget.onPressedCatalog);
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
                    'SUM : ${inheritedCartWidget.cartList.length}',
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
