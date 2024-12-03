import 'package:flutter/material.dart';
import 'package:ukl_tix_id/widgets/bottom.dart';
import 'package:ukl_tix_id/widgets/header.dart';

class BioskopPage extends StatefulWidget {
  @override
  _BioskopPageState createState() => _BioskopPageState();
}

class _BioskopPageState extends State<BioskopPage> {
  final List<String> cinemas = [
    "AEON MALL JGC CGV",
    "AEON MALL TANJUNG BARAT XXI",
    "AGORA MALL IMAX",
    "AGORA MALL PREMIERE",
    "AGORA MALL XXI",
    "ARION XXI",
    "ARTHA GADING XXI",
    "BASSURA XXI",
  ];

  String _selectedCity = "Malang"; // Kota yang dipilih
  bool _isDropdownOpen = false; // Menandakan apakah dropdown kota terbuka
  bool _isBannerVisible = true; // Menandakan apakah banner informasi terlihat

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Column(
        children: [
          // Lokasi Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.location_on, color: Colors.blueGrey, size: 24),
                const SizedBox(width: 8),
                Text(
                  _selectedCity,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isDropdownOpen = !_isDropdownOpen; // Toggle dropdown
                    });
                  },
                  child: Icon(
                    _isDropdownOpen
                        ? Icons.keyboard_arrow_up
                        : Icons.keyboard_arrow_down,
                    color: Colors.blueGrey,
                    size: 24,
                  ),
                ),
              ],
            ),
          ),

          // Dropdown pilihan kota
          if (_isDropdownOpen) ...[
            Column(
              children: [
                for (var city in ['Malang', 'Jakarta', 'Surabaya', 'Bandung', 'Yogyakarta', 'Semarang', 'Medan', 'Bali'])
                  ListTile(
                    title: Text(city),
                    onTap: () {
                      setState(() {
                        _selectedCity = city; // Set kota yang dipilih
                        _isDropdownOpen = false; // Tutup dropdown setelah memilih kota
                      });
                    },
                  ),
              ],
            ),
          ],

          // Informasi Banner (Tampilkan hanya jika _isBannerVisible bernilai true)
          if (_isBannerVisible)
            Container(
              padding: const EdgeInsets.all(16.0),
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.blueGrey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueGrey[100]!),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.info_outline, color: Colors.blue, size: 28),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      "Tandai bioskop favoritmu! Bioskop favoritmu akan berada paling atas pada daftar ini dan pada jadwal film.",
                      style: TextStyle(
                        color: Colors.blue[900],
                        fontSize: 14,
                        height: 1.4,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isBannerVisible = false; // Menyembunyikan banner saat tombol "Mengerti" ditekan
                      });
                    },
                    child: const Text(
                      "Mengerti",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // Daftar Bioskop
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: cinemas.length,
              itemBuilder: (context, index) {
                return _HoverableCinemaTile(cinemas[index]);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: Bottomnavigation(1),
    );
  }
}

class _HoverableCinemaTile extends StatefulWidget {
  final String cinemaName;

  const _HoverableCinemaTile(this.cinemaName);

  @override
  State<_HoverableCinemaTile> createState() => _HoverableCinemaTileState();
}

class _HoverableCinemaTileState extends State<_HoverableCinemaTile> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        margin: const EdgeInsets.only(bottom: 12),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.amber[600] : Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            if (_isHovered)
              BoxShadow(
                color: Colors.amber[100]!,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          title: Text(
            widget.cinemaName,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: _isHovered ? Colors.white : Colors.black,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            size: 20,
            color: _isHovered ? Colors.white : Colors.grey[400],
          ),
          onTap: () {
            // Aksi ketika bioskop diklik
          },
        ),
      ),
    );
  }
}
