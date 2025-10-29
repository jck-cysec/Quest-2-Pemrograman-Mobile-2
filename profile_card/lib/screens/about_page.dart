import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Tentang Aplikasi Profile Card',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            Text(
              'Aplikasi ini dibuat menggunakan Flutter untuk menampilkan profil interaktif. '
              'Kamu dapat mengedit data profil, berpindah ke halaman tentang, '
              'dan mengganti tema secara otomatis mengikuti sistem.',
              textAlign: TextAlign.justify,
            ),
            SizedBox(height: 20),
            Text('Dibuat oleh: Tekno', style: TextStyle(fontWeight: FontWeight.w500)),
            Text('Versi: 1.0.0', style: TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}
