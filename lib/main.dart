import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Calculadora Divisas Mintic'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class calculadora {
  final titulo;
  final color;
  final icono;

  calculadora(this.titulo, this.color, this.icono);
}

final textOrigen = TextEditingController();
final textDestino = TextEditingController();

String op1 = "USD";
String op2 = "USD";

List<DropdownMenuItem<String>> moneda = <DropdownMenuItem<String>>[
  DropdownMenuItem(
    value: "USD",
    child: Text("USD"),
  ),
  DropdownMenuItem(
    value: "EUR",
    child: Text("EUR"),
  ),
  DropdownMenuItem(
    value: "COP",
    child: Text("COP"),
  )
];

List<calculadora> cal = <calculadora>[
  calculadora("9", Color.fromARGB(255, 243, 236, 233), Icon(Icons.abc)),
  calculadora("8", Color.fromARGB(255, 243, 236, 233), Icon(Icons.abc)),
  calculadora("7", Color.fromARGB(255, 243, 236, 233), Icon(Icons.abc)),
  calculadora("6", Color.fromARGB(255, 243, 236, 233), Icon(Icons.abc)),
  calculadora("5", Color.fromARGB(255, 243, 236, 233), Icon(Icons.abc)),
  calculadora("4", Color.fromARGB(255, 243, 236, 233), Icon(Icons.abc)),
  calculadora("3", Color.fromARGB(255, 243, 236, 233), Icon(Icons.abc)),
  calculadora("2", Color.fromARGB(255, 243, 236, 233), Icon(Icons.abc)),
  calculadora("1", Color.fromARGB(255, 243, 236, 233), Icon(Icons.abc)),
  calculadora("0", Color.fromARGB(255, 243, 236, 233), Icon(Icons.abc)),
  calculadora(
      "Limpiar", Color.fromARGB(255, 226, 233, 167), Icon(Icons.delete)),
  calculadora("=", Color.fromARGB(255, 226, 233, 167), Icon(Icons.calculate)),
];

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.title,
          style: TextStyle(fontFamily: 'Lucida Calligraphy', fontSize: 20),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                Text("Origen  :  "),
                DropdownButton(
                  value: op1,
                  items: moneda,
                  onChanged: (String? X) {
                    setState(() {
                      op1 = X.toString();
                    });
                  },
                ),
                Text("   Destino  :  "),
                DropdownButton(
                  value: op2,
                  items: moneda,
                  onChanged: (String? X) {
                    setState(() {
                      op2 = X.toString();
                    });
                  },
                ),
              ],
            ),
            TextField(
              enabled: false,
              textAlign: TextAlign.center,
              controller: textOrigen,
              style:
                  TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: "Moneda Origen",
                hintText: "0",
                prefixIcon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Divider(),
            TextField(
              enabled: false,
              textAlign: TextAlign.center,
              controller: textDestino,
              style:
                  TextStyle(color: Colors.brown, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: "Moneda Destino",
                hintText: "0",
                prefixIcon: Icon(Icons.monetization_on),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            Divider(),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: cal.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    shape: const CircleBorder(
                        side: BorderSide(
                      color: Color.fromARGB(255, 102, 82, 75),
                      width: 6,
                    )),
                    color: cal[index].color,
                    child: ListTile(
                      title: Center(
                        child: index == 10
                            ? cal[index].icono
                            : Text(
                                cal[index].titulo,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 40),
                              ),
                      ),
                      onTap: () {
                        if (index == 10) {
                          textOrigen.text = "";
                          textDestino.text = "";
                        } else if (index < 10) {
                          textOrigen.text = textOrigen.text + cal[index].titulo;
                        } else {
                          if (op1 == "USD" && op2 == "COP") {
                            textDestino.text =
                                (double.parse(textOrigen.text) * 5107)
                                    .toString();
                          } else if (op1 == "COP" && op2 == "USD") {
                            textDestino.text =
                                (double.parse(textOrigen.text) / 5107)
                                    .toString();
                          } else if (op1 == "EUR" && op2 == "COP") {
                            textDestino.text =
                                (double.parse(textOrigen.text) * 5116)
                                    .toString();
                          } else if (op1 == "COP" && op2 == "EUR") {
                            textDestino.text =
                                (double.parse(textOrigen.text) / 5116)
                                    .toString();
                          } else if (op1 == "USD" && op2 == "EUR") {
                            textDestino.text =
                                (double.parse(textOrigen.text) * 0.99)
                                    .toString();
                          } else if (op1 == "EUR" && op2 == "USD") {
                            textDestino.text =
                                (double.parse(textOrigen.text) / 0.99)
                                    .toString();
                          } else {
                            textDestino.text = textOrigen.text;
                          }
                        }
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
