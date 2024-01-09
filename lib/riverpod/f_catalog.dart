import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/common/w_catalog_item.dart';
import 'package:flutter/material.dart';

class CatalogWidget extends StatelessWidget {
  const CatalogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // 임시코드 추가

    return ListView.builder(
      itemCount: catalogListSample.length,
      itemBuilder: (context, index) {
        Catalog catalog = catalogListSample[index];

        return CatalogItem(
          catalog: catalog,
          // 임시 수정
          isInCart: false,
          onPressedCatalog: (catalog) {},
        );
      },
    );
  }
}
