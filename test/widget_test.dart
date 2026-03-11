import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// Asegúrate de que el nombre del paquete coincida con el de tu proyecto
import 'package:myapp/main.dart'; 

void main() {
  testWidgets('Prueba de carga de productos de ferretería', (WidgetTester tester) async {
    // 1. Carga la aplicación
    await tester.pumpWidget(const MiFerreteriaApp());

    // 2. Verifica que el título de la AppBar sea el correcto
    expect(find.text('Ferretería "El Clavo"'), findsOneWidget);

    // 3. Verifica que los títulos de los productos existan en la pantalla
    expect(find.text('Herramientas Varias'), findsOneWidget);
    expect(find.text('Martillo Profesional'), findsOneWidget);
    expect(find.text('Taladro Percutor'), findsOneWidget);

    // 4. Verifica que existan exactamente 3 tarjetas (Card)
    expect(find.byType(Card), findsNWidgets(3));

    // 5. Verifica que se están intentando cargar imágenes
    expect(find.byType(Image), findsNWidgets(3));
  });
}