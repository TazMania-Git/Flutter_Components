import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key? key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sliders"),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50),
        child: Column(
          children: [
            _crearSlider(),
            _crearCheckBox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      divisions: 20,
      label: _valorSlider.toString(),
      value: _valorSlider,
      min: 0,
      max: 400,
      onChanged: (_bloquearCheck)
          ? null
          : (valor) {
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  Widget _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://www.clipartkey.com/mpngs/m/218-2183556_cypress-hill-logo-png.png'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  Widget _crearCheckBox() {
    // return Checkbox(
    //     value: _bloquearCheck,
    //     onChanged: (isCheck) {
    //       setState(() {
    //         if (isCheck != null) _bloquearCheck = isCheck;
    //       });
    //     });

    return CheckboxListTile(
        value: _bloquearCheck,
        title: Text("Bloquear Slider"),
        onChanged: (isCheck) {
          setState(() {
            if (isCheck != null) _bloquearCheck = isCheck;
          });
        });
  }

 Widget _crearSwitch() {

       return SwitchListTile(
        value: _bloquearCheck,
        title: Text("Bloquear Slider"),
        onChanged: (isCheck) {
          setState(() {
            if (isCheck != null) _bloquearCheck = isCheck;
          });
        });


 }
}
