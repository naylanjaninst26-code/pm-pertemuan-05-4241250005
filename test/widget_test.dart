import 'package:flutter_test/flutter_test.dart';
import 'package:material_ui/material_ui.dart';
import 'package:pm_pertemuan_05/main.dart';

void main() {
  testWidgets('Ikon favorit berubah saat ditekan', (WidgetTester tester) async {
    // Layar test dibuat tinggi supaya semua kartu menu ikut tampil
    tester.view.physicalSize = const Size(800, 4000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pumpWidget(const MenuUmkmApp());

    final jumlah = daftarMenu.length;

    // Awalnya semua ikon hati kosong
    expect(find.byIcon(Icons.favorite_border), findsNWidgets(jumlah));
    expect(find.byIcon(Icons.favorite), findsNothing);

    // Tekan tombol favorit pada menu pertama
    await tester.tap(find.byIcon(Icons.favorite_border).first);
    await tester.pump();

    // Sekarang satu ikon terisi, sisanya tetap kosong
    expect(find.byIcon(Icons.favorite), findsOneWidget);
    expect(find.byIcon(Icons.favorite_border), findsNWidgets(jumlah - 1));

    // Pesan SnackBar muncul
    expect(
      find.text('Nasi Goreng Spesial ditambahkan ke favorit'),
      findsOneWidget,
    );
  });
}
