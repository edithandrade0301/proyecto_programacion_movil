import 'package:flutter/material.dart';

class Perfil extends StatefulWidget{
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();

}

class _PerfilState extends State<Perfil>{
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de la Tarjeta'),
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
                      Text('Texto de Ejemplo para el Perfil')
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