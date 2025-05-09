import 'package:flutter/material.dart';
import 'package:mubo/Widgets/MainBottomNav.dart';
import 'package:mubo/screens/dashboardMain.dart';
import 'package:mubo/screens/Profile.dart';
import 'package:mubo/screens/searchScreen.dart';

class MyListScreen extends StatefulWidget {
  const MyListScreen({super.key});

  @override
  State<MyListScreen> createState() => _MyListScreenState();
}

class _MyListScreenState extends State<MyListScreen> {
  int _selectedIndex = 2;

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
      //Navigator.pop(context); // para regresar
    } else if (index == 3) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ProfileScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2D2F4A),
      appBar: AppBar(
        title: const Text('Mi Lista'),
        backgroundColor: const Color(0xFF1C1F34),
      ),
      body: const Center(
        child: Text('Aquí va el contenido de Mi Lista', style: TextStyle(color: Colors.white)),
      ),
      bottomNavigationBar: MainBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
      ),
    );
  }
}
