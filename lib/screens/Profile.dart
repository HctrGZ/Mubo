import 'package:flutter/material.dart';
import 'package:mubo/Widgets/MainBottomNav.dart';
import 'package:mubo/screens/dashboardMain.dart';
import 'package:mubo/screens/MyList.dart';
import 'package:mubo/screens/searchScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int _selectedIndex = 3;

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardMain()),
      );
    } else if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyListScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2F4A),
      appBar: AppBar(
        title: const Text('Perfil'),
        backgroundColor: const Color(0xFF1C1F34),
      ),
      body: const Center(
        child: Text('Aquí va el contenido del Perfil', style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: MainBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
      ),
    );
  }
}
