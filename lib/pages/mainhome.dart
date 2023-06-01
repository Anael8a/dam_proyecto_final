import 'package:dam_proyecto_final/pages/buscar.dart';
import 'package:dam_proyecto_final/pages/home.dart';
import 'package:dam_proyecto_final/pages/iniciosecion.dart';
import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _indice=0;

  void _cambiarIndice(int indice){
    setState(() {
      _indice = indice;
    });
  }

  final List<Widget> _paginas =[
    Home(idReceta: ''),
    BuscarReceta(),

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _indice == 1? Colors.yellow[200]:Colors.white,
      appBar: AppBar(title: const Text("FibrApp"),centerTitle: true,),
      body: _paginas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: "Inicio"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Buscar"),


        ],
        currentIndex: _indice,
        showUnselectedLabels: false,
        iconSize: 25,
        backgroundColor: Colors.teal,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white38,
        onTap: _cambiarIndice,
      ),
    );
  }
}
