import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../widgets/app_bar.dart';
import '../widgets/bottom_nav_bar.dart';
import 'bioskop_screen.dart';
import 'tiket_screen.dart';
import 'tiketku_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  String _selectedCity = 'Jakarta'; // Kota default
  int _currentCarouselIndex = 0;
  String _selectedCategory = 'Semua Film'; // Kategori default
  int _currentPosterIndex = 0; // Track the index of the current poster

  final List<Widget> _screens = [
    Center(child: Text('', style: TextStyle(fontSize: 24))), // Home
    BioskopScreen(), // Bioskop
    TiketScreen(), // Tiket
    TiketkuScreen(), // Tiketku
  ];

  final List<Map<String, dynamic>> cities = [
    {'name': 'Jakarta', 'icon': Icons.location_on},
    {'name': 'Bandung', 'icon': Icons.location_on},
    {'name': 'Surabaya', 'icon': Icons.location_on},
    {'name': 'Malang', 'icon': Icons.location_on},
    {'name': 'Kediri', 'icon': Icons.location_on},
  ];

  final List<String> carouselImages = [
    'assets/slide1.png',
    'assets/slide2.png',
    'assets/slide3.png',
  ];

  final List<String> categories = [
    'Semua Film',
    'XXI',
    'CGV',
    'Cinepolis',
    'Wishlist',
  ];

  final List<Map<String, String>> posters = [
    {'image': 'assets/captain.jpg', 'title': 'CAPTAIN AMERICA'},
    {'image': 'assets/doctor.jpg', 'title': 'DOSTOR STRANGE'},
    {'image': 'assets/moonknight.jpg', 'title': 'MOON KNIGHT'},
    {'image': 'assets/wakanda.jpg', 'title': 'BLACK PANTHER'},
    {'image': 'assets/spiderman.jpg', 'title': 'SPIDERMAN'},
  ];

  final List<Map<String, dynamic>> spotlightItems = [
    {
      'image': 'assets/ironman.jpg',
      'title': 'Film Terpopuler',
      'description': 'Film yang sedang trending di seluruh dunia!',
      'views': 1000,
      'likes': 500,
      'isLiked': false,
    },
    {
      'image': 'assets/doctor.jpg',
      'title': 'Rekomendasi Minggu Ini',
      'description': 'Pilihan film terbaik untuk minggu ini.',
      'views': 750,
      'likes': 300,
      'isLiked': false,
    },
    {
      'image': 'assets/spiderman.jpg',
      'title': 'Film dengan Rating Tertinggi',
      'description': 'Film yang wajib kamu tonton!',
      'views': 1500,
      'likes': 900,
      'isLiked': false,
    },
  ];

  final List<Map<String, String>> newsItems = [
    {
      'image': 'assets/wakanda.jpg',
      'title': "'We Live in Time' Drama Romansa Terbaru",
      'description': "Andrew Garfield dan Florence Pugh beraksi.",
      'views': '19',
      'likes': '0',
    },
    {
      'image': 'assets/spiderman.jpg',
      'title': "Tom Cruise Rilis Trailer 'Mission: Impossible 8'",
      'description': "The Final Reckoning.",
      'views': '1K',
      'likes': '9',
    },
    {
      'image': 'assets/doctor.jpg',
      'title': "Ariana Grande & Cynthia Erivo di 'WICKED'",
      'description': "Siap-siap bernyanyi bersama mereka.",
      'views': '792',
      'likes': '15',
    },
    {
      'image': 'assets/moonknight.jpg',
      'title': "Film 'Betting with Ghost' Asal Vietnam",
      'description': "Intip sinopsisnya!",
      'views': '5',
      'likes': '1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TixAppBar(title: 'TIX ID'),
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
            child: Row(
              children: [
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
                              Icon(city['icon'], color: Colors.grey[700]),
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
          // Carousel Slider
          if (_currentIndex == 0) // Carousel hanya muncul di Home Screen
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0.0),
              child: CarouselSlider(
                items: carouselImages.map((image) {
                  return Builder(
                    builder: (BuildContext context) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          image,
                          fit: BoxFit.cover,
                          width: MediaQuery.of(context).size.width,
                        ),
                      );
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 150,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9, // Ukuran 16:9
                  onPageChanged: (index, reason) {
                    setState(() {
                      _currentCarouselIndex = index;
                    });
                  },
                ),
              ),
            ),
          if (_currentIndex == 0) // Promo hanya muncul di Home Screen
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber[100], // Background warna lembut
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 4),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.local_offer,
                              color: Colors.amber, size: 40),
                          SizedBox(width: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jadilah TIX VIP dan dapatkan untungnya!',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber[400],
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Dapatkan akses eksklusif dan promo menarik.',
                                style: TextStyle(color: Colors.amber[300]),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Icon(Icons.arrow_forward, color: Colors.amber),
                    ],
                  ),
                ),
              ),
            ),
          // Sedang Tayang Text
          if (_currentIndex ==
              0) // Text dan kategori hanya muncul di Home Screen
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Text(
                    'Sedang Tayang',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          // Kategori Buttons (border kuning untuk kategori yang tidak dipilih)
          if (_currentIndex == 0)
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: categories.map((category) {
                  return ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedCategory = category;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedCategory == category
                          ? Colors.yellow
                          : Colors.white,
                      foregroundColor: _selectedCategory == category
                          ? Colors.black
                          : Colors.black,
                      side: BorderSide(
                        color: _selectedCategory == category
                            ? Colors.white
                            : Colors.yellow,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      category,
                      style: TextStyle(fontSize: 12),
                    ),
                  );
                }).toList(),
              ),
            ),
          SizedBox(height: 8), // Spasi antara promo/kategori dan konten

          // Horizontal Scrollable Poster Slider
          if (_currentIndex == 0) // Poster Slider only in Home Screen
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SizedBox(
                height:
                    300, // Tinggi eksplisit agar sesuai dengan aspect ratio 9:16
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, // Gulir horizontal
                  itemCount: posters.length,
                  itemBuilder: (context, index) {
                    final poster = posters[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _currentPosterIndex = index;
                          });
                        },
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                // Poster Image
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    poster['image']!,
                                    width: 180,
                                    height: 240, // Aspect ratio 9:16
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                // Number Indicator in the top-right corner
                                Positioned(
                                  top: 8,
                                  right: 8,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.amber,
                                    child: Text(
                                      (index + 1).toString(),
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 8),
                            // Title below the poster
                            Text(
                              poster['title']!,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),

          if (_currentIndex == 0) // Spotlight hanya muncul di Home Screen
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Spotlight',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Container(
                    height: 320, // Sesuaikan tinggi kontainer
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: spotlightItems.length,
                      itemBuilder: (context, index) {
                        final item = spotlightItems[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              // Tambahkan logika jika perlu untuk tindakan saat item diklik
                            },
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.asset(
                                    item['image'],
                                    width: 200,
                                    height: 220,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  item['title'],
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  item['description'],
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // View Icon
                                    Row(
                                      children: [
                                        Icon(Icons.visibility,
                                            color: Colors.grey[700]),
                                        SizedBox(width: 4),
                                        Text(
                                          '${item['views']}',
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.grey[700]),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 16),
                                    // Like Icon
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          item['isLiked'] = !item['isLiked'];
                                          if (item['isLiked']) {
                                            item['likes'] += 1;
                                          } else {
                                            item['likes'] -= 1;
                                          }
                                        });
                                      },
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.thumb_up,
                                            color: item['isLiked']
                                                ? Colors.yellow
                                                : Colors.grey[700],
                                          ),
                                          SizedBox(width: 4),
                                          Text(
                                            '${item['likes']}',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.grey[700]),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
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
            ),
          if (_currentIndex == 0) // TIX Now hanya muncul di Home Screen
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'TIX Now',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: newsItems.length,
                    itemBuilder: (context, index) {
                      final item = newsItems[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                item['image']!,
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item['title']!,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    item['description']!,
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey),
                                  ),
                                  SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(Icons.visibility,
                                          color: Colors.grey),
                                      SizedBox(width: 4),
                                      Text(item['views']!,
                                          style: TextStyle(color: Colors.grey)),
                                      SizedBox(width: 16),
                                      Icon(Icons.thumb_up, color: Colors.grey),
                                      SizedBox(width: 4),
                                      Text(item['likes']!,
                                          style: TextStyle(color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),

          Expanded(child: _screens[_currentIndex]), // Konten halaman
        ],
      ),
      bottomNavigationBar: Navbar(0),
    );
  }
}
