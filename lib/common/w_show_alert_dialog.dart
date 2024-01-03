import 'package:flutter/material.dart';

class CustomDialogManager {
  static Widget createAlert(
      BuildContext context, String title, String msg, VoidCallback onConfirm) {
    return AlertDialog(
      title: Text(title),
      content: Text(msg),
      actions: [
        TextButton(
            onPressed: () {
              onConfirm();
              Navigator.of(context).pop();
            },
            child: Text('확인')),
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('취소')),
      ],
    );
  }

  // 위젯 반환 없이 바로 실행
  static void showAlert(
      BuildContext context, String title, String msg, VoidCallback onConfirm) {
    showDialog(
        context: context,
        builder: (context) {
          return createAlert(context, title, msg, onConfirm);
        });
  }
}
