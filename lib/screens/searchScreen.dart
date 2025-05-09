import 'package:flutter/material.dart';
import 'package:mubo/Widgets/MainBottomNav.dart';
import 'package:mubo/screens/MyList.dart';
import 'package:mubo/screens/Profile.dart';
import 'package:mubo/screens/dashboardMain.dart';
import '../Widgets/mainHeader.dart';

import '../Widgets/movieCard.dart';  // Aquí importamos el widget de las tarjetas de películas

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedIndex = 1;  // Estado para la barra de navegación inferior
  String query = "";  // busqueda vacia

  void _onNavTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // aqui sigue la logica de la naveggacion de la barrita de abajo
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const DashboardMain()),
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
      appBar: const MainHeader(),  //aqui de nuez el encabezado
      backgroundColor: const Color(0xFF2D2F4A),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra de búsqueda
            _buildSearchBar(),

            const SizedBox(height: 20),

            // Sección de tendencias
            _buildTrendingSection(),

            const SizedBox(height: 20),

            // Resultados de la búsqueda (usamos un GridView como placeholder)
            _buildSearchResults(),
          ],
        ),
      ),
      bottomNavigationBar: MainBottomNav(  // Barra inferior de opciones
        currentIndex: _selectedIndex,
        onTap: _onNavTapped,
      ),
    );
  }

  // barra de busqueda
  Widget _buildSearchBar() {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1F34),
        borderRadius: BorderRadius.circular(25),
      ),
      child: TextField(
        onChanged: (value) {
          setState(() {
            query = value;
          });
        },
        decoration: InputDecoration(
          hintText: 'Buscar películas...',
          hintStyle: const TextStyle(color: Colors.grey),
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          border: InputBorder.none,
          suffixIcon: IconButton(
            icon: const Icon(Icons.search),
            color: Colors.grey,
            onPressed: () {
              //aqui sera alguna funcion pa buscar
              print("Buscando: $query");
            },
          ),
        ),
        style: const TextStyle(color: Colors.white),
      ),
    );
  }


  // Método para construir la sección de Trending
  Widget _buildTrendingSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Trending',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10),
        // Lista de películas trending como placeholders
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.trending_up, color: Colors.white),
            Text(
              'Película 1',
              style: TextStyle(color: Colors.white70),
            ),
            Icon(Icons.trending_up, color: Colors.white),
            Text(
              'Película 2',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ],
    );
  }

  // Metodo para construir los resultados de búsqueda
  Widget _buildSearchResults() {
    return GridView.builder(
      shrinkWrap: true,  // Para que no ocupe todo el espacio disponible
      physics: NeverScrollableScrollPhysics(),  // Para deshabilitar el scroll
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,  // Dos por fila
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemCount: 10,  // Número de resultados (puedes cambiarlo con los datos de la API)
      itemBuilder: (context, index) {
        return const MovieCard();  // aqui le vamos a tener que pasar la info para que jalepos de la api, esta es la "key" que te digo
      },
    );
  }
}
