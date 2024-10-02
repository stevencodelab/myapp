import 'package:flutter/material.dart';
import 'dart:async'; // untuk simulasi delay loading

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false; // Tambahkan state untuk loading

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set background color to blue
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    'assets/images/digital-library.png',
                    height: 80,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'BukuHub',
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // Text color set to white
                  ),
                ),
                const Text(
                  'LIBRARY APP',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 40),
                _buildTextField(Icons.email, 'Email or Phone'),
                const SizedBox(height: 20),
                _buildTextField(Icons.lock, 'Password', isPassword: true),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                _isLoading
                    ? _buildLoadingIndicator()
                    : _buildLoginButton(context),
                const SizedBox(height: 20),
                const Text(
                  'or',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 10),
                _buildCreateAccountButton(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hintText,
      {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white),
        filled: true,
        fillColor: Colors.blue[300], // Light blue for the text fields
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
      ),
      style: const TextStyle(color: Colors.white),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isLoading = true; // Tampilkan indikator loading
        });

        // Simulasi proses login dengan delay 3 detik
        Future.delayed(const Duration(seconds: 3), () {
          setState(() {
            _isLoading = false; // Sembunyikan indikator loading
          });

          // Arahkan ke halaman dashboard setelah login berhasil
          Navigator.pushNamed(context, '/dashboard');
        });
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 120),
        backgroundColor: Colors.white, // White background for the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Text(
        'Login',
        style: TextStyle(
            color: Colors.blue, fontSize: 18), // Blue text for the button
      ),
    );
  }

  Widget _buildCreateAccountButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, '/signup');
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 80),
        backgroundColor: Colors.white, // White background for the button
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      child: const Text(
        'Create an account',
        style: TextStyle(
            color: Colors.blue, fontSize: 18), // Blue text for the button
      ),
    );
  }

  // Widget untuk menampilkan loading indicator
  Widget _buildLoadingIndicator() {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
    );
  }
}
