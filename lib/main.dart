import 'package:flutter/material.dart';

void main() {
  runApp(const MiFerreteriaApp());
}

class MiFerreteriaApp extends StatelessWidget {
  const MiFerreteriaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.orange,
      ),
      home: const PantallaProductos(),
    );
  }
}

// 1. Clase Producto (Ahora usa camelCase)
class Producto {
  final String titulo;
  final String subtitulo;
  final String imgUrl; // Corregido: img_url -> imgUrl

  Producto({
    required this.titulo,
    required this.subtitulo,
    required this.imgUrl,
  });
}

class PantallaProductos extends StatelessWidget {
  const PantallaProductos({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> datosFerreteria = [
      {
        'titulo': 'Herramientas Varias',
        'subtitulo': 'Kit esencial para reparaciones en el hogar.',
        'imgUrl': 'https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/f1.jpg',
      },
      {
        'titulo': 'Martillo Profesional',
        'subtitulo': 'Acero reforzado con mango ergonómico.',
        'imgUrl': 'https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/martillo.png',
      },
      {
        'titulo': 'Taladro Percutor',
        'subtitulo': 'Alta potencia para concreto y madera.',
        'imgUrl': 'https://raw.githubusercontent.com/angel-muela/imagenes-ferreteria/main/taladro.jpg',
      },
    ];

    final listaProductos = datosFerreteria.map((item) => Producto(
      titulo: item['titulo']!,
      subtitulo: item['subtitulo']!,
      imgUrl: item['imgUrl']!, // Corregido aquí también
    )).toList();

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('Ferretería "El Clavo"', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.orangeAccent,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: listaProductos.map((p) => TarjetaProducto(producto: p)).toList(),
          ),
        ),
      ),
    );
  }
}

class TarjetaProducto extends StatelessWidget {
  final Producto producto;
  const TarjetaProducto({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      // CORRECCIÓN: withOpacity -> withValues
      shadowColor: Colors.orangeAccent.withValues(alpha: 0.3), 
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [Colors.white, Colors.orange[50]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                producto.imgUrl, // Corregido
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => 
                   const Icon(Icons.broken_image, size: 50, color: Colors.grey),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    producto.titulo,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepOrange,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    producto.subtitulo,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.blueGrey[700],
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}