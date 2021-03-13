import 'package:flutter/material.dart';

class SelectCity extends StatefulWidget {
  @override
  _SelectCityState createState() => _SelectCityState();
}

final _textController = TextEditingController();

class _SelectCityState extends State<SelectCity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Şehir Seçiniz."),
      ),
      body: Form(
          child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: _textController,
                decoration: InputDecoration(
                    labelText: 'Şehir',
                    hintText: 'Sehir giriniz',
                    border: OutlineInputBorder()),
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.pop(context, _textController.text);
            },
          )
        ],
      )),
    );
  }
}
