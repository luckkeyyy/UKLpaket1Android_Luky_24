import 'package:flutter/material.dart';
import 'package:latihan_ukl1/widgets/app_bar.dart';
import 'package:latihan_ukl1/widgets/bottom_nav_bar.dart';

class BioskopScreen extends StatefulWidget {
  @override
  _BioskopScreenState createState() => _BioskopScreenState();
}

class _BioskopScreenState extends State<BioskopScreen> {
  String _selectedCity = 'Jakarta'; // Lokasi yang dipilih

  // Daftar mall
  final List<Map<String, String>> malls = [
    {'name': 'Dieng Plaza '},
    {'name': 'Malang Plaza'},
    {'name': 'Malang Town Square 21'},
    {'name': 'Sarinah Cineplex'},
    {'name': 'Transmart XXI Malang'},
  ];

  final List<Map<String, dynamic>> cities = [
    {'name': 'Jakarta', 'icon': Icons.location_on},
    {'name': 'Bandung', 'icon': Icons.location_on},
    {'name': 'Surabaya', 'icon': Icons.location_on},
    {'name': 'Malang', 'icon': Icons.location_on},
    {'name': 'Kediri', 'icon': Icons.location_on},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TixAppBar(title: ""),
      body: Column(
        children: [
          // Dropdown untuk memilih lokasi
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              children: [
                Icon(Icons.location_on, color: Colors.grey[700]), // Icon lokasi
                SizedBox(width: 8),
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: _selectedCity,
                      isExpanded: true,
                      icon: Icon(Icons.arrow_drop_down),
                      items: cities.map((city) {
                        return DropdownMenuItem<String>(
                          value: city['name'],
                          child: Row(
                            children: [
                              // Icon(city['icon'], color: Colors.grey[700]),
                              SizedBox(width: 8),
                              Text(city['name']),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedCity = value!;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Daftar mall
          Expanded(
            child: ListView.builder(
              itemCount: malls.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.star, color: Colors.amber), // Ikon bintang
                  title: Text(malls[index]['name'] ?? ''),
                  trailing: Icon(Icons.arrow_forward_ios), // Ikon panah
                  onTap: () {
                    // Tindakan saat item dipilih
                    print('Mall ${malls[index]['name']} clicked');
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Navbar(1),
    );
  }
}
