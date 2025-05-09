import 'package:flutter/material.dart';
import 'package:mubo/Widgets/MainBottomNav.dart';
import 'package:mubo/screens/MyList.dart';
import 'package:mubo/screens/Profile.dart';
import 'package:mubo/screens/searchScreen.dart';
import '../widgets/mainHeader.dart';
// Aquí importamos la barra de navegación inferior

class DashboardMain extends StatefulWidget {
  const DashboardMain({super.key});

  @override
  State<DashboardMain> createState() => _DashboardMainState();
}

class _DashboardMainState extends State<DashboardMain> {
  int _selectedIndex = 0;

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // aqui sigue la logica de la naveggacion de la barrita de abajo
    if (index == 1) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const SearchScreen()),
      );
    } else if (index == 2) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyListScreen()),
      );
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
      appBar: const MainHeader(),  // aqui ando utilizando el mainheader como un componente en angular o react, reutilizable para donde deba de ir
      backgroundColor: const Color(0xFF2D2F4A),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            // Placeholder para el carrusel
            PlaceholderSection(title: 'Carrusel de Películas'),

            SizedBox(height: 20),

            // Placeholder para Top 10
            PlaceholderSection(title: 'Top 10 de la Semana'),

            SizedBox(height: 20),

            // Placeholder para Noticias
            PlaceholderSection(title: 'Noticias de Cine'),

            SizedBox(height: 20),

            // Placeholder para Trailers
            PlaceholderSection(title: 'Trailers Recientes'),
          ],
        ),
      ),
      bottomNavigationBar: MainBottomNav(
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
      ),
    );
  }
}

//este widget es un ejemplo paola, iran unos nuevos y en otros archivos, aqui nooooooo
class PlaceholderSection extends StatelessWidget {
  final String title;

  const PlaceholderSection({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
