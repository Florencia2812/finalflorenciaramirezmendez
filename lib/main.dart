import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FinalFlorencia',
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController insertcontroller = new TextEditingController();
  TextEditingController respuestacontroller = new TextEditingController();

  florencia(String x) {
    setState(() {
      respuestacontroller.text = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent[200],
        title: Text("Final - Operaciones",
            style: TextStyle(color: Colors.cyanAccent[100])),
      ),
      body: Container(
        color: Colors.blueAccent[100],
        padding: EdgeInsets.all(50.0),
        child: Column(
          children: [
            Padding(padding: EdgeInsets.fromLTRB(20, 80, 20, 80)),
            Container(
              child: TextFormField(
                controller: insertcontroller,
                style: TextStyle(color: Colors.cyanAccent),
                decoration: InputDecoration(
                  icon: Icon(IconData(58727, fontFamily: 'MaterialIcons')),
                  hintText: "Ingrese Numero",
                  hintStyle: TextStyle(color: Colors.cyanAccent),
                ),
              ),
            ),
            SizedBox(height: 40.0),
            Container(
              child: TextFormField(
                controller: respuestacontroller,
                style: TextStyle(color: Colors.cyanAccent),
                decoration: InputDecoration(
                    icon: Icon(IconData(58274, fontFamily: 'MaterialIcons')),
                    labelText: "La respuesta es",
                    labelStyle: TextStyle(color: Colors.cyanAccent)),
              ),
            ),
            FlatButton(
                onPressed: () {
                  _florencia(int.parse(insertcontroller.text));
                },
                color: Colors.cyanAccent,
                child: Text("Ingresar")),
          ],
        ),
      ),
    );
  }

  Future<void> _florencia(int id) async {
    String url =
        "https://finalramirezmendezflorencia.azurewebsites.net/api/[controller]?n=" +
            id.toString();
    final response =
        await http.get(url, headers: {"Accept": "aplication/json"});
    florencia(response.body);
  }
}
