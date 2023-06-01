import 'package:dam_proyecto_final/services/database.dart';
import 'package:flutter/material.dart';

class BuscarReceta extends StatefulWidget {
  const BuscarReceta({Key? key}) : super(key: key);

  @override
  State<BuscarReceta> createState() => _BuscarRecetaState();
}

class _BuscarRecetaState extends State<BuscarReceta> {


  TextEditingController buscadorControler = TextEditingController();
  Future<List<Map<String, dynamic>>>? recetaFuture;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Buscador de recetas"),centerTitle: true,),
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            TextField(controller: buscadorControler,
            decoration: InputDecoration(labelText: "Nombre receta"),),
            Padding(padding: EdgeInsets.all(15)),
            ElevatedButton(onPressed: (){
              setState(() {
                recetaFuture = getPorReceta(buscadorControler.text);
              });
            }, child: Text("Buscar")),
            SizedBox(height: 20.0,),
            Expanded(child: FutureBuilder<List<Map<String, dynamic>>>(
              future: recetaFuture,
              builder: (context, snapshot){
                if(snapshot.connectionState == ConnectionState.waiting){
                  return const Center(child: CircularProgressIndicator(),);

                }else if(snapshot.hasError){
                  return const Center(child: Text("Ha ocurrido un error"),);
                }else{
                  final recetas = snapshot.data ?? [];
                  return ListView.builder(
                      itemCount: recetas.length,
                      itemBuilder: (context,index){
                        final recet=recetas[index];
                        print("Si jala wey");
                        return ListTile(

                          title: Text(' ${recet['nombre']}', style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),),
                          subtitle:
                          Text(

                              'Descripcion: ${recet['descripcion']??''}\n'
                                  'Personas:${recet['personas']??''}\n'
                                  'Tiempo:${recet['tiempoE']??''}\n'
                          ),


                          leading: Image.network(recet['imageUrl']??'',width: 150, height: 150,),
                          onTap:()async{
                            await Navigator.pushNamed(context, '/infoGeneral', arguments: {
                              "nombre":recet["nombre"],
                              "descripcion":recet["descripcion"],
                              "tiempoE":recet["tiempoE"],
                              "personas":recet["personas"],
                              "ingredientes":recet["ingredientes"],
                              "pasosSeguir":recet["pasosSeguir"],
                              "imageUrl":recet["imageUrl"],
                            });

                          },
                        );

                      });
                }
              },
            ))
          ],
        ),
      )
    );
  }
}
