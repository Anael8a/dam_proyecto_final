import 'package:dam_proyecto_final/services/database.dart';
import 'package:flutter/material.dart';

class InfoGeneral extends StatefulWidget {
  final String nombre;
  final String descripcion;
  final String personas;
  final String tiempoE;
  final String imageUrl;



  const InfoGeneral({Key? key, required this.nombre, required this.descripcion, required this.personas, required this.tiempoE
  , required this.imageUrl}) : super(key: key);

  @override
  State<InfoGeneral> createState() => _InfoGeneralState();
}

class _InfoGeneralState extends State<InfoGeneral> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Informacion de receta"),),
      body: ListView.builder(
          itemCount: snapshot.data?.length,
          itemBuilder: itemBuilder)
      );

  }
}
