import 'package:flutter/material.dart';
import 'package:latihan_ukl1/widgets/app_bar.dart';
import 'package:latihan_ukl1/widgets/bottom_nav_bar.dart';

class TiketkuScreen extends StatefulWidget {
  @override
  _TiketkuScreenState createState() => _TiketkuScreenState();
}

class _TiketkuScreenState extends State<TiketkuScreen> {
  String _selectedCity = 'Jakarta'; // Lokasi yang dipilih

  // Daftar tiket yang telah dibeli
  final List<Map<String, dynamic>> tickets = [
    {
      'title': 'DOCTOR STRANGE',
      'rating': 4.0,
      'category': 'Drama',
      'poster': 'assets/doctor.jpg',
      'price': 20000,
      'quantity': 1,
    },
    {
      'title': 'MOON KNIGHT',
      'rating': 3.5,
      'category': 'Horror',
      'poster': 'assets/moonknight.jpg',
      'price': 20000,
      'quantity': 1,
    },
  ];

  // Daftar lokasi
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
          // Daftar tiket yang telah dibeli
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: tickets.length,
              itemBuilder: (context, index) {
                final ticket = tickets[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        // Gambar poster film
                        Container(
                          width: 80,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                              image: AssetImage(ticket['poster']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12),
                        // Informasi tiket
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Judul
                              Text(
                                ticket['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: 4),
                              // Rating
                              Row(
                                children: List.generate(5, (starIndex) {
                                  return Icon(
                                    Icons.star,
                                    color: starIndex < ticket['rating'].round()
                                        ? Colors.amber
                                        : Colors.grey,
                                    size: 18,
                                  );
                                }),
                              ),
                              SizedBox(height: 4),
                              // Kategori
                              Text(
                                'Kategori: ${ticket['category']}',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              SizedBox(height: 8),
                              // Harga dan jumlah tiket
                              Row(
                                children: [
                                  Text(
                                    'Rp ${ticket['price']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  Spacer(),
                                  Text(
                                    'Tiket: ${ticket['quantity']}',
                                    style: TextStyle(fontSize: 14),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Navbar(3),
    );
  }
}
