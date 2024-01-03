import 'package:class_statement/common/models/vo_catalog.dart';
import 'package:flutter/material.dart';

// 1. 공유상태로 관리할 데이터를 결정한다. ==> cart 데이터

// 규칙 1. 공유상태로 만들 데이터를 InheritedWidget 상속받아야 함
class InheritedCartWidget extends InheritedWidget {

  // 카트에 담긴 리스트 데이터를 관리
  final List<Catalog> cartList;
  // 콜백함수 필요
  final void Function(Catalog catalog) onPressedCatalog;

  const InheritedCartWidget(
      {required this.cartList,
      required this.onPressedCatalog,
      required super.child});

  // 외부에서 쉽게 접근할 수 있는 static 메서드를 만들어 준다.
  // 개발모드에서 사용되는 코드, 릴리즈 모드에서는 권장하지 않음
  // static InheritedCartWidget of(BuildContext context) {
  //   final InheritedCartWidget? result =
  //       context.dependOnInheritedWidgetOfExactType<InheritedCartWidget>(); // << 얘가 핵심
  //   assert(result != null, "Not Found InheritedCartWidget in context");
  //   return result!;
  // }

  // 릴리즈 모드에서 사용되는 코드
  static InheritedCartWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedCartWidget>();
  }


  // 위젯 트리에서 해당 위젯이 업데이트 될 때마다 호출되는 메서드
  // 위젯 트리가 다시 빌드할 필요가 있는지 알려줌
  // true or false
  // true => 재빌드 / false => 스탑
  @override
  bool updateShouldNotify(covariant InheritedCartWidget oldWidget) {
    return cartList != oldWidget.cartList;
  }
}
