// En widget_test.dart
import 'package:flutter_test/flutter_test.dart';

// 1. IMPORTANTE: Cambia 'myapp' por el nombre real de tu proyecto
import 'package:myapp/main.dart'; 

void main() {
  testWidgets('Prueba de carga de Ferretería El Patito', (WidgetTester tester) async {
    // 1. Construye nuestra aplicación y dispara un frame.
    // Usamos MiAppFerreteria que es el nombre de la clase en el main.dart corregido
    await tester.pumpWidget(const MiAppFerreteria());

    // 2. Verificar que el encabezado con el nombre de la ferretería aparece.
    // Buscamos el texto exacto que pusiste en el diseño.
    expect(find.text('Ferreteria'), findsOneWidget);
    expect(find.text('el patito'), findsOneWidget);

    // 3. Verificar que la barra de navegación tenga los elementos correctos.
    expect(find.text('buscar'), findsOneWidget);
    expect(find.text('sucursales'), findsOneWidget);
    expect(find.text('carrito'), findsOneWidget);

    // 4. Verificar que se carguen los productos de la lista.
    // Al menos debe encontrar uno de los títulos de tus productos
    expect(find.text('Pala Redonda'), findsOneWidget);
    expect(find.text('Martillo Profesional'), findsOneWidget);

    // 5. Verificar que existan los botones de "ver producto".
    // Como hay 3 productos, debería encontrar 3 botones.
    expect(find.text('ver producto'), findsNWidgets(3));

    // 6. Prueba de interacción: Tocar el botón "ver producto" del primer elemento.
    await tester.tap(find.text('ver producto').first);
    await tester.pumpAndSettle(); // Espera a que termine la animación de navegación

    // Verificar que después del tap, estamos en la pantalla de detalle (DetalleProductoPage).
    // El AppBar de la página de detalle debería tener el nombre del producto.
    expect(find.text('Pala Redonda'), findsWidgets); 
  });
}
