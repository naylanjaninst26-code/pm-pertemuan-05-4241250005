import 'package:material_ui/material_ui.dart';

void main() => runApp(const MenuUmkmApp());

// Satu-satunya warna yang ditulis langsung: warna dasar (seed) untuk tema.
// Semua warna lain di bawah diambil dari tema lewat Theme.of(context).
const warnaDasar = Color(0xFFB83B5E);

// Data satu menu
class ItemMenu {
  const ItemMenu({
    required this.nama,
    required this.harga,
    required this.kategori,
  });

  final String nama;
  final int harga;
  final String kategori;
}

// Urutan kategori yang ditampilkan di halaman
const urutanKategori = ['Makanan', 'Minuman', 'Kue'];

const daftarMenu = [
  // Makanan
  ItemMenu(nama: 'Nasi Goreng Spesial', harga: 18000, kategori: 'Makanan'),
  ItemMenu(nama: 'Mie Gomak', harga: 22000, kategori: 'Makanan'),
  ItemMenu(nama: 'Soto Medan', harga: 20000, kategori: 'Makanan'),
  ItemMenu(nama: 'Lontong Medan', harga: 17000, kategori: 'Makanan'),
  ItemMenu(nama: 'Nasi Ayam Penyet', harga: 23000, kategori: 'Makanan'),
  // Minuman
  ItemMenu(nama: 'Es Teh Manis', harga: 5000, kategori: 'Minuman'),
  ItemMenu(nama: 'Kopi Sidikalang', harga: 15000, kategori: 'Minuman'),
  ItemMenu(nama: 'Teh Tarik', harga: 12000, kategori: 'Minuman'),
  ItemMenu(nama: 'Es Jeruk', harga: 10000, kategori: 'Minuman'),
  ItemMenu(nama: 'Sirup Markisa', harga: 12000, kategori: 'Minuman'),
  // Kue
  ItemMenu(nama: 'Bika Ambon', harga: 25000, kategori: 'Kue'),
  ItemMenu(nama: 'Bolu Meranti', harga: 30000, kategori: 'Kue'),
  ItemMenu(nama: 'Pancake Durian', harga: 28000, kategori: 'Kue'),
  ItemMenu(nama: 'Kue Lapis', harga: 15000, kategori: 'Kue'),
  ItemMenu(nama: 'Roti Srikaya', harga: 12000, kategori: 'Kue'),
];

// Ikon yang sesuai dengan kategori menu
IconData ikonKategori(String kategori) => switch (kategori) {
  'Makanan' => Icons.ramen_dining,
  'Minuman' => Icons.local_cafe,
  'Kue' => Icons.cake,
  _ => Icons.restaurant_menu,
};

// Mengubah 18000 menjadi Rp18.000
String rupiah(int harga) {
  final teks = harga.toString();
  final hasil = StringBuffer();
  for (var i = 0; i < teks.length; i++) {
    if (i > 0 && (teks.length - i) % 3 == 0) hasil.write('.');
    hasil.write(teks[i]);
  }
  return 'Rp$hasil';
}

class MenuUmkmApp extends StatelessWidget {
  const MenuUmkmApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Menu UMKM Kuliner',
      // Tema terang dan gelap dibuat dari satu warna dasar (seed)
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: warnaDasar),
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: warnaDasar,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.system, // mengikuti pengaturan perangkat
      home: const HalamanMenu(),
    );
  }
}

class HalamanMenu extends StatelessWidget {
  const HalamanMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final tema = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Kuliner'),
        centerTitle: true,
        scrolledUnderElevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
        children: [
          const HeaderToko(),
          const SizedBox(height: 16),
          const KartuKontak(),
          const SizedBox(height: 28),
          Text('Daftar Menu', style: tema.textTheme.titleLarge),
          const SizedBox(height: 8),
          // Satu KartuMenu untuk setiap data di daftarMenu
          for (final item in daftarMenu) KartuMenu(item: item),
        ],
      ),
    );
  }
}

class HeaderToko extends StatelessWidget {
  const HeaderToko({super.key});

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 20),
      decoration: BoxDecoration(
        color: warna.primaryContainer,
        borderRadius: BorderRadius.circular(28),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: warna.primary,
            child: Icon(Icons.wb_twilight, size: 40, color: warna.onPrimary),
          ),
          const SizedBox(height: 16),
          Text(
            'Kedai Rasa Senja',
            style: teks.headlineMedium?.copyWith(
              fontWeight: FontWeight.w700,
              letterSpacing: 0.5,
              color: warna.onPrimaryContainer,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Dapur rumahan, cita rasa Medan',
            style: teks.bodyMedium?.copyWith(color: warna.onPrimaryContainer),
          ),
        ],
      ),
    );
  }
}

class KartuKontak extends StatelessWidget {
  const KartuKontak({super.key});

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      color: warna.surfaceContainerLow,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        children: [
          ListTile(
            iconColor: warna.primary,
            leading: const Icon(Icons.phone),
            title: const Text('0812-3456-7890'),
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          ListTile(
            iconColor: warna.primary,
            leading: const Icon(Icons.location_on),
            title: const Text('Jl. Dr. Mansur No. 12, Medan'),
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          ListTile(
            iconColor: warna.primary,
            leading: const Icon(Icons.access_time),
            title: const Text('Buka 08.00 - 21.00'),
          ),
        ],
      ),
    );
  }
}

// Widget Stateless: datanya tidak berubah setelah dibuat
class KartuMenu extends StatelessWidget {
  const KartuMenu({super.key, required this.item});

  final ItemMenu item;

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;
    return Card(
      elevation: 0,
      color: warna.surfaceContainerLow,
      margin: const EdgeInsets.symmetric(vertical: 5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
        leading: CircleAvatar(
          backgroundColor: warna.secondaryContainer,
          child: Icon(
            ikonKategori(item.kategori),
            color: warna.onSecondaryContainer,
          ),
        ),
        title: Text(item.nama, style: teks.titleMedium),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Wrap(
            children: [
              Chip(
                label: Text(item.kategori),
                visualDensity: VisualDensity.compact,
                side: BorderSide.none,
                backgroundColor: warna.tertiaryContainer,
                labelStyle: teks.labelMedium?.copyWith(
                  color: warna.onTertiaryContainer,
                ),
              ),
            ],
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              rupiah(item.harga),
              style: teks.titleSmall?.copyWith(
                fontWeight: FontWeight.w700,
                color: warna.primary,
              ),
            ),
            TombolFavorit(nama: item.nama),
          ],
        ),
      ),
    );
  }
}

// Widget Stateful kecil: hanya bagian ini yang datanya (favorit atau tidak) berubah
class TombolFavorit extends StatefulWidget {
  const TombolFavorit({super.key, required this.nama});

  final String nama;

  @override
  State<TombolFavorit> createState() => _TombolFavoritState();
}

class _TombolFavoritState extends State<TombolFavorit> {
  bool _favorit = false;

  void _ubah() {
    // setState memberi tahu Flutter agar build() dijalankan ulang
    setState(() => _favorit = !_favorit);

    final pesan = _favorit
        ? '${widget.nama} ditambahkan ke favorit'
        : '${widget.nama} dihapus dari favorit';
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(content: Text(pesan), behavior: SnackBarBehavior.floating),
      );
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: _ubah,
      tooltip: 'Favorit',
      icon: Icon(
        _favorit ? Icons.favorite : Icons.favorite_border,
        // Warna dari tema, bukan ditulis langsung
        color: _favorit ? Theme.of(context).colorScheme.primary : null,
      ),
    );
  }
}
