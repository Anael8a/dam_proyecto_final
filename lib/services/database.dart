import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore bd = FirebaseFirestore.instance;



//insertar receta
Future<void> InsertarReceta(
    String nombre,
    String descripcion,
    String tiempoE,
    String personas,
    String ingredientes,
    String pasosSeguir,
    String imageUrl,) async{
  await bd.collection("receta").add({
    "nombre":nombre,
    "descripcion":descripcion,
    "tiempoE":tiempoE,
    "personas":personas,
    "ingredientes":ingredientes,
    "pasosSeguir":pasosSeguir,
    "imageUrl":imageUrl,
  });
}


//para mostrar las recetas
Future<List> getRecetas(String idReceta) async{
  List receta = [];
  QuerySnapshot querySnapshot= await bd.collection("receta").get();
  for(var doc in querySnapshot.docs){
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final recetaObjet = {
      "nombre":data["nombre"],
      "descripcion":data["descripcion"],
      "tiempoE":data["TiempoE"],
      "personas":data["personas"],
      "ingredientes":data["ingredientes"],
      "pasosSeguir":data["pasosSeguir"],
      "imageUrl":data["imageUrl"],
      "uid":doc.id,
    };
    receta.add(recetaObjet);
  }
  await Future.delayed(Duration(seconds: 2));
  return receta;
}

Future<List> getInfoGeneral() async{
  List receta = [];
  QuerySnapshot querySnapshot= await bd.collection("receta").get();
  for(var doc in querySnapshot.docs){
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final recetaObjet = {
      "nombre":data["nombre"],
      "descripcion":data["descripcion"],
      "tiempoE":data["TiempoE"],
      "personas":data["personas"],
      "ingredientes":data["ingredientes"],
      "pasosSeguir":data["pasosSeguir"],
      "imageUrl":data["imageUrl"],
      "uid":doc.id,
    };
    receta.add(recetaObjet);
  }
  await Future.delayed(Duration(seconds: 2));
  return receta;
}











//insertar usuarios
Future<void> InsertarUsuario(
    String usuario,
    String correo,
    String password,
   ) async{
  await bd.collection("usuarios").add({
    "usuario":usuario,
    "correo":correo,
    "password":password,

  });
}