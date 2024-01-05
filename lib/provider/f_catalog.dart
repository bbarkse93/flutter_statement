import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/common/w_catalog_item.dart';
import 'package:class_statement/provider/state/provider_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CatalogWidget extends StatelessWidget {
  const CatalogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ProviderCart providerCart = context.watch<ProviderCart>();
    return ListView.builder(
      itemCount: catalogListSample.length,
      itemBuilder: (context, index) {
        Catalog catalog = catalogListSample[index];

        return CatalogItem(
            catalog: catalog,
            isInCart: providerCart.catalogCartList.contains(catalog),
            onPressedCatalog: providerCart.onPressedCatalog);
      },
    );
  }
}
