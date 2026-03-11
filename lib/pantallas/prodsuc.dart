import 'package:flutter/material.dart';

// 1. MODELO DE DATOS
class Producto {
  final String titulo;
  final String subtitulo;
  final String imgUrl;
  final double precio;

  Producto({
    required this.titulo,
    required this.subtitulo,
    required this.imgUrl,
    required this.precio,
  });
}

void main() {
  runApp(const MiAppFerreteria());
}

class MiAppFerreteria extends StatelessWidget {
  const MiAppFerreteria({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProdSucPage(
        nombreSucursal: "Sucursal Norte",
        telefono: "555-0123",
        direccion: "Av. Industrial #45",
      ),
    );
  }
}

class ProdSucPage extends StatelessWidget {
  final String nombreSucursal, telefono, direccion;

  const ProdSucPage({
    super.key,
    required this.nombreSucursal,
    required this.telefono,
    required this.direccion,
  });

  @override
  Widget build(BuildContext context) {
    const double singleCardWidth = 360.0;
    final Color naranjaFuerte = Colors.orange[800]!;
    const Color fondoOscuro = Color(0xFF1A1A1A);
    final Color colorCuadros = Colors.blueGrey[50]!;

    const TextStyle estiloInfoSucursal = TextStyle(
      fontSize: 16,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    );

    final List<Producto> listaProductos = [
      Producto(
        titulo: 'Pala Redonda',
        subtitulo: 'Acero templado alta resistencia.',
        imgUrl: 'https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/pala.jpg',
        precio: 50.00,
      ),
      Producto(
        titulo: 'Martillo Profesional',
        subtitulo: 'Mango ergonómico anti-vibración.',
        imgUrl: 'https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/martillo.png',
        precio: 85.50,
      ),
      Producto(
        titulo: 'Taladro Percutor',
        subtitulo: 'Potencia industrial 800W.',
        imgUrl: 'https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/taladro.jpg',
        precio: 1250.00,
      ),
    ];

    return Scaffold(
      backgroundColor: fondoOscuro,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- ENCABEZADO ---
            Container(
              width: double.infinity,
              color: naranjaFuerte,
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: const Center(
                child: Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ferreteria', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black)),
                      Text('el patito', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold, color: Colors.black)),
                    ],
                  ),
                ),
              ),
            ),
            Container(height: 10, color: fondoOscuro),
            // --- NAVEGACIÓN ---
            Container(
              height: 35,
              width: double.infinity,
              color: naranjaFuerte,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _navText('buscar', () {}),
                  const Text('|', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  _navText('sucursales', () {}),
                  const Text('|', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  _navText('carrito', () {}),
                  const Text('|', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                  _navText('iniciar', () {}),
                ],
              ),
            ),
            // --- INFO SUCURSAL ---
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: colorCuadros,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("productos $nombreSucursal".toLowerCase(), style: estiloInfoSucursal),
                    Text("telefono: $telefono", style: estiloInfoSucursal),
                    Text("direccion: $direccion", style: estiloInfoSucursal),
                  ],
                ),
              ),
            ),
            // --- LISTADO ---
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Wrap(
                spacing: 20,
                runSpacing: 20,
                alignment: WrapAlignment.center,
                children: listaProductos.map((p) => ProductCard(
                  producto: p,
                  width: singleCardWidth,
                  btnColor: naranjaFuerte,
                  cardColor: colorCuadros,
                )).toList(),
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  Widget _navText(String label, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Text(label, style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)),
    );
  }
}

// 3. WIDGET TARJETA
class ProductCard extends StatelessWidget {
  final Producto producto;
  final double width;
  final Color btnColor, cardColor;

  const ProductCard({
    super.key,
    required this.producto,
    required this.width,
    required this.btnColor,
    required this.cardColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          )
        ],
      ),
      padding: const EdgeInsets.all(12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey[800]!, width: 2),
            ),
            child: Image.network(producto.imgUrl, fit: BoxFit.contain),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(producto.titulo, style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                Text(producto.subtitulo, style: const TextStyle(fontSize: 13, color: Colors.black87)),
                const SizedBox(height: 8),
                Text("Precio: \$${producto.precio.toStringAsFixed(2)}", style: const TextStyle(fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  height: 35,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: btnColor,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                    ),
                    child: const Text("ver producto", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}