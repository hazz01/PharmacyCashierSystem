import 'package:flutter/material.dart';

class Mobile_Dashboard extends StatefulWidget {
  const Mobile_Dashboard({super.key});

  @override
  State<Mobile_Dashboard> createState() => _Mobile_DashboardState();
}

class _Mobile_DashboardState extends State<Mobile_Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              margin: const EdgeInsets.fromLTRB(40.0, 30.0, 40.0, 10.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 136, 217, 255),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
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
                            fontSize: 20, fontWeight: FontWeight.w400
                          ),
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
                            fontSize: 15, fontWeight: FontWeight.w400
                          ),
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
                            fontSize: 30, fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 65,
                        height: 30,
                        child:  TextButton(
                          style: TextButton.styleFrom(backgroundColor: const Color.fromRGBO(246, 141, 41, 100), shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          )),
                          onPressed: () {}, 
                          child: const Text.rich(
                          TextSpan(
                            text: 'Harian',
                            style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      ),
                      const SizedBox(width: 15,),
                      SizedBox(
                        width: 65,
                        height: 30,
                        child:  TextButton(
                          style: TextButton.styleFrom(backgroundColor: const Color.fromRGBO(246, 141, 41, 100), shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          )),
                          onPressed: () {}, 
                          child: const Text.rich(
                          TextSpan(
                            text: 'Harian',
                            style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
                          ),
                        ),
                      ),
                      ),
                      const SizedBox(width: 15,),
                      SizedBox(
                        width: 65,
                        height: 30,
                        child:  TextButton(
                          style: TextButton.styleFrom(backgroundColor: const Color.fromRGBO(246, 141, 41, 100), shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)
                          )),
                          onPressed: () {}, 
                          child: const Text.rich(
                          TextSpan(
                            text: 'Harian',
                            style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500,
                              color: Colors.white
                            ),
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
              margin: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 136, 217, 255),
                borderRadius: BorderRadius.circular(12.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 4,
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
                            fontSize: 20, fontWeight: FontWeight.w400
                          ),
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
                            fontSize: 15, fontWeight: FontWeight.w400
                          ),
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
                            fontSize: 30, fontWeight: FontWeight.w500
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            margin: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 40.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 136, 217, 255),
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: SingleChildScrollView(  // Wrap the DataTable with SingleChildScrollView
              scrollDirection: Axis.horizontal,  // Allow horizontal scrolling
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text.rich(
                        TextSpan(
                          text: 'Item Terlaris',
                          style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w400
                          ),
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
                            fontSize: 15, fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
                    ],
                  ), 
                  const SizedBox(height: 20),
                  DataTable(
                    headingRowHeight: 40,
                    columnSpacing: 4,
                    horizontalMargin: 2,
                    columns: const [
                      DataColumn(label: Text('Nama Barang', style: TextStyle(fontSize: 10),),),
                      DataColumn(label: Text('Nama Barang', style: TextStyle(fontSize: 10),),),
                      DataColumn(label: Text('Nama Barang', style: TextStyle(fontSize: 10),),),
                    ],
                    rows: const [
                      DataRow( cells: [
                        DataCell(Text('Barang 1', style: TextStyle(fontSize: 10))),
                        DataCell(Text('Deskripsi Barang 1 Barang 1 Barang 1', style: TextStyle(fontSize: 10))),
                        DataCell(Text('Deskripsi Barang 1', style: TextStyle(fontSize: 10))),
                      ]),
                      DataRow(cells: [
                        DataCell(Text('Barang 2', style: TextStyle(fontSize: 10))),
                        DataCell(Text('Deskripsi Barang 2', style: TextStyle(fontSize: 10))),
                        DataCell(Text('Deskripsi Barang 2', style: TextStyle(fontSize: 10))),
                      ]),
                      // Tambahkan baris lain sesuai kebutuhan
                    ],
                  )
                ],
              ),
            ),
          ),
          ],
        ),
      )
    );
  }
}