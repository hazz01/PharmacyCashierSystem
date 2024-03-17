import 'package:apotek/mobile_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:footer/footer.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  final String correctPassword =
      "password"; // Replace with the correct password

  // Controller for the text fields
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isButtonEnabled = false;

  void _validateLogin() {
    String enteredUsername = usernameController.text;
    String enteredPassword = passwordController.text;

    // Check if the entered username and password are correct
    if (enteredUsername == correctUsername &&
        enteredPassword == correctPassword) {
      // Navigate to Mobile_Dashboard
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Mobile_Dashboard()),
      );
      print('Login Berhasil');
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: InfoBannerActionsFb1(
            primaryColor: Color(0xff4338CA),
            text:
                "Login failed. Please check your username or password. If there is an error, try contacting the admin",
            actions: [
              TextButton(
                child: const Text(
                  'CONTACT ADMIN',
                  style: TextStyle(color: Color(0xff4338CA)),
                ),
                onPressed: () {
                  launch('https://wa.me/6289623084881');
                },
              ),
              TextButton(
                child: const Text(
                  'DISMISS',
                  style: TextStyle(color: Color(0xff4338CA)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
            icon: Icon(
              Icons.sms_failed_outlined,
              color: Colors.white,
            ),
          ));
        },
      );
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
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          constraints: BoxConstraints(maxWidth: 600),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // [logo]
                Image.asset(
                  'images/logo.png', // Ganti dengan path logo Anda
                  height: 200.0,
                  width: 200.0,
                ),

                // SizedBox(height: 10.0),

                // Selamat Datang!
                const Text(
                  'Selamat Datang!',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),

                const Text(
                  'Masuk Untuk Melanjutkan',
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 50.0),

                // [text field] Masukkan Email
                TextField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    label: Text(
                      'Masukkan Username',
                      style: TextStyle(
                          color: Colors.black54, fontWeight: FontWeight.w500),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff4338CA)),
                    ),
                  ),
                  onChanged: (_) {
                    setState(
                      () {
                        _isButtonEnabled = usernameController.text.isNotEmpty &&
                            passwordController.text.isNotEmpty;
                      },
                    );
                  },
                ),

                const SizedBox(height: 10.0),

                // [text field] Masukkan Password
                TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      label: Text(
                        'Masukkan Password',
                        style: TextStyle(
                            color: Colors.black54, fontWeight: FontWeight.w500),
                      ),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Color(0xff4338CA)))),
                  obscureText: true,
                  onChanged: (_) {
                    setState(() {
                      _isButtonEnabled = usernameController.text.isNotEmpty &&
                          passwordController.text.isNotEmpty;
                    });
                  },
                ),

                const SizedBox(height: 20.0),

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
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                content: InfoBannerActionsFb1(
                              primaryColor: Color(0xff4338CA),
                              text:
                                  "Please contact admin if you forget your password",
                              actions: [
                                TextButton(
                                  child: const Text(
                                    'CONTACT ADMIN',
                                    style: TextStyle(color: Color(0xff4338CA)),
                                  ),
                                  onPressed: () {
                                    _launchURL();
                                  },
                                ),
                                TextButton(
                                  child: const Text(
                                    'DISMISS',
                                    style: TextStyle(color: Color(0xff4338CA)),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                              icon: Icon(
                                Icons.contact_phone_rounded,
                                color: Colors.white,
                              ),
                            ));
                          },
                        );
                      },
                      child: const Text(
                        'Lupa Kata Sandi',
                        style: TextStyle(color: Color(0xff4338CA)),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 10.0),

                // [Button] Lupa Kata Sandi

                const SizedBox(height: 20.0),

                // [Submit Button] Masuk
                // SizedBox(
                //   width: double.infinity,
                //   height: 40,
                //   child: ElevatedButton(
                //     onPressed: () {
                //       _validateLogin();
                //     },
                //     child: const Text('Masuk', style: TextStyle(fontSize: 20),),
                //   ),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isButtonEnabled ? _validateLogin : null,
                    child: const Text('Masuk'),
                    style: ElevatedButton.styleFrom(
                      primary:
                          _isButtonEnabled ? Color(0xff4338CA) : Colors.grey,
                      // Change the button's color based on whether it's enabled or not
                    ),
                  ),
                ),

                const SizedBox(height: 180.0),

                // [Footer] Copyright 2024 Grounded Team. All Right Reserved
                const Positioned(
                  bottom: 10.0, // Set your desired bottom margin
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Text(
                      '© Copyright 2024 Grounded Team. All Right Reserved',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoBannerActionsFb1 extends StatelessWidget {
  final Icon icon;
  final Color primaryColor;
  final List<TextButton> actions;
  final String text;

  const InfoBannerActionsFb1(
      {required this.icon,
      required this.actions,
      required this.text,
      this.primaryColor = Colors.blue,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialBanner(
        content: Text(
          text,
          style: TextStyle(color: primaryColor),
        ),
        leading: CircleAvatar(
          child: icon,
          backgroundColor: primaryColor,
        ),
        actions: actions,
      ),
    );
  }
}

_launchURL() async {
  final Uri url = Uri.parse('https://wa.me/6289623084881');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch https://wa.me/6289623084881');
    print('yahaha admin error');
  } else {
    print('gak masuk logika bjir');
  }
}
