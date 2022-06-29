import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MaterialApp(
    home: DivideConta(),
  ));
}

class DivideConta extends StatefulWidget {
  const DivideConta({Key? key}) : super(key: key);

  @override
  _DivideContaState createState() => _DivideContaState();
}

class _DivideContaState extends State<DivideConta> {
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _infoValores = "Informe os valores!";

  TextEditingController valorTotal = TextEditingController();

  TextEditingController quantidadePessoas = TextEditingController();

  TextEditingController porcentagemGorjeta = TextEditingController();

  String _infoGorjeta = "Valor da gorjeta";

  String _infoTotalPessoas = "Valor por pessoa";

  String _infoTotalValores = "Valor total";

  void _resetFields() {
    setState(() {
      valorTotal.text = "";

      quantidadePessoas.text = "";

      porcentagemGorjeta.text = "";

      _infoValores = "Informe os valores";

      _infoGorjeta = "Valor da gorjeta";

      _infoTotalPessoas = "Valor por pessoa";

      _infoTotalValores = "Valor total";
    });
  }

  void _calculate() {
    setState(() {
      double vlrTotal = double.parse(valorTotal.text);

      double qtdPessoas = double.parse(quantidadePessoas.text);

      double prctGorjeta = double.parse(porcentagemGorjeta.text);

      double valorGorjeta = vlrTotal * (prctGorjeta / 100);

      double totalMaisGorjeta = valorGorjeta + vlrTotal;

      double totalPorPessoas = totalMaisGorjeta / qtdPessoas;

      _infoGorjeta = "O valor da gorjeta é ${valorGorjeta.toStringAsFixed(2)}";

      _infoTotalPessoas =
          "O valor por pessoa é ${totalPorPessoas.toStringAsFixed(2)}";

      _infoTotalValores =
          "O valor total é ${totalMaisGorjeta.toStringAsFixed(2)}";
    });
  }

  void clearFields() {
    valorTotal.clear();
    quantidadePessoas.clear();
    porcentagemGorjeta.clear();
    setState(() {
      _infoValores = "";
      _infoGorjeta = "";
      _infoTotalPessoas = "";
      _infoTotalValores = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora de Média"),
          centerTitle: true,
          backgroundColor: Colors.lightBlue,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                _resetFields();
              },
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    _infoValores,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 20.0,
                    ),
                  ),
                  const Divider(),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Insira o valor da conta",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder()),
                    style: const TextStyle(color: Colors.black, fontSize: 25.0),
                    controller: valorTotal,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira o valor da conta";
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Insira a quantidade de pessoas",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder()),
                    style: const TextStyle(color: Colors.black, fontSize: 25.0),
                    controller: quantidadePessoas,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira a quantidade de pessoas";
                      }
                      return null;
                    },
                  ),
                  const Divider(),
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        labelText: "Insira a porcentagem para a gorjeta",
                        labelStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        border: OutlineInputBorder()),
                    style: const TextStyle(color: Colors.black, fontSize: 25.0),
                    controller: porcentagemGorjeta,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Insira a porcentagem para a gorjeta";
                      }
                      return null;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: SizedBox(
                      height: 50.0,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formkey.currentState!.validate()) {
                            _calculate();
                          }
                        },
                        child: const Text(
                          "Calcular",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                        //child: Colors.amber,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: clearFields,
                  ),
                    child: const Text(
                      "Limpar",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  Text(
                    _infoGorjeta,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    _infoTotalPessoas,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 20.0,
                    ),
                  ),
                  Text(
                    _infoTotalValores,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
             ),
          ),
        );
  }
}
