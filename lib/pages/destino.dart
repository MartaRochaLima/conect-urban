import 'package:flutter/material.dart';
import '../model/bus_route.dart';

class Destino extends StatefulWidget {
  const Destino({Key? key}) : super(key: key);

  @override
  State<Destino> createState() => _DestinoState();
}

class _DestinoState extends State<Destino>{
  List<BusRoute> _busRouteList = <BusRoute>[];

  final startFieldController = TextEditingController();
  final endFieldController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    startFieldController.dispose();
    endFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Expanded(child:
            Image.asset("assets/logo.png", width: 70, height:50 , alignment: Alignment(-0.3,0.0))),

          ],
        ),
      ),

      body: Container(
          padding: const EdgeInsets.only(
              top: 10,
              left:40,
              right: 40),
          color: Colors.white,
          child: Column(
            children: [
              Expanded(
                child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.start),
                          labelText: "Start",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        controller: startFieldController,
                        style: const TextStyle(
                          fontSize: 20,),
                      ),
                      const SizedBox(),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        decoration: const InputDecoration(
                          icon: Icon(Icons.directions_bus),
                          labelText: "Destination",
                          labelStyle: TextStyle(
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                            fontSize: 20,
                          ),
                        ),
                        controller: endFieldController,
                        style: const TextStyle(
                          fontSize: 20,),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          height: 60,
                          width: 160,
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              _getResults(startFieldController.text, endFieldController.text);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white// Background color
                            ),
                            child: const Text(
                              'Search',
                              style: TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          )
                      ),
                      const Divider(
                        color: Colors.black,
                      ),
                      Expanded(
                          child:
                            _busRouteList.isNotEmpty ? ListView.builder(
                              itemCount: _busRouteList.length,
                              itemBuilder: (context, index) => Card(
                                key: ValueKey(_busRouteList[index].number),
                                color: Colors.amberAccent,
                                elevation: 4,
                                margin: const EdgeInsets.symmetric(vertical: 10),
                                child: ListTile(
                                  leading: Text(
                                    _busRouteList[index].number,
                                    style: const TextStyle(fontSize: 24),
                                  ),
                                  title: Text(_busRouteList[index].name),
                                  subtitle: Text(
                                      _busRouteList[index].time
                                  ),
                                ),
                              ),
                            ) :
                            Text("Nenhum resultado encontrado"),
                       ),

                     ]
                ),
              ),
            ],
          )

      ),);
  }

  void _getResults(String start, String end) {
    // Wrapping it inside a set state will notify
    // the app that the state has changed

    var altiplanoManaira = <BusRoute>[
      BusRoute("0401", "Altiplano-Manaira", "Chegando em 45 minutos"),
      BusRoute("0402", "Altiplano-Bessa", "Chegando em 25 minutos"),
      BusRoute("0203", "Altiplano-Cabedelo", "Chegando em 5 minutos"),
      BusRoute("0404", "Circular", "Chegando em 15 minutos"),
    ];

    var bessaCentro = <BusRoute>[
      BusRoute("521", "Bessa-Centro", "Chegando em 45 minutos"),
      BusRoute("511", "Bessa-Centro", "Chegando em 25 minutos"),
      BusRoute("513", "Bessa-Lagoa", "Chegando em 5 minutos"),
    ];

    var route = <BusRoute>[];

    if (start.toUpperCase() == "ALTIPLANO" && end.toUpperCase() == "MANAIRA") {
      route = altiplanoManaira;
    } else if (start.toUpperCase() == "BESSA" && end.toUpperCase() == "CENTRO") {
      route = bessaCentro;
    }

    FocusManager.instance.primaryFocus?.unfocus();

    setState(() {
      this._busRouteList = route;
    });
  }
}