import 'package:flutter/material.dart';
import 'package:latihan_ukl1/widgets/bottom_nav_bar.dart';

class TiketScreen extends StatefulWidget {
  @override
  _TiketScreenState createState() => _TiketScreenState();
}

class _TiketScreenState extends State<TiketScreen> {
  bool isSedangTayang = true;

  List<Map<String, dynamic>> filmsSedangTayang = [
    {
      'title': 'CAPTAIN AMERICA',
      'rating': 4.5,
      'category': 'Action',
      'poster': 'assets/captain.jpg',
      'isFavorite': false,
    },
    {
      'title': 'DOCTOR STRANGE',
      'rating': 4.0,
      'category': 'Drama',
      'poster': 'assets/doctor.jpg',
      'isFavorite': false,
    },
    {
      'title': 'IRONMAN',
      'rating': 5.0,
      'category': 'Comedy',
      'poster': 'assets/ironman.jpg',
      'isFavorite': false,
    },
    {
      'title': 'MOON KNIGHT',
      'rating': 3.5,
      'category': 'Horror',
      'poster': 'assets/moonknight.jpg',
      'isFavorite': false,
    },
  ];

  List<Map<String, dynamic>> filmsAkanTayang = [
    {
      'title': 'BLACK PANTHER',
      'rating': 4.8,
      'category': 'Action',
      'poster': 'assets/wakanda.jpg',
      'isFavorite': false,
    },
    {
      'title': 'SPIDERMAN',
      'rating': 4.6,
      'category': 'Adventure',
      'poster': 'assets/spiderman.jpg',
      'isFavorite': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> films =
        isSedangTayang ? filmsSedangTayang : filmsAkanTayang;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tiket Film',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isSedangTayang = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSedangTayang ? Colors.amber : Colors.grey,
                  ),
                  child: Text(
                    'Sedang Tayang',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isSedangTayang = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: !isSedangTayang ? Colors.amber : Colors.grey,
                  ),
                  child: Text(
                    'Akan Tayang',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 0.5, // Sesuaikan dengan desain
              ),
              itemCount: films.length,
              itemBuilder: (context, index) {
                final film = films[index];
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Poster Film
                      ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: AspectRatio(
                          aspectRatio: 2 / 3, // Sesuaikan rasio poster
                          child: Image.asset(
                            film['poster'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 8),
                      // Baris judul dan ikon love
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                film['title'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            IconButton(
                              icon: Icon(
                                film['isFavorite']
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: film['isFavorite']
                                    ? Colors.amber
                                    : Colors.grey,
                              ),
                              onPressed: () {
                                setState(() {
                                  film['isFavorite'] = !film['isFavorite'];
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                      // Rating Film
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          children: List.generate(5, (starIndex) {
                            return Icon(
                              Icons.star,
                              color: starIndex < film['rating'].round()
                                  ? Colors.amber
                                  : Colors.grey,
                              size: 16,
                            );
                          }),
                        ),
                      ),
                      SizedBox(height: 4),
                      // Kategori Film
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          'Category: ${film['category']}',
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Navbar(2),
    );
  }
}
