import 'package:apotek/addBarang.dart';
import 'package:apotek/login.dart';
import 'package:apotek/mobile_dashboard.dart';
import 'package:apotek/mobile_jatuhtempo.dart';
import 'package:apotek/mobile_kosong.dart';
import 'package:apotek/mobile_terlaris.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate some asynchronous operation (e.g., fetching data)
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Set your splash screen background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your logo or other splash screen content here
            Image.asset('images/logo.png', width: 150, height: 150),
            const SizedBox(height: 20),
            // Loading animation using flutter_spinkit
            SpinKitWave(
              color: Colors.white,
              size: 50.0,
            ),
          ],
        ),
      ),
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
  // List<Widget> pages = [LoginPage(),MobileTerlaris(), Mobile_Kosong()];
  List<Widget> pages = [
    LoginPage(),
    Mobile_Dashboard(),
    MobileTerlaris(),
    addBarang(),
    Mobile_Kosong(),
    Mobile_Jatuh_Tempo()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentPage],

      // bottomNavigationBar: currentPage == 0
      //     ? null  // Hide the BottomNavigationBar on the login screen
      //     : BottomNavigationBar(
      //         type: BottomNavigationBarType.fixed,
      //         items: const [
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.home_rounded),
      //             label: 'Dashboard',
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.add_box_rounded),
      //             label: 'Terlaris',
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.request_page_rounded),
      //             label: 'Kosong',
      //           ),
      //           BottomNavigationBarItem(
      //             icon: Icon(Icons.list_rounded),
      //             label: 'Jatuh Tempo',
      //           ),
      //         ],
      //         currentIndex: currentPage,
      //         onTap: (int index) {
      //           setState(() {
      //             currentPage = index;
      //           });
      //         },
      //       ),
    );
  }
}

class BottomNavBarRaisedInsetFb1 extends StatefulWidget {
  const BottomNavBarRaisedInsetFb1(
      {Key? key, required this.currentPage, required this.onPageChanged})
      : super(key: key);

  final int currentPage;
  final Function(int) onPageChanged;

  @override
  _BottomNavBarRaisedInsetFb1State createState() =>
      _BottomNavBarRaisedInsetFb1State();
}

class _BottomNavBarRaisedInsetFb1State
    extends State<BottomNavBarRaisedInsetFb1> {
  // int currentPage = 0;

  //     void changePage(int index) {
  //   setState(() {
  //     currentPage = index;
  //   });
  // }

  //- - - - - - - - - instructions - - - - - - - - - - - - - - - - - -
  // WARNING! MUST ADD extendBody: true; TO CONTAINING SCAFFOLD
  //
  // Instructions:
  //
  // add this widget to the bottomNavigationBar property of a Scaffold, along with
  // setting the extendBody parameter to true i.e:
  //
  // Scaffold(
  //  extendBody: true,
  //  bottomNavigationBar: BottomNavBarRaisedInsetFb1()
  // )
  //
  // Properties such as color and height can be set by changing the properties at the top of the build method
  //
  // For help implementing this in a real app, watch https://www.youtube.com/watch?v=C0_3w0kd0nc. The style is different, but connecting it to navigation is the same.
  //
  //- - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 56;

    const primaryColor = Colors.orange;
    const secondaryColor = Colors.black54;
    const accentColor = const Color(0xffffffff);
    const backgroundColor = Colors.white;

    const shadowColor = Colors.grey; //color of Navbar shadow
    double elevation = 100; //Elevation of the bottom Navbar

    print("currentPage: $widget.onPageChanged");

    return BottomAppBar(
      color: Colors.transparent,
      elevation: 0,
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height),
            painter: BottomNavCurvePainter(
                backgroundColor: backgroundColor,
                shadowColor: shadowColor,
                elevation: elevation),
          ),
          Center(
            heightFactor: 0.6,
            child: FloatingActionButton(
                backgroundColor: primaryColor,
                child: const Icon(
                  Icons.home,
                ),
                elevation: 0.1,
                onPressed: () {
                  setState(() {
                    widget.onPageChanged == 1;
                  });
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration.zero,
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          Mobile_Dashboard(),
                    ),
                  );
                }),
          ),
          SizedBox(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarIcon(
                  text: "Home",
                  icon: Icons.donut_small_sharp,
                  selected: widget.onPageChanged == 1,
                  onPressed: () {
                    setState(() {
                      // print("currentPage: $widget.onPageChanged");
                      widget.onPageChanged == 1;
                    });

                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration.zero,
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            MobileTerlaris(),
                      ),
                    );
                  },
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                NavBarIcon(
                  text: "Search",
                  icon: Icons.local_grocery_store_outlined,
                  selected: widget.onPageChanged == 2,
                  onPressed: () {
                    setState(() {
                      widget.onPageChanged == 2;
                    });
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration.zero,
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            Mobile_Kosong(),
                      ),
                    );
                  },
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                const SizedBox(width: 56),
                NavBarIcon(
                    text: "Cart",
                    icon: Icons.notifications_none,
                    selected: widget.onPageChanged == 4,
                    onPressed: () {
                      setState(() {
                        widget.onPageChanged == 1;
                      });
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration.zero,
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  Mobile_Jatuh_Tempo(),
                        ),
                      );
                    },
                    defaultColor: secondaryColor,
                    selectedColor: primaryColor),
                NavBarIcon(
                  text: "Calendar",
                  icon: Icons.account_circle_outlined,
                  selected: widget.onPageChanged == 5,
                  onPressed: () {
                    setState(() {
                      widget.onPageChanged == 1;
                    });
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration.zero,
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            addBarang(),
                      ),
                    );
                  },
                  selectedColor: primaryColor,
                  defaultColor: secondaryColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white,
      this.insetRadius = 38,
      this.shadowColor = Colors.grey,
      this.elevation = 100});

  Color backgroundColor;
  Color shadowColor;
  double elevation;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path();

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;

    path.lineTo(insetCurveBeginnningX, 0);
    path.arcToPoint(Offset(insetCurveEndX, 0),
        radius: Radius.circular(41), clockwise: true);

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawShadow(path, shadowColor, elevation, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xffFF8527),
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}

      // appBar: AppBar(
      //   title: const Text(
      //     "Pharmacy Cashier",
      //     style: TextStyle(color: Colors.white),
      //   ),
      //   centerTitle: true, // Center the title
      //   automaticallyImplyLeading: false, // Remove the default back button
      //   backgroundColor: Color(0xff4338CA),
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //         colors: [Color(0xff4338CA), Color(0xff6D28D9)],
      //         stops: [0.5, 1.0],
      //       ),
      //     ),
      //   ),
      // ),
