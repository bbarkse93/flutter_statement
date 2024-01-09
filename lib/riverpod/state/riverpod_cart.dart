import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/riverpod.dart';

// 포인트 - 상태 클래스와 상태 변경 로직 클래스를 분리한다.

// 1. 상태 클래스 설계
class RiverpodCart extends Notifier<List<Catalog>>{
  /// 상태
  /// build()는 Notifier 객체가 처음 생성될 때 딱 한 번 호출되어 상태를 설정(State)
  /// 즉, 내부에는 T _state;가 있다.
  @override
  List<Catalog> build() {
    return [];
  }

  // 행위
  void onCatalogPressed(Catalog catalog){
    // 얕은 복사 (수정필요)
    if(state.contains(catalog)){
      state.remove(catalog);
    } else {
      state.add(catalog);
    }
  }
}

// 2. 전역변수 설계 - 상태 변경 (접근) 로직 담당
final cartProvider = NotifierProvider<RiverpodCart, List<Catalog>>(() {
  return RiverpodCart();
});