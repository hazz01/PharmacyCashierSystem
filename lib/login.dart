import 'package:apotek/mobile_dashboard.dart';
import 'package:flutter/material.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    // Add your username and password variables
  final String correctUsername = "admin"; // Replace with the correct username
  final String correctPassword = "password"; // Replace with the correct password

  // Controller for the text fields
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Function to validate login
  void _validateLogin() {
    String enteredUsername = usernameController.text;
    String enteredPassword = passwordController.text;

    // Check if the entered username and password are correct
    if (enteredUsername == correctUsername && enteredPassword == correctPassword) {
      // Navigate to Mobile_Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Mobile_Dashboard()),
      );
      print('Login Berhasil');

    } else {
      print('Login Gagal');
      print('Username: $enteredUsername');
      print('Password: $enteredPassword');
      print('Seharusnya: $correctUsername, $correctPassword');
      // Handle incorrect credentials (you can show an error message, etc.)
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // [logo]
            Image.asset(
              'assets/your_logo.png', // Ganti dengan path logo Anda
              height: 100.0,
              width: 100.0,
            ),

            SizedBox(height: 20.0),

            // Selamat Datang!
            const Text(
              'Selamat Datang!',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text('Masuk Untuk Melanjutkan'),

            const SizedBox(height: 20.0),

            // [text field] Masukkan Email
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Masukkan Email'),
            ),

            const SizedBox(height: 10.0),

            // [text field] Masukkan Password
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Masukkan Password'),
              obscureText: true,
            ),

            const SizedBox(height: 10.0),

            // [CheckBox] Ingat Kata Sandi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(
                      value: false, // Ganti dengan logika sesuai kebutuhan
                      onChanged: (value) {
                        // Ganti dengan logika sesuai kebutuhan
                      },
                    ),
                    const Text('Ingat Kata Sandi'),
                  ],
                ),
                TextButton(
                  onPressed: () {
                    // Ganti dengan logika sesuai kebutuhan
                  },
                  child: const Text('Lupa Kata Sandi'),
                ),
              ],
            ),

            const SizedBox(height: 10.0),

            // [Button] Lupa Kata Sandi

            const SizedBox(height: 20.0),

            // [Submit Button] Masuk
            ElevatedButton(
              onPressed: () {
                _validateLogin();
              },
              child: const Text('Masuk'),
            ),

            const SizedBox(height: 20.0),

            // [Footer] Copyright 2024 Grounded Team. All Right Reserved
            const Positioned(
              // alignment: Alignment.bottomCenter,
              bottom: 10,

              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Copyright 2024 Grounded Team. All Right Reserved',
                  style: TextStyle(fontSize: 12.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
