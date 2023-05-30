import 'package:dam_proyecto_final/services/database.dart';
import 'package:flutter/material.dart';

class AgregarReceta extends StatefulWidget {
  const AgregarReceta({Key? key}) : super(key: key);

  @override
  State<AgregarReceta> createState() => _AgregarRecetaState();
}

class _AgregarRecetaState extends State<AgregarReceta> {
  TextEditingController nombreReceta = TextEditingController();
  TextEditingController descripcion = TextEditingController();
  TextEditingController tiempoE = TextEditingController();
  TextEditingController personas = TextEditingController();
  TextEditingController ingredientes = TextEditingController();
  TextEditingController pasosSeguir = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FIBRap"),),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            CircleAvatar(
              child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7rCgDVj7TxXRBtbgI_hoCn7sxKsaOWuNelw&usqp=CAU'),
              radius: 20,
            ),
            SizedBox(height: 16.0,),
            TextField(controller: nombreReceta,decoration: InputDecoration(labelText: "Nombre receta"),),
            SizedBox(height: 16.0,),
            TextField(controller: descripcion,decoration: InputDecoration(labelText: "Descripcion "),),
            SizedBox(height: 16.0,),
            TextField(controller: tiempoE,decoration: InputDecoration(labelText: "Tiempo estimado "),),
            SizedBox(height: 16.0,),
            TextField(controller: personas,decoration: InputDecoration(labelText: "Para cuantas personas"),),
            SizedBox(height: 16.0,),
            TextField(controller: ingredientes,maxLines: null ,decoration: InputDecoration(labelText: "Ingredientes "),),
            SizedBox(height: 16.0,),
            TextField(controller: pasosSeguir,maxLines: null ,decoration: InputDecoration(labelText: "Pasos a seguir"),),
            ElevatedButton(onPressed: ()async{
                  await InsertarReceta(nombreReceta.text, descripcion.text, tiempoE.text, personas.text,
                      ingredientes.text, pasosSeguir.text).then((_) => Navigator.pop(context)
                  );
            }, child: Text("Agregar"),)



          ],
        ),
      )
    );
  }
}
