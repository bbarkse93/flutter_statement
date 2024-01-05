import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:flutter/material.dart';

// 상태클래스 설계
class ProviderCart extends ChangeNotifier {
  // 상태 속성
  List<Catalog> catalogCartList = [];

  // 상태 변경 로직 설계
  void onPressedCatalog(Catalog catalog) {
    if (catalogCartList.contains(catalog)) {
      catalogCartList = catalogCartList.where((element) {
        return element != catalog;
      }).toList();
    } else {
      catalogCartList = [...catalogCartList, catalog];
    }
    // 상태 클래스를 듣고 있는 객체들에게 상태 변경을 알리고 싶다면
    notifyListeners();
  }

}
