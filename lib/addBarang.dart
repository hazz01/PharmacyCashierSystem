import 'package:apotek/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class addBarang extends StatefulWidget {
  const addBarang({super.key});

  @override
  State<addBarang> createState() => _addBarangState();
}

class _addBarangState extends State<addBarang> {
  String? _selectedGolongan_AddBarang;
  String? _selectedKategori;
  String? _selectedType;
  String? _konsinyasi;

  List<String> _golonganList = ['Golongan 1', 'Golongan 2', 'Golongan 3'];
  List<String> _kategoriList = ['Kategori 1', 'Kategori 2', 'Kategori 3'];
  List<String> _typeList = ['Type 1', 'Type 2', 'Type 3'];
  List<String> _kons_type = ['True', 'False'];

  void _showReport() {
    if (_selectedGolongan_AddBarang != null &&
        _selectedKategori != null &&
        _selectedType != null &&
        _konsinyasi != null) {
      print('Golongan: $_selectedGolongan_AddBarang');
      print('Kategory: $_selectedKategori');
      print('Type Barang: $_typeList');
      print('Konainyasi: $_kons_type');
    } else {
      print('Mohon lengkapi semua informasi sebelum menambahkan barang.');
    }
  }

  //List<String> _konsinyasi = ['True', 'false'];

  @override
  Widget build(BuildContext context) {
    int currentPage = 0;
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        centerTitle: true,
        title:
            const Text("Tambah Barang", style: TextStyle(color: Colors.white)),
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
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
          margin: const EdgeInsets.all(12),
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Nama Produk: ',
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text(
                            'Nama Item',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Golongan: ',
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    width: 53,
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      // ignore: unnecessary_const
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      value: _selectedGolongan_AddBarang,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedGolongan_AddBarang = newValue;
                        });
                      },
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange)),
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
              const Row(
                children: [
                  Text(
                    'PLU: ',
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    width: 95,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text(
                            'Nomor PLU',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange))),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
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
                    width: 50,
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
                            borderSide: BorderSide(color: Colors.orange)),
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
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  const Text(
                    'Type: ',
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                  const SizedBox(
                    width: 85,
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
                            borderSide: BorderSide(color: Colors.orange)),
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
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text(
                    ' Barcode: ',
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text(
                            'Nomor Barcode',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text(
                    ' Harga Jual: ',
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    width: 28,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text(
                            'Harga',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text(
                    'HPP: ',
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    width: 83,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text(
                            'Harga',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text(
                    'HNA: ',
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    width: 81,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text(
                            'Harga',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text(
                    'Stok: ',
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    width: 80.5,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text(
                            'Jumlah',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange))),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Text(
                    'Konversi: ',
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w700,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    width: 42,
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          label: Text(
                            'Jumlah',
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                          ),
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.orange))),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Text(
                    'Konsinyasi',
                    style: TextStyle(
                        fontSize: 18.5,
                        fontWeight: FontWeight.w600,
                        color: Colors.black54),
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      // ignore: unnecessary_const
                      style: const TextStyle(
                          color: Colors.black54,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                      value: _konsinyasi,
                      onChanged: (String? newValue) {
                        setState(() {
                          _konsinyasi = newValue;
                        });
                      },
                      decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.orange)),
                      ),
                      items: _kons_type
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
              SizedBox(
                height: 45,
              ),
              ElevatedButton(
                onPressed: _selectedKategori != null &&
                        _selectedGolongan_AddBarang != null &&
                        _selectedType != null &&
                        _konsinyasi != null
                    ? _showReport
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange, // Ubah warna latar belakang
                  // Ubah warna teks
                ),
                child: const Text('Lihat Laporan'),
              ),
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
