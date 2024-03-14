import 'package:apotek/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ShowDatabase extends StatefulWidget {
  const ShowDatabase({Key? key}) : super(key: key);

  @override
  State<ShowDatabase> createState() => _ShowDatabaseState();
}

class _ShowDatabaseState extends State<ShowDatabase> {
  int currentPage = 0;
  bool sortAscending = true;
  int sortColumnIndex = 0;
  int entriesToShow = 10;

  List<Map<String, dynamic>> data = [
    {'No': 1, 'Tipe': 'Obat', 'Nama Produk': 'Asam Sulfat'},
    {'No': 2, 'Tipe': 'Vitamin', 'Nama Produk': 'Vitamin ABC'},
    {'No': 3, 'Tipe': 'Alat Kesehatan', 'Nama Produk': 'Sikat Gigi'},
    {'No': 1, 'Tipe': 'Vitamin', 'Nama Produk': 'Vitamin C'},
    {'No': 2, 'Tipe': 'Alat Kesehatan', 'Nama Produk': 'Termometer'},
    {'No': 3, 'Tipe': 'Obat', 'Nama Produk': 'Paracetamol'},
    {'No': 1, 'Tipe': 'Vitamin', 'Nama Produk': 'Tablet Power'},
    {'No': 2, 'Tipe': 'Alat Kesehatan', 'Nama Produk': 's'},
    {'No': 3, 'Tipe': 'Alat Kesehatan', 'Nama Produk': 'Blender'},
    {'No': 1, 'Tipe': 'Obat', 'Nama Produk': 'Oskadon'},
    {'No': 2, 'Tipe': 'Obat', 'Nama Produk': 'Paramex'},
    {'No': 3, 'Tipe': 'Vitamin', 'Nama Produk': 'Sakatonik ABC (baca pakai nada)'},
    // Add more data entries up to a total of 20
  ];

  List<Map<String, dynamic>> getVisibleData() {
    int startIndex = currentPage * entriesToShow;
    int endIndex = (currentPage + 1) * entriesToShow;
    endIndex = endIndex > data.length ? data.length : endIndex;
    return data.sublist(startIndex, endIndex);
  }

  void onSort(int columnIndex, bool ascending) {
    setState(() {
      sortColumnIndex = columnIndex;
      sortAscending = ascending;

      data.sort((a, b) {
        if (ascending) {
          return a.values
              .elementAt(columnIndex)
              .compareTo(b.values.elementAt(columnIndex));
        } else {
          return b.values
              .elementAt(columnIndex)
              .compareTo(a.values.elementAt(columnIndex));
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> visibleData = getVisibleData();

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title:
          const Text("Main Databases", style: TextStyle(color: Colors.white)),
        backgroundColor: Color(0xff4338CA),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff4338CA), Color(0xff6D28D9)],
              stops: [0.5, 1.0],
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                sortColumnIndex: sortColumnIndex,
                sortAscending: sortAscending,
                columns: [
                  DataColumn(
                    label: Text('No'),
                    onSort: (columnIndex, ascending) =>
                        onSort(columnIndex, ascending),
                  ),
                  DataColumn(
                    label: Text('Tipe'),
                    onSort: (columnIndex, ascending) =>
                        onSort(columnIndex, ascending),
                  ),
                  DataColumn(
                    label: Text('Nama Produk'),
                    onSort: (columnIndex, ascending) =>
                        onSort(columnIndex, ascending),
                  ),
                ],
                rows: visibleData
                    .map(
                      (item) => DataRow(
                        cells: [
                          DataCell(Text(item['No'].toString())),
                          DataCell(Text(item['Tipe'].toString())),
                          DataCell(Text(item['Nama Produk'].toString())),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Atur nilai sesuai keinginan
                    ),
                    primary: Colors.white, // Warna latar belakang
                    onPrimary: Colors.blue, // Warna teks
                    side: BorderSide(
                        color: Colors.blue,
                        width: 2.0), // Warna dan lebar border
                  ),
                  onPressed: () {
                    setState(() {
                      if (currentPage > 0) {
                        currentPage--;
                      }
                    });
                  },
                  child: Text('Previous'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Atur nilai sesuai keinginan
                    ),
                    primary: Colors.blue, // Warna latar belakang
                    onPrimary: Colors.white, // Warna teks
                    side: BorderSide(
                        color: Colors.blue,
                        width: 2.0), // Warna dan lebar border
                  ),
                  onPressed: () {
                    setState(() {
                      if ((currentPage + 1) * entriesToShow < data.length) {
                        currentPage++;
                      }
                    });
                  },
                  child: Text('Next'),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBarRaisedInsetFb1(
        currentPage: currentPage,
        onPageChanged: (index) {
          setState(() {
            var currentPage = index;
            if (kDebugMode) {
              print("currentPage: $currentPage");
            }
          });
        },
      ),
    );
  }
}
