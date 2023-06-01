import 'package:dam_proyecto_final/pages/home.dart';
import 'package:dam_proyecto_final/pages/mainhome.dart';
import 'package:flutter/material.dart';

import '../services/database.dart';

class InicioSeccion extends StatefulWidget {
  const InicioSeccion({Key? key}) : super(key: key);

  @override
  State<InicioSeccion> createState() => _InicioSeccionState();
}

class _InicioSeccionState extends State<InicioSeccion> {

  String _nombre="";
  String _email="";
  String _password="";


  TextEditingController usuer = TextEditingController();
  TextEditingController correo = TextEditingController();
  TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.tealAccent,
      body: ListView(
        children: <Widget> [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage("https://imgur.com/sbZAVHu.jpg"),
              ),
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'cursive',
                ),
              ),
              SizedBox(width: 160.0, height: 15,child: Divider(
                color: Colors.black54,
              ),),
              Divider(
                height: 18.0,
              ),
              TextField(
                enableInteractiveSelection: false,
                textCapitalization: TextCapitalization.characters,
                controller: usuer,
                decoration: InputDecoration(hintText: 'USER',
                    labelText: "Usuario",
                suffixIcon: Icon(Icons.verified_user_rounded),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)
                  )
                ),
                onSubmitted: (valor){
                  _nombre = valor;
                  print('El nombre es $_nombre');
                },                
              ),
              Divider(
                height: 18.0,
              ),
              TextField(
                controller: correo,
                decoration: InputDecoration(hintText: 'EMAIL',

                labelText: "Email",
                suffixIcon: Icon(Icons.alternate_email),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0)
                )),
                onSubmitted: (valor){
                  _email = valor;
                  print('El Email es $_email');
                },
              ),
              Divider(
                height: 18.0,
              ),
              TextField(
                enableInteractiveSelection: false,
                controller: pass,
                obscureText: true,
                decoration: InputDecoration(hintText: 'PASSWORD',
                    labelText: "Password",
                    suffixIcon: Icon(Icons.lock_outline),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0)
                    )),
                onSubmitted: (valor){
                  _password = valor;
                  print('La passwords es $_password');
                },
              ),
              Divider(
                height: 18.0,
              ),
              SizedBox(
                child: ElevatedButton(

                  onPressed: ()async{
                    await InsertarUsuario (usuer.text, correo.text, pass.text);
                   await Navigator.push(context, MaterialPageRoute(builder:(context) => MainHome()));

                  },child: Text("Inicio Seccion"),

                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
