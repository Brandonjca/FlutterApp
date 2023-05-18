import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MyApp extends StatelessWidget {
  static String _title = 'Ejemplo Contador';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Contador(),
    );
  }
}

// Aqui debemos digitar
class Contador extends StatefulWidget {
  Contador({super.key});

  @override
  State<Contador> createState() => _ContadorState();
}

class _ContadorState extends State<Contador> {
  int _contar = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EJEMPLO - UNO',
          style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 1, 37, 3),
              decoration: TextDecoration.underline),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(4, 133, 32, 0.694),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 50.0,
            ),
            Text(
              'El numero es : $_contar',
              style: const TextStyle(fontSize: 35.0, color: Colors.lightBlue),
            ),
            SizedBox(
              height: 250.0,
              width: 350.0,
              child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/6073/6073873.png'),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 20.0,
          color: Color.fromARGB(255, 8, 245, 0),
        ),
      ),
      floatingActionButton: _crearbuttoms(),
    );
  }

  _crearbuttoms() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const SizedBox(
          width: 30.0,
        ),
        FloatingActionButton(
          child: Icon(Icons.restore),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Row(
                      children: [
                        Image.network(
                          'https://cdn.pixabay.com/photo/2012/04/12/22/25/warning-sign-30915_960_720.png',
                          width: 50.0,
                          height: 50.0,
                        ),
                        SizedBox(height: 10),
                        Text(
                          '¿Seguro que quires reiniciar el contador a 0?',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    title: Text(
                      'SEGURO?',
                      style: TextStyle(color: Colors.red),
                    ),
                    backgroundColor: Colors.black,
                    // content: Text(
                    //   '¿Seguro que quires reiniciar el contador a 0?',
                    //   style: TextStyle(color: Colors.white),
                    // ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            _contar = 0;
                          });
                        },
                        child: Icon(
                          Icons.check,
                          color: Colors.green,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(Icons.close, color: Colors.red),
                      ),
                    ],
                  );
                });
          },
          tooltip: 'el contador en 0',
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            setState(() {
              _contar = _contar + 1;
              if (_contar == 20) {
                _contar = 0;
              }
            });
          },
          tooltip: 'Incrementa el contador',
        ),
      ],
    );
  }
}
