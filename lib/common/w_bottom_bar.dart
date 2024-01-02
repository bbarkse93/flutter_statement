import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;

class BottomBar extends StatelessWidget {
  /// 현재 선택 된 index
  /// 카트에 담긴 상품 개수
  /// 클릭 이벤트
  final int currentIndex;
  final String cartTotal;
  final Function(int index)? onTap;

  const BottomBar(
      {super.key,
      required this.currentIndex,
      required this.cartTotal,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: onTap,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.storefront),
            label: 'Catalog',
          ),
          BottomNavigationBarItem(
            // 라이브러리 사용 as badges 접근
            icon: badges.Badge(
              badgeContent: Text(
                cartTotal,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                ),
              ),
              child: const Icon(Icons.shopping_cart),
            ),
            label: 'Cart',
          )
        ]);
  }
}
