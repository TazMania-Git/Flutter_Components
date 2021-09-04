import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nombre = '';
  String _email = '';
  String _fecha = '';
  final TextEditingController _inputFieldController = new TextEditingController();
  final List<String> _poderes = ['Fuerza','Velocidad','Super Aliento','Volar'];
  String _opcionSeleccionada = 'Volar';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inputs"),
      ),
                body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        children: [
          _crearInputs(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
                    Divider(),
           _crearDropDown(),
          Divider(),
          _crearUsuario(),
        

        ],
      ),
    );
  }

  Widget _crearInputs() {
    return TextField(
      // autofocus: true,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        counter: Text("Letras ${_nombre.length}"),
        hintText: "Nombre de la persona",
        labelText: "Nombre",
        helperText: "Solo va el nombre",
        suffixIcon: Icon(Icons.accessibility),
        icon: Icon(Icons.account_circle),
      ),
      onChanged: (valor) {
        setState(() {
          _nombre = valor;
        });
      },
    );
  }

  Widget _crearUsuario() {
    return ListTile(
      title: Text("Nombre es : $_nombre"),
      subtitle: Text("Email es : $_email"),
      trailing: Text(_opcionSeleccionada),
    );
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: "Email",
          labelText: "Email",
          suffixIcon: Icon(Icons.alternate_email),
          icon: Icon(Icons.email),
        ),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: "Password",
          labelText: "Password",
          suffixIcon: Icon(Icons.lock_open),
          icon: Icon(Icons.lock),
        ),
        onChanged: (valor) => setState(() {
              _email = valor;
            }));
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldController,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        hintText: "Fecha de nacimiento",
        labelText: "Fecha de nacimiento",
        suffixIcon: Icon(Icons.perm_contact_calendar),
        icon: Icon(Icons.calendar_today),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _selectDay(context);
      },
    );
  }

  _selectDay(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025)
        locale: Locale('es','ES'),
        );

    if (picked != null) {
      _fecha = picked.toString();
      _inputFieldController.text = _fecha;
    }
  }

List<DropdownMenuItem<String>> getOpcionesDropDown(){

List<DropdownMenuItem<String>> lista =  [];

_poderes.forEach((poder) {

lista.add(DropdownMenuItem(
child: Text(poder),
value: poder,
));

 });
return lista;
}

 Widget _crearDropDown() {
   return Row(
     children:[
      Icon(Icons.select_all),
      SizedBox(width:30,),
      Expanded(child: DropdownButton(
         value: _opcionSeleccionada,
         items: getOpcionesDropDown(),
         onChanged: (opt){setState(() {
         _opcionSeleccionada = opt.toString();
    }
    );
    },
     ) ,
      )
       
     ],
   ); 
 }


}