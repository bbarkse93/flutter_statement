import 'package:class_statement/provider/state/provider_cart.dart';
import 'package:flutter/material.dart';

class ProviderBadge extends ChangeNotifier {
  ProviderBadge({required this.providerCart}) {
    providerCart.addListener(providerCartListener); // 청취
  }

  // 상태 속성
  int counter = 0;

  // 청취
  final ProviderCart providerCart;

  // 청취하고 있다가 ProviderCart가 변경되면 어떤 동작을 할지 결정
  void providerCartListener() {
    counter = providerCart.catalogCartList.length;
    // 알림 처리
    notifyListeners();
  }

  // 메모리 해제 처리
  @override
  void dispose(){
    //메모리에서 제거 처리
    providerCart.removeListener(providerCartListener);
    // 부모 클래스에 함수 호출
    super.dispose();
  }

}
