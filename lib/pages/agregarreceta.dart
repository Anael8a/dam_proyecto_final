import 'package:dam_proyecto_final/pages/home.dart';
import 'package:dam_proyecto_final/services/database.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  TextEditingController _textEditingController = TextEditingController();
  String? _imageURL;


  Future<void> _selectImage() async{
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if(pickedFile != null ){
      //guarda la URL de la imagen seleccionada
      _imageURL = pickedFile.path;
    }
  }


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
            SizedBox(height: 16.0,),
            //ElevatedButton(onPressed: _selectImage, child:Text("Select image"), style: TextButton.styleFrom(primary: Colors.black, backgroundColor:Colors.green ),),
            //SizedBox(height: 16.0,),
            TextField(controller: _textEditingController,decoration: InputDecoration(labelText: "Pega la url"),),
            SizedBox(height: 16.0,),
            ElevatedButton(onPressed: ()async{
                  await InsertarReceta(nombreReceta.text, descripcion.text, tiempoE.text, personas.text,
                      ingredientes.text, pasosSeguir.text, _textEditingController.text).then((_) {
                        String text= _textEditingController.text;
                    if(text.isNotEmpty != null){
                      Post newPost = Post(text:text);
                      Navigator.pop(context,newPost);
                    }else{
                      AlertDialog(title: Text("Error"), content: Text("Favor de seleccionar una foto"),
                      actions: [
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();//regresa a la pantalla actual
                        }, child: Text("Aceptar"),
                        ),
                        TextButton(onPressed: (){
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        }, child: Text("Cancelar"),)
                      ],
                      );
                    }

                  }

                  );

            }, child: Text("Agregar"),)



          ],
        ),
      )
    );
  }
}
