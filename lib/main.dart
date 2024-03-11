import 'package:apotek/mobile_dashboard.dart';
import 'package:apotek/mobile_jatuhtempo.dart';
import 'package:apotek/mobile_kosong.dart';
import 'package:apotek/mobile_terlaris.dart';
import 'package:flutter/material.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const RootPage(),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [Mobile_Dashboard(),MobileTerlaris(), Mobile_Kosong(), Mobile_Jatuh_Tempo()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Apotek'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.notifications_active_rounded)), IconButton(onPressed: () {},
         icon: Icon(Icons.account_box_rounded))],
      ),
      body: pages[currentPage],
      
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_box_rounded),
            label: 'Terlaris',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.request_page_rounded),
            label: 'Kosong',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: 'Jatuh Tempo',
          ),
        ],
        currentIndex: currentPage,
        onTap: (int index) {
          setState(() {
            currentPage = index;
          });
        },
      ),
    );
  }
}




