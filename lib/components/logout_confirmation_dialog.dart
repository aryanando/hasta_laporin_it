import 'package:flutter/material.dart';
import 'package:hasta_laporin_it/pages/login/login.dart';
import 'package:hasta_laporin_it/pages/login/logout_handle.dart';

void showAnimatedDialog(BuildContext context) {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    pageBuilder: (context, anim1, anim2) {
      return const SizedBox.shrink(); // Placeholder
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return Transform.scale(
        scale: anim1.value,
        child: Opacity(
          opacity: anim1.value,
          child: AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            title: Text("Konfirmasi"),
            content: Text("Anda yakin untuk keluar?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text("Batal"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text("Ya"),
              ),
            ],
          ),
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
  ).then((confirmed) {
    if (confirmed == true) {
      logoutUser((status) => {
            if (status)
              {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                )
              }
          });
    }
  });
}
