import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController etInput = new TextEditingController();
  var listItem = [
    "Kelvin",
    "Reamur"
  ];
  List<String> listHasil = [];
  double _inputUser = 0;
  String _newValue = "Kelvin";
  double _result = 0;

  void perhitunganSuhu() {
    setState(() {
      _inputUser = double.parse(etInput.text);
      if (_newValue == "Kelvin")
      _result = _inputUser + 273;
      
      else
      _result = (4 / 5) * _inputUser;
      });
    listHasil.add(_newValue + " : "+ _result.toString());
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Konversi Suhu List"),
        ),
        body: Container(
          margin: EdgeInsets.all(8),
          child: Column(
            children: [
              inputsuhu(etInput: etInput),
              DropdownButton<String>(
                items:
                  listItem.map((String value){
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                value: _newValue,
                onChanged: (changeValue) {
                  setState(() {
                    _newValue = changeValue.toString();
                  });
                },
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 15.0),
                child: Column(
                  children: [
                    Text("Hasil",
                    style: TextStyle(fontSize: 20),
                    ),
                    Text('$_result',
                    style: TextStyle(fontSize: 35),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                    onPressed: perhitunganSuhu,
                    child: Text("Konversi Suhu")
                  ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 10, bottom: 10),
                child: Text("Riwayat Konversi", style: TextStyle(fontSize: 20),),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: listHasil.length,
                  itemBuilder: (context, index) {
                  return Text(listHasil[index]);
                  }
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class inputsuhu extends StatelessWidget {
  const inputsuhu({
    Key? key,
    required this.etInput,
  }) : super(key: key);

  final TextEditingController etInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(hintText: "Masukkan Nilai Suhu",
      label: Text("Celcius")),
      //untuk membuat tipe keyboard yang angka saja
      keyboardType: TextInputType.number,
      //untuk memasukkan digit saja
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      controller: etInput,
    );
  }
}