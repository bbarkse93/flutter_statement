import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/provider/state/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({super.key});

  // 임시코드 추가

  @override
  Widget build(BuildContext context) {
    ProviderCart providerCart = context.watch<ProviderCart>();

    return Column(
      children: [
        // 카탈로그 아이템
        Expanded(
          flex: 5,
          child: ListView.builder(
            itemCount: providerCart.catalogCartList.length,
            itemBuilder: (context, index) {
              // 하나의 오브젝트만 뽑자
              Catalog catalog = providerCart.catalogCartList[index];
              return CatalogItem(
                  catalog: catalog,
                  isInCart: true,
                  onPressedCatalog: providerCart.onPressedCatalog);
            },
          ),
        ),
        // 구분선
        Divider(
          height: 1,
          thickness: 1,
          color: Colors.green,
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              'SUM : ${providerCart.catalogCartList.length}',
              style: TextStyle(
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
