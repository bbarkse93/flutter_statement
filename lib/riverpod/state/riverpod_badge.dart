// 1. 상태 클래스 만들기

import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:class_statement/riverpod/state/riverpod_cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 다른 상태 클래스와 상호 작용
// [] <= 카탈로그 리스트
class RiverpodBadge extends Notifier<int>{

  // 상태 --> int (User), (String)

  // 메모리에 올라갈 때 단 한 번만 호출되는 메서드
  // Notifier - T State
  @override
  int build() {
    // 청취 ()
    List<Catalog> cartCatalogList = ref.watch(cartProvider);
    return cartCatalogList.length;
  }
}
// 2. 전역 변수 설계
final badgeProvider = NotifierProvider<RiverpodBadge, int>(RiverpodBadge.new);

// Riverpod 자테는 메모리 누수에 대해 걱정할 필요가 없게 설계되어 있음!!