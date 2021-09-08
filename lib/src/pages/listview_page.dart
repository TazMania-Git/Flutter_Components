import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  ScrollController _scrollController = new ScrollController();

  List<int> _listaNumeros = [];
  int _ultimoItem = 0;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();

    _agregarDiez();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent)
        // _agregarDiez();
        fetchData();
    });
  }

  @override
  //LO QUE HACE DISPOSE ES BORRAR EL LISTENER PARA QUE CUANDO ENTREMOS DE NUEVO EN LA PAGE NO SE CARGUE UNO NUEVO
  //Y NO SE VAYAN ACUMULANDO LOS LISTENERS
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Listas"),
        ),
        body: Stack(
          children: [
            _crearListas(),
            _crearLoading(),
          ],
        ));
  }

  Widget _crearListas() {
    return RefreshIndicator(
      onRefresh: obtenerNewData,
      child: ListView.builder(
        controller: _scrollController,
        itemCount: _listaNumeros.length,
        itemBuilder: (BuildContext context, int index) {
          final imagen = _listaNumeros[index];
          return FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image:
                  NetworkImage("https://picsum.photos/500/300?random=$imagen"));
        },
      ),
    );
  }

  Future<Null> obtenerNewData() async {
    final duracion = new Duration(seconds: 2);
    new Timer(duracion, () {
      _listaNumeros.clear();
      _ultimoItem++;
      _agregarDiez();
    });

    return Future.delayed(duracion);
  }

  void _agregarDiez() {
    for (var i = 0; i < 10; i++) {
      _ultimoItem++;
      _listaNumeros.add(_ultimoItem);
    }
    setState(() {});
  }

  Future fetchData() async {
    _isLoading = true;
    setState(() {});
    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestaHttp);
  }

  void respuestaHttp() {
    _isLoading = false;

    _scrollController.animateTo(
      _scrollController.position.pixels + 100,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 250),
    );

    _agregarDiez();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [CircularProgressIndicator()],
          ),
          SizedBox(
            height: 15,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
