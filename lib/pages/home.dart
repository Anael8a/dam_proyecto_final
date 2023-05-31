import 'package:dam_proyecto_final/pages/agregarreceta.dart';
import 'package:dam_proyecto_final/pages/infogeneral.dart';
import 'package:dam_proyecto_final/services/database.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
final String idReceta;
  const Home({Key? key, required this.idReceta}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Post> post = [];
  @override
  Widget build(BuildContext context) {
    String idReceta = widget.idReceta;
      return Scaffold(
        appBar: AppBar( title: Text("Instagram post"),),
        body: FutureBuilder(
          future: getRecetas(widget.idReceta),
          builder: ((context,snapshot) {
            return ListView.builder(
                itemCount: snapshot.data?.length,
                itemBuilder: (context, index){
              return ListTile(

                title: Text(snapshot.data?[index]['nombre'] ?? '', style:
                  TextStyle(fontWeight: FontWeight.bold),),
              subtitle:
                  Text(

                          'Descripcion: ${snapshot.data?[index]['descripcion']??''}\n'
                        'Personas:${snapshot.data?[index]['personas']??''}\n'
                        'Tiempo:${snapshot.data?[index]['tiempoE']??''}\n'
                  ),


               leading: Image.network(snapshot.data?[index]['imageUrl']??'',width: 150, height: 150,),
                onTap:()async{
                    await Navigator.pushNamed(context, '/infoGeneral', arguments: {
                      nombre:snapshot.data?[index]["nombre"],
                      "descripcion":snapshot.data?[index]["descripcion"],
                      "tiempoE":snapshot.data?[index]["TiempoE"],
                      "personas":snapshot.data?[index]["personas"],
                      "ingredientes":snapshot.data?[index]["ingredientes"],
                      "pasosSeguir":snapshot.data?[index]["pasosSeguir"],
                      "imageUrl":snapshot.data?[index]["imageUrl"],
                    });

                  },
              );

            }
            );
          }
          )),
        floatingActionButton: FloatingActionButton(onPressed: ()async{
            await Navigator.push(context, MaterialPageRoute(builder: (builder)=> AgregarReceta(),),).then((newPost) {
              if (newPost != null){
                setState(() {
                  post.add(newPost);
                });
              }
            });
        },
        child: Icon(Icons.add),),
      );
  }

}
class Post {
  final String text;

  Post({required this.text});
}