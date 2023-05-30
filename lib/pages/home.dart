import 'package:dam_proyecto_final/pages/agregarreceta.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar( title: Text("Instagram post"),),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("titulo del post", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),textAlign:TextAlign.center),
              SizedBox(height: 8.0),
              Text("Descripcion del post", style: TextStyle(fontSize: 15),),
              SizedBox(height: 16.0,),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7rCgDVj7TxXRBtbgI_hoCn7sxKsaOWuNelw&usqp=CAU'),
                    radius: 20.0,
                  ),
                  SizedBox(width: 8.0),
                  Text("nombre usuario", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),),
                ],
              ),
              SizedBox(height: 16,),
              Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTVkjVLSiUQb8V3Sm_Gn65a6ETDR3f2rZ7uA&usqp=CAU',
              fit: BoxFit.cover,
                width: double.infinity,
                height: 200.0,
              ),

              SizedBox(height: 16.0,),
              Row(
                children: [
                  Icon(Icons.favorite),
                  SizedBox(width: 8.0,),
                  Text("100 likes"),
                ],
              ),


            ],
          ),
          
        ),
        floatingActionButton: FloatingActionButton(onPressed: ()async{
            await Navigator.push(context, MaterialPageRoute(builder: (builder)=> AgregarReceta()));
        },
        child: Icon(Icons.add),),
      );
  }
}