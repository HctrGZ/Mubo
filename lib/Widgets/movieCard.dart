import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white24,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Placeholder para la imagen de la película
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQuwrgPYF6vaTDQgAmAXvtcVxfZ7tc-rZGgeg&s', // aqui ira la portada de las pelis, tendremos que poner un key desde el padre para que se carge desde alla mediante una llamada a la api
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          // Título de la película
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Película Título',  //y aqui el tituilo
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
              ),
              overflow: TextOverflow.ellipsis, // Si el nombre es largo, se trunca
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }
}
