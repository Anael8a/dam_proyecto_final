import 'package:dam_proyecto_final/services/database.dart';
import 'package:flutter/material.dart';

class InfoGeneral extends StatefulWidget {


  const InfoGeneral({Key? key}) : super(key: key);

  @override
  State<InfoGeneral> createState() => _InfoGeneralState();
}

class _InfoGeneralState extends State<InfoGeneral> {
TextEditingController nombre= TextEditingController();
TextEditingController descripcion= TextEditingController();
TextEditingController imageUrl= TextEditingController();
TextEditingController ingredientes= TextEditingController();

TextEditingController pasosSeguir= TextEditingController();
TextEditingController personas= TextEditingController();
TextEditingController tiempoE= TextEditingController();



  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map? ??{};
    if(arguments.isNotEmpty){
      nombre.text = arguments['nombre']??'';
      descripcion.text = arguments['descripcion']??'';
      imageUrl.text = arguments['imageUrl']??'';
      ingredientes.text = arguments['ingredientes']??'';
      pasosSeguir.text = arguments['pasosSeguir']??'';
      personas.text = arguments['personas']??'';
      tiempoE.text = arguments['tiempoE']??'';

    }


    return Scaffold(
      appBar: AppBar(title: Text("Informacion de receta"),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(nombre.text, style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.underline

            ),),

            Image.network(imageUrl.text),

            Divider(height: 15.0,),

            Text(descripcion.text, style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.normal
            ),),

            Divider(height: 15.0),


            Text(tiempoE.text, style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),

            SizedBox(height: 16,),

            Text(personas.text, style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold
            ),),
            SizedBox(height: 16,),

            Divider(height: 15.0,),

            SizedBox(height: 16.0,),

            Text(ingredientes.text, style: TextStyle(
              fontSize: 20,
            ),),

            Divider(height: 15.0,),

            Text(pasosSeguir.text, style: TextStyle(
              fontSize: 20
            ),)
          ],

        ),
      )
      );

  }
}
