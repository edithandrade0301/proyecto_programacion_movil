import 'package:flutter/material.dart';

class Perfil2 extends StatefulWidget{
  const Perfil2({super.key});

  @override
  State<Perfil2> createState() => _Perfil2State();

}

class _Perfil2State extends State<Perfil2>{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de la Tarjeta 2'),
        centerTitle: true,
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: const [
          Card(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('Texto de Ejemplo para el Perfil 2')
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}