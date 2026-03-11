import 'package:flutter/material.dart';
import 'pantallas/prodsuc.dart';

void main() => runApp(const MiAppFerreteria());

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