import 'package:flutter/material.dart';
import 'login.dart';
import 'db/database_helper.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Logo en el header
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 20),
              child: Row(
                children: [
                  Image.asset('assets/images/logo.png', height: 40),
                  const SizedBox(width: 8),
                  const Text(
                    'ubo',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F1230),
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Ícono de usuario
            const CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFFF1EDFD),
              child: Icon(Icons.person, size: 50, color: Color(0xFF3A1B7A)),
            ),

            const SizedBox(height: 20),

            const Text(
              'SIGN UP',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0F1230),
              ),
            ),

            const SizedBox(height: 20),

            // Inputs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                children: [
                  TextField(
                    controller: usernameController,
                    decoration: InputDecoration(
                      hintText: 'Username',
                      filled: true,
                      fillColor: const Color(0xFFF4F4F4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      filled: true,
                      fillColor: const Color(0xFFF4F4F4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      filled: true,
                      fillColor: const Color(0xFFF4F4F4),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.lock),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Botón
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    final username = usernameController.text.trim();
                    final email = emailController.text.trim();
                    final password = passwordController.text.trim();

                    if (username.isEmpty || email.isEmpty || password.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Por favor llena todos los campos')),
                      );
                      return;
                    }

                    try {
                      await DatabaseHelper.instance.insertUser({
                        'username': username,
                        'email': email,
                        'password': password,
                      });
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Usuario registrado con éxito')),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const Login()),
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Error: usuario o correo ya existe')),
                      );
                    }
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF6C45E6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Sign Up'),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Enlace a login
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const Login()),
                );
              },
              child: const Text.rich(
                TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: Colors.black54),
                  children: [
                    TextSpan(
                      text: 'SIGN IN',
                      style: TextStyle(
                        color: Color(0xFF3A1B7A),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
