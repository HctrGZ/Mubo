import 'package:flutter/material.dart';

class MainBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const MainBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color(0xFF1C1F34),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      currentIndex: currentIndex,
      onTap: onTap,
      type: BottomNavigationBarType.fixed,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Buscar',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.star_border),
          label: 'Mi Lista',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
            radius: 12,
            backgroundColor: Colors.grey.shade700,
            child: const Icon(Icons.person, color: Colors.white, size: 16),
          ),
          label: 'Perfil',
        ),
      ],
    );
  }
}
