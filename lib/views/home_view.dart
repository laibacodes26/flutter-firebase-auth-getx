import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../theme/neon_theme.dart';
import '../widgets/logout_confirm_dialog.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  String _greeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good morning';
    if (hour < 17) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(child: NeonFrame(child: Obx(() {
        final user = controller.currentUser.value;
        final name = user?.name ?? 'User';
        final initials = name.trim().isEmpty ? '?' : name.trim()[0].toUpperCase();
        return SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            Row(children: [
              AvatarCircle(initials: initials, size: 54),
              const SizedBox(width: 14),
              Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(_greeting(), style: const TextStyle(color: AppColors.subtitle, fontSize: 13)),
                const SizedBox(height: 2),
                Text(name, style: const TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold),
                  overflow: TextOverflow.ellipsis),
              ])),
              Container(
                decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.fieldFill,
                  border: Border.all(color: AppColors.pink.withValues(alpha:0.4))),
                child: IconButton(onPressed: () => Get.dialog(const LogoutConfirmDialog()),
                  icon: const Icon(Icons.logout_rounded, color: AppColors.pink, size: 20))),
            ]),
            const SizedBox(height: 26),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: AppColors.fieldFill, borderRadius: BorderRadius.circular(24),
                border: Border.all(color: AppColors.purple.withValues(alpha:0.5)),
                boxShadow: const [BoxShadow(color: Color(0x448B5CF6), blurRadius: 20, spreadRadius: 1)]),
              child: Column(children: [
                const LockOrbitIcon(size: 110),
                const SizedBox(height: 14),
                const Text("You're logged in", textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                const Text('Your session is protected with Firebase Authentication.', textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.subtitle, fontSize: 14)),
                const SizedBox(height: 18),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
                  _FeatureChip(icon: Icons.shield_outlined, label: 'Secure'),
                  _FeatureChip(icon: Icons.bolt_outlined, label: 'Realtime'),
                  _FeatureChip(icon: Icons.cloud_done_outlined, label: 'Synced'),
                ]),
              ])),
            const SizedBox(height: 20),
            Container(
              width: double.infinity, padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(color: AppColors.fieldFill, borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.purple.withValues(alpha:0.3))),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Row(children: [
                  const Icon(Icons.badge_outlined, color: AppColors.purple, size: 20),
                  const SizedBox(width: 8),
                  const Text('Account Information', style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold)),
                ]),
                const SizedBox(height: 20),
                _InfoRow(icon: Icons.person_outline, label: 'Name', value: name),
                const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: AppColors.hint, height: 1)),
                _InfoRow(icon: Icons.email_outlined, label: 'Email', value: user?.email ?? ''),
                const Padding(padding: EdgeInsets.symmetric(vertical: 16), child: Divider(color: AppColors.hint, height: 1)),
                Row(children: [
                  _IconBadge(icon: Icons.verified_user_outlined),
                  const SizedBox(width: 12),
                  const Text('Status', style: TextStyle(color: AppColors.subtitle, fontSize: 13)),
                  const Spacer(),
                  Container(padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(color: const Color(0xFF19B86B).withValues(alpha:0.15), borderRadius: BorderRadius.circular(20)),
                    child: const Text('Active', style: TextStyle(color: Color(0xFF19B86B), fontSize: 12, fontWeight: FontWeight.w600))),
                ]),
              ])),
            const SizedBox(height: 28),
            GradientButton(text: 'Logout', icon: Icons.logout, gradient: AppColors.dangerGradient,
              onPressed: () => Get.dialog(const LogoutConfirmDialog())),
            const SizedBox(height: 10),
          ]),
        );
      }))),
    );
  }
}

class _FeatureChip extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FeatureChip({required this.icon, required this.label});
  @override
  Widget build(BuildContext context) => Column(children: [
    Container(height: 40, width: 40,
      decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.purple.withValues(alpha:0.15)),
      child: Icon(icon, color: AppColors.purple, size: 20)),
    const SizedBox(height: 6),
    Text(label, style: const TextStyle(color: AppColors.subtitle, fontSize: 11)),
  ]);
}

class _IconBadge extends StatelessWidget {
  final IconData icon;
  const _IconBadge({required this.icon});
  @override
  Widget build(BuildContext context) => Container(
    height: 34, width: 34,
    decoration: BoxDecoration(shape: BoxShape.circle, color: AppColors.purple.withValues(alpha:0.15)),
    child: Icon(icon, color: AppColors.purple, size: 18));
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoRow({required this.icon, required this.label, required this.value});
  @override
  Widget build(BuildContext context) => Row(children: [
    _IconBadge(icon: icon),
    const SizedBox(width: 12),
    Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: const TextStyle(color: AppColors.subtitle, fontSize: 12)),
      const SizedBox(height: 2),
      Text(value, style: const TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600),
        overflow: TextOverflow.ellipsis),
    ])),
  ]);
}