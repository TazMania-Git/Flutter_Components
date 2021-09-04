import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Mostrar Alerta"),
          onPressed: () => _mostrarAlerta(context),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            shape: StadiumBorder(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_location),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  void _mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            title: Text("Este es el título"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("El contenido"),
                FlutterLogo(size: 100,)
              ],
            ),
            actions: <Widget>[
              TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Cancelar")),
              TextButton(onPressed: (){Navigator.of(context).pop();}, child: Text("Ok"))
            ],

            );
            

      },
    );
  }
}
