import 'package:flutter/material.dart';

class Perfildos extends StatefulWidget{
  const Perfildos({super.key});

  @override
  State<Perfildos> createState() => _PerfildosState();

}

class _PerfildosState extends State<Perfildos>{
  
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