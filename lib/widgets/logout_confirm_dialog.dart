import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../theme/neon_theme.dart';

class LogoutConfirmDialog extends StatelessWidget {
  const LogoutConfirmDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Dialog(backgroundColor: Colors.transparent,
      child: Container(padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: AppColors.bg, borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.pink.withValues(alpha:0.5)),
          boxShadow: const [BoxShadow(color: Color(0x66FF4FD8), blurRadius: 24, spreadRadius: 1)]),
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Container(height: 60, width: 60,
            decoration: BoxDecoration(shape: BoxShape.circle,
              gradient: const LinearGradient(colors: [AppColors.pink, AppColors.purple]),
              boxShadow: const [BoxShadow(color: Color(0x99FF4FD8), blurRadius: 18, spreadRadius: 1)]),
            child: const Icon(Icons.logout_rounded, color: Colors.white, size: 28)),
          const SizedBox(height: 18),
          const Text('Log out?', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          const Text("You'll need to log in again to access your account.",
            textAlign: TextAlign.center, style: TextStyle(color: AppColors.subtitle, fontSize: 14)),
          const SizedBox(height: 24),
          Row(children: [
            Expanded(child: OutlinedGhostButton(text: 'Cancel', onPressed: () => Get.back())),
            const SizedBox(width: 12),
            Expanded(child: GradientButton(text: 'Log out', icon: Icons.logout,
              gradient: AppColors.dangerGradient, onPressed: controller.logout)),
          ]),
        ])));
  }
}