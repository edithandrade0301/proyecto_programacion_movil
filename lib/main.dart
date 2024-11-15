import 'package:flutter/material.dart';
import 'package:proyecto_programacion_movil/crear/crearnota.dart';
import 'package:proyecto_programacion_movil/crear/crearrecord.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Nombre de la Aplicacion'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: DefaultTabController(
        length: 3, 
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
            backgroundColor: Colors.green[50],
            bottom: TabBar(
              indicatorColor: Colors.lightBlue[600],
              unselectedLabelColor: Colors.red[200],
              labelColor: const Color.fromARGB(255, 255, 170, 106),
              tabs: const [
                Tab(text: 'Inf. Durante\nel Embarazo'),
                Tab(text: 'Inf. Despues\ndel Embarazo'),
                Tab(text: 'Calendario')
              ]),
          ),
          body: TabBarView(
            children: [
              Container(
                color: Colors.lightBlue[50],
                child: InfoDuranteTab(),
              ),
              Container(
                color: Colors.pink[50],
                child: InfoDespuesTab(),
              ),
              Container(
                color: Colors.yellow[50],
                child: CalendarioTab()
              )
            ]
          ),
          floatingActionButton: const MiFAB(),
        )
      )
    );
  }
}

class InfoDuranteTab extends StatelessWidget{
  const InfoDuranteTab({super.key});

  Widget getInfo(BuildContext context, int index){
    return Card( //cambiar la card por la de edith incluyendo el $index
      child: Padding(
        padding: const EdgeInsets.all(8),
        child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Image(
                  image: NetworkImage('https://i.pinimg.com/236x/32/5a/37/325a37769e88d1414d5ce1343f732024.jpg'),
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mes $index'
                    ),
                      const SizedBox(height: 3),
                      const Text(
                        'Lorem Epsum Indicare'
                    ),
                  ],
                )
              ],
            ),
            const Icon(Icons.arrow_forward) //que redirija a una pagina blanca
          ]
        )
      )
    );
  }

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      padding: const EdgeInsets.all(1),
      itemCount: 12,// a futuro se cambiara por el lenght de la base de datos (la tabla que contenga la info correspondiente)
      itemBuilder: (BuildContext context, int index){
        return getInfo(context, index+1);
      },
    );
  }
}

class InfoDespuesTab extends StatelessWidget{
  const InfoDespuesTab({super.key});

  Widget getInfo(BuildContext context, int index){
    return Card(//cambiar la card por la de edith incluyendo el $index
      child: Padding(
        padding: const EdgeInsets.all(8),
        child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const Image(
                  image: NetworkImage('https://i.pinimg.com/236x/32/5a/37/325a37769e88d1414d5ce1343f732024.jpg'),
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover),
                  const SizedBox(width: 20),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tema del Embarazo $index'
                    ),
                      const SizedBox(height: 3),
                      const Text(
                        'Lorem Epsum Indicare'
                    ),
                  ],
                )
              ],
            ),
            const Icon(Icons.arrow_forward) //que redirija a una pagina blanca
          ]
        )
      )
    );
  }

  @override
  Widget build(BuildContext context){
    return ListView.builder(
      padding: const EdgeInsets.all(1),
      itemCount: 12, // a futuro se cambiara por el lenght de la base de datos (la tabla que contenga la info correspondiente)
      itemBuilder: (BuildContext context, int index){
        return getInfo(context, index+1);
      }
    );
  }
}

class CalendarioTab extends StatefulWidget{
  const CalendarioTab({super.key});

  @override
  _CalendarioTabState createState() => _CalendarioTabState();
  
}

class _CalendarioTabState extends State<CalendarioTab>{
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context){ //desarrollo del calendario a futuro
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: 
        TableCalendar(
          firstDay: DateTime(DateTime.now().year, 1, 1),
          lastDay: DateTime(DateTime.now().year + 2000, 12, 31),
          focusedDay: _focusedDay,
          calendarFormat: CalendarFormat.month,
          startingDayOfWeek: StartingDayOfWeek.sunday,
          onDaySelected: (selectedDay, focusedDay){
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          },
          selectedDayPredicate: (day){
            return isSameDay(_selectedDay, day);
          },
          calendarStyle: CalendarStyle(
            todayDecoration: BoxDecoration(
              color: Colors.blue[200],
              shape: BoxShape.circle
            ),
            selectedDecoration: BoxDecoration(
              color: Colors.pink[200],
              shape: BoxShape.circle,
            )
          ),
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
        )
      ),
    );
  }
//agregar cards de las notas creadas por el usuario
}

//eliminacion del drawer, modificacion 1

class MiFAB extends StatelessWidget{

  const MiFAB({super.key});

  @override
  Widget build(BuildContext context){
    return SpeedDial( //dejar solo la opcion de la camara
      icon: Icons.add,
      buttonSize: const Size(50, 50),
      activeIcon: Icons.close,
      visible: true,
      children: [
        SpeedDialChild(
          child: const Icon(Icons.photo_camera),
          labelWidget: const Text(
            'Chequeo de Estado',
            style: TextStyle(fontSize: 20),
          ),
          /*onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CrearNotaForm()));
          }*/
        ),
        SpeedDialChild(
          child: const Icon(Icons.pending_actions),
          labelWidget: const Text(
            'Crear Recordatorio de Cita',
            style: TextStyle(fontSize: 20),
          ),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CrearRecordForm()));
          }
        ),
        SpeedDialChild(
          child: const Icon(Icons.edit),
          labelWidget: const Text(
            'Crear Nota de Cuidado',
            style: TextStyle(fontSize: 20),
          ),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CrearNotaForm()
              )
            );
          }
        )
      ]
    );
  }
}