import 'package:flutter/material.dart';

class TixAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final TextEditingController searchController = TextEditingController();

  TixAppBar({required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      elevation: 0,
      title: Row(
        children: [
          Icon(Icons.search, color: Colors.amber),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: searchController,
              style: TextStyle(color: Colors.amber),
              decoration: InputDecoration(
                hintText: 'Film Rekomendasi',
                hintStyle: TextStyle(color: const Color.fromARGB(255, 255, 218, 108)),
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.notifications),
          color: Colors.amber,
          onPressed: () {
            // Aksi untuk notifikasi
          },
        ),
        IconButton(
          icon: Icon(Icons.account_circle),
          color: Colors.amber,
          onPressed: () {
            // Aksi untuk profil
          },
        ),
      ],
    );
    
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
