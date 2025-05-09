import 'package:flutter/material.dart';

class MainHeader extends StatelessWidget implements PreferredSizeWidget {
  final Widget? logo;

  const MainHeader({super.key, this.logo});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: const Color(0xFF1C1F34),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Muestra logo personalizado o la letra M
            logo ??
                const Text(
                  'M',
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                  ),
                ),
            const SizedBox(width: 8),
            const Text(
              'ubo',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 40,
                letterSpacing: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 18);
}
