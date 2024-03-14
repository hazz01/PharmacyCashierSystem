import 'package:apotek/main.dart';
import 'package:apotek/mobile_dashboard.dart';
import 'package:apotek/mobile_terlaris.dart';
import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Mobile_Kosong extends StatefulWidget {
  const Mobile_Kosong({super.key});

  @override
  State<Mobile_Kosong> createState() => _Mobile_KosongState();
}

class _Mobile_KosongState extends State<Mobile_Kosong> {
  String? _selectedKategori;
  String? _selectedGolongan;
  DateTime? _selectedTanggal;
  String? _selectedItem;
  String? _selectedType;
  String? _selectedActive;
  String? _selectedCosign;

  List<String> _kategoriList = ['Kategori 1', 'Kategori 2', 'Kategori 3'];
  List<String> _golonganList = ['Golongan 1', 'Golongan 2', 'Golongan 3'];
  List<String> _itemList = ['Item 1', 'Item 2', 'Item 3'];
  List<String> _typeList = ['Type 1', 'Type 2', 'Type 3'];
  List<String> _cosignList = ['Cosign 1', 'Cosign 2', 'Cosign 3'];
  List<String> _activeList = ['Active 1', 'Active 2', 'Active 3'];

  void _showReport() {
    if (_selectedKategori != null &&
        _selectedGolongan != null &&
        _selectedTanggal != null &&
        _selectedItem != null &&
        _selectedType != null &&
        _selectedActive != null &&
        _selectedCosign != null) {
      // Implementasi fungsi untuk menampilkan laporan
      print('Kategori: $_selectedKategori');
      print('Golongan: $_selectedGolongan');
      print('Tanggal: $_selectedTanggal');
    } else {
      print('Mohon lengkapi semua informasi sebelum melihat laporan.');
    }
  }

  @override
  Widget build(BuildContext context) {
    int currentPage = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barang Kosong'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: Color(0xff4338CA),
        actions: [
          IconButton(
              onPressed: () {}, icon: Icon(Icons.notifications_active_rounded)),
          IconButton(onPressed: () {}, icon: Icon(Icons.account_box_rounded)),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          margin: const EdgeInsets.all(12),
          child: Column(
            children: [
              Row(
                children: [
                  const Text(
                    'Category: ',
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    width: 27,
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      value: _selectedKategori,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedKategori = newValue;
                        });
                      },
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff4338CA))),
                      ),
                      items: _kategoriList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text(
                    'Golongan: ',
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    width: 22,
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      value: _selectedGolongan,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedGolongan = newValue;
                        });
                      },
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff4338CA))),
                      ),
                      items: _golonganList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text(
                    'Start Date: ',
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                  const SizedBox(width: 18),
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      controller: TextEditingController(
                        text: _selectedTanggal != null
                            ? DateFormat('yyyy-MM-dd').format(_selectedTanggal!)
                            : '',
                      ),
                      onTap: () async {
                        final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: _selectedTanggal ?? DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2025),
                        );
                        if (picked != null && picked != _selectedTanggal) {
                          setState(() {
                            _selectedTanggal = picked;
                          });
                        }
                      },
                      decoration: const InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff4338CA))),
                        labelText: 'Tanggal',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(
                          color: Colors
                              .black54, // Change the color of the label text here
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Text(
                    'Item: ',
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    width: 60,
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      value: _selectedItem,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedItem = newValue;
                        });
                      },
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff4338CA))),
                      ),
                      items: _itemList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  // const Text(
                  //   'Type: ',
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  // ),
                  const SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      value: _selectedType,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedType = newValue;
                        });
                      },
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff4338CA))),
                      ),
                      items: _typeList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  // const SizedBox(
                  //   width: 18,
                  // ),
                  // const Text(
                  //   'Active: ',
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  // ),
                  const SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      value: _selectedActive,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedActive = newValue;
                        });
                      },
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff4338CA))),
                      ),
                      items: _activeList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  // const SizedBox(
                  //   width: 18,
                  // ),
                  // const Text(
                  //   'Co-sign: ',
                  //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
                  // ),
                  const SizedBox(
                    width: 18,
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      value: _selectedCosign,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedCosign = newValue;
                        });
                      },
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Color(0xff4338CA))),
                      ),
                      items: _cosignList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              ElevatedButton(
                onPressed: _selectedKategori != null &&
                        _selectedGolongan != null &&
                        _selectedTanggal != null &&
                        _selectedItem != null
                    ? _showReport
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color(0xff4338CA), // Ubah warna latar belakang
                  // Ubah warna teks
                ),
                child: const Text('Lihat Laporan'),
              ),
              // ignore: avoid_unnecessary_containers
              Container(

                  // ignore: avoid_unnecessary_containers
                  child: Container(child: TableExample()))
            ],
          ),
        ),
      ),
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
}

class TableExample extends StatefulWidget {
  @override
  _TableExampleState createState() => _TableExampleState();
}

class _TableExampleState extends State<TableExample> {
  List<DataRow> rows = [
    DataRow(cells: [
      DataCell(Text('1')),
      DataCell(Text('Type 1')),
      DataCell(Text('Item 1')),
      DataCell(Text('10')),
    ]),
    DataRow(cells: [
      DataCell(Text('2')),
      DataCell(Text('Type 2')),
      DataCell(Text('Item 2')),
      DataCell(Text('5')),
    ]),
    // Add more rows as needed
  ];

  void addRow() {
    setState(() {
      int newRowNo = rows.length + 1;
      DataRow newRow = DataRow(cells: [
        DataCell(Text('$newRowNo')),
        const DataCell(Text('New Type')),
        DataCell(Text('New Item')),
        DataCell(Text('0')),
      ]);

      rows.add(newRow);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1000,
      padding: const EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 25.0),
      margin: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
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
          DataTable(
            headingRowHeight: 25,
            columnSpacing: 40,
            horizontalMargin: 0,
            columns: const [
              DataColumn(label: Text('No', style: TextStyle(fontSize: 14))),
              DataColumn(label: Text('Type', style: TextStyle(fontSize: 14))),
              DataColumn(
                  label: Text('Item Name', style: TextStyle(fontSize: 14))),
              DataColumn(label: Text('Qty', style: TextStyle(fontSize: 14))),
            ],
            rows: rows,
          ),
          SizedBox(height: 16.0),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Color(0xff4338CA), // Ubah warna latar belakang
                  // Ubah warna teks
                ),
                onPressed: addRow,
                child: const Text('Add Row'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
