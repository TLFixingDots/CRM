import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import '../../core/router/app_router.dart';
import '../../theme/app_colors.dart';
import '../../core/local/shared_prefs.dart';
import '../../feature/auth/presentation/providers/auth_provider.dart';

class CustomDrawer extends ConsumerWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = SharedPrefs.getUser();

    return Drawer(
      width: 290,
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          // Premium Gradient Glass Backdrop
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(35),
              bottomRight: Radius.circular(35),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
              child: Container(
                decoration: BoxDecoration(
                  gradient: AppColors.mainGradient,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                  border: Border.all(
                    color: Colors.white.withValues(alpha: 0.5),
                    width: 1.2,
                  ),
                ),
              ),
            ),
          ),

          Column(
            children: [
              // Compact Drawer Header
              _buildHeader(user),

              // Tight Drawer Items
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 10,
                  ),
                  children: [
                    _buildDrawerItem(
                      icon: Icons.dashboard_rounded,
                      title: 'Dashboard',
                      onTap: () => Navigator.pop(context),
                      isSelected: true,
                    ),
                    _buildDrawerItem(
                      icon: Icons.precision_manufacturing_rounded,
                      title: 'Products',
                      onTap: () {
                        Navigator.pop(context);
                        context.push(AppRouter.productList);
                      },
                    ),
                    _buildDrawerItem(
                      icon: Icons.person_rounded,
                      title: 'My Profile',
                      onTap: () {},
                    ),
                    _buildDrawerItem(
                      icon: Icons.notifications_rounded,
                      title: 'Notifications',
                      onTap: () {},
                    ),
                    _buildDrawerItem(
                      icon: Icons.settings_rounded,
                      title: 'Settings',
                      onTap: () {},
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      child: Divider(color: Colors.black12, thickness: 0.5),
                    ),
                    _buildDrawerItem(
                      icon: Icons.help_rounded,
                      title: 'Help & Support',
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              // Compact Drawer Footer
              _buildFooter(ref, context),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(dynamic user) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(24, 50, 24, 25),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.black12, width: 0.5)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: AppColors.secondary,
            child: Text(
              user?.name.substring(0, 1).toUpperCase() ?? 'U',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w900,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 15),
          Text(
            user?.name ?? 'User Name',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
              color: AppColors.secondary,
              letterSpacing: -0.5,
            ),
          ),
          Text(
            user?.email ?? 'user@example.com',
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              (user?.roleName != null && user!.roleName.isNotEmpty)
                  ? user.roleName
                  : "N/A",
              style: const TextStyle(
                fontSize: 11,
                color: AppColors.primary,
                fontWeight: FontWeight.w900,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawerItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 2),
      decoration: BoxDecoration(
        color:
            isSelected
                ? AppColors.secondary.withValues(alpha: 0.08)
                : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? AppColors.secondary : Colors.black45,
          size: 22,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
            color: isSelected ? AppColors.secondary : Colors.black87,
          ),
        ),
        onTap: onTap,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        dense: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }

  Widget _buildFooter(WidgetRef ref, BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.black12, width: 0.5)),
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton.icon(
              onPressed: () => ref.read(authProvider.notifier).logout(),
              icon: const Icon(
                Icons.logout_rounded,
                color: Colors.redAccent,
                size: 18,
              ),
              label: const Text(
                'Logout',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.redAccent, width: 1.2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          FutureBuilder<PackageInfo>(
            future: PackageInfo.fromPlatform(),
            builder: (context, snapshot) {
              final version = snapshot.data?.version ?? '1.0.0';
              return Text(
                'v$version',
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black26,
                  fontWeight: FontWeight.w700,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
