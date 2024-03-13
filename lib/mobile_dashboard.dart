import 'package:apotek/main.dart';
import 'package:apotek/mobile_terlaris.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Mobile_Dashboard extends StatefulWidget {
  const Mobile_Dashboard({super.key});

  @override
  State<Mobile_Dashboard> createState() => _Mobile_DashboardState();
}

class _Mobile_DashboardState extends State<Mobile_Dashboard> {
  

  int currentPage = 0;
  // List<Widget> pages = [Mobile_Dashboard(), MobileTerlaris()];
  @override
  Widget build(BuildContext context) {
    
    return DraggableHome(
      leading: const Icon(Icons.arrow_back_ios),
      title: const Text("Dashboard"),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.settings)),
      ],
      headerWidget: headerWidget(context),
      headerBottomBar: headerBottomBarWidget(),
      body: [
        dashboardView(),
      ],
      fullyStretchable: false,
      expandedBody: const Mobile_Dashboard(),
      backgroundColor: Colors.white,
      appBarColor: Color(0xff4338CA),
      bottomNavigationBar: BottomNavBarRaisedInsetFb1(
        currentPage: currentPage,
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
            if (kDebugMode) {
              print("currentPage: $currentPage");
            }
          });
        },
      ),
    );
  }

  Row headerBottomBarWidget() {
    return const Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ],
    );
  }

Widget headerWidget(BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('images/background.jpg'), // Ganti dengan path gambar Anda
        fit: BoxFit.cover, // Atur sesuai kebutuhan (contohnya, sesuaikan atau perbesar gambar)
        colorFilter: ColorFilter.mode(
          Colors.black.withOpacity(0.4), // Sesuaikan tingkat kegelapan di sini
          BlendMode.darken,
        ),
      ),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "74%",
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(
            "pendapatan anda naik",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 12,
            ),
          ),
        ],
      ),
    ),
  );
}



  ListView listView() {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 0),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 20,
      shrinkWrap: true,
      itemBuilder: (context, index) => Card(
        color: Colors.white70,
        child: ListTile(
          leading: CircleAvatar(
            child: Text("$index"),
          ),
          title: const Text("Title"),
          subtitle: const Text("Subtitle"),
        ),
      ),
    );
  }

  dashboardView() {
    double screenWidth = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Total Penjualan',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Margin
                    Text.rich(
                      TextSpan(
                        text: 'Data diberbaharui [data]',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Rp. --',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.2,
                      height: 30,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xff4338CA),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {},
                        child: const Text.rich(
                          TextSpan(
                            text: 'Harian',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: screenWidth * 0.2,
                      height: 30,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {},
                        child: const Text.rich(
                          TextSpan(
                            text: 'Mingguan',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: screenWidth * 0.2,
                      height: 30,
                      child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        onPressed: () {},
                        child: const Text.rich(
                          TextSpan(
                            text: 'Harian',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: const Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Total Hutang',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Margin
                    Text.rich(
                      TextSpan(
                        text: 'Data diberbaharui [data]',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Rp. --',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            // Wrap the DataTable with SingleChildScrollView

            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Item Terlaris',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Margin
                    Text.rich(
                      TextSpan(
                        text: 'Data diberbaharui [data]',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    headingRowHeight: 25,
                    columnSpacing: 65,
                    horizontalMargin: 2,
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Item',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Quantity',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Harga',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(
                            Text('Barang 1', style: TextStyle(fontSize: 10))),
                        DataCell(Text('Jumlah', style: TextStyle(fontSize: 10))),
                        DataCell(
                            Text('Rp 25.000', style: TextStyle(fontSize: 10))),
                      ]),
                      DataRow(cells: [
                        DataCell(
                            Text('Barang 2', style: TextStyle(fontSize: 10))),
                        DataCell(Text('Jumlah', style: TextStyle(fontSize: 10))),
                        DataCell(
                            Text('Rp 50.000', style: TextStyle(fontSize: 10))),
                      ]),
                
                      // Tambahkan baris lain sesuai kebutuhan
                    ],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 280,
                    height: 29,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xff4338CA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MobileTerlaris(),
                            ));
                      },
                      child: const Text.rich(
                        TextSpan(
                          text: ' See Details',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            // Wrap the DataTable with SingleChildScrollView

            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Barang Jatuh Tempo',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Margin
                    Text.rich(
                      TextSpan(
                        text: 'Data diberbaharui [data]',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    headingRowHeight: 25,
                    columnSpacing: 65,
                    horizontalMargin: 2,
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Tagihan',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Keterangan',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Tanggal',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(
                            Text('Tagihan 1', style: TextStyle(fontSize: 10))),
                        DataCell(
                            Text('Keterangan', style: TextStyle(fontSize: 10))),
                        DataCell(
                            Text('10/20/2021', style: TextStyle(fontSize: 10))),
                      ]),
                      DataRow(cells: [
                        DataCell(
                            Text('Tagihan 2', style: TextStyle(fontSize: 10))),
                        DataCell(Text('Jumlah', style: TextStyle(fontSize: 10))),
                        DataCell(
                            Text('20/12/2022', style: TextStyle(fontSize: 10))),
                      ]),
                
                      // Tambahkan baris lain sesuai kebutuhan
                    ],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 280,
                    height: 29,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xff4338CA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {},
                      child: const Text.rich(
                        TextSpan(
                          text: ' See Details',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ])
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            margin: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  spreadRadius: 0,
                  blurRadius: 5,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            // Wrap the DataTable with SingleChildScrollView

            child: Column(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Barang Kosong',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87),
                      ),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    // Margin
                    Text.rich(
                      TextSpan(
                        text: 'Data diberbaharui [data]',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
                    headingRowHeight: 25,
                    columnSpacing: 65,
                    horizontalMargin: 2,
                    columns: const [
                      DataColumn(
                        label: Text(
                          'Item',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Jumlah',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Tanggal',
                          style: TextStyle(fontSize: 10),
                        ),
                      ),
                    ],
                    rows: const [
                      DataRow(cells: [
                        DataCell(
                            Text('Tagihan 1', style: TextStyle(fontSize: 10))),
                        DataCell(Text('2', style: TextStyle(fontSize: 10))),
                        DataCell(
                            Text('10/20/2021', style: TextStyle(fontSize: 10))),
                      ]),
                      DataRow(cells: [
                        DataCell(
                            Text('Tagihan 2', style: TextStyle(fontSize: 10))),
                        DataCell(Text('4', style: TextStyle(fontSize: 10))),
                        DataCell(
                            Text('20/12/2022', style: TextStyle(fontSize: 10))),
                      ]),
                
                      // Tambahkan baris lain sesuai kebutuhan
                    ],
                  ),
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  SizedBox(
                    width: 280,
                    height: 29,
                    child: TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color(0xff4338CA),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5))),
                      onPressed: () {},
                      child: const Text.rich(
                        TextSpan(
                          text: ' See Details',
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ])
              ],
            ),
          ),
        ],
      ),
    );
  }
}