import 'package:flutter/material.dart';

class CreateChildPage extends StatefulWidget {
  const CreateChildPage({super.key});

  @override
  _CreateChildPageState createState() => _CreateChildPageState();
}

class _CreateChildPageState extends State<CreateChildPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _ageGroup = '0-2';
  String _gender = 'Masculino';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastrar Filho'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira o nome';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              const SizedBox(height: 20),
              const Text('Faixa Etária'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildCircularButton('0-2', _ageGroup),
                  const SizedBox(width: 10),
                  _buildCircularButton('2-5', _ageGroup),
                  const SizedBox(width: 10),
                  _buildCircularButton('5-8', _ageGroup),
                  const SizedBox(width: 10),
                  _buildCircularButton('8+', _ageGroup),
                ],
              ),
              const SizedBox(height: 20),
              const Text('Sexo'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _buildCircularButton('Masculino', _gender),
                  const SizedBox(width: 10),
                  _buildCircularButton('Feminino', _gender),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // Process the data
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Filho cadastrado com sucesso!')),
                    );
                  }
                },
                child: const Text('Cadastrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCircularButton(String value, String groupValue) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (groupValue == _ageGroup) {
            _ageGroup = value;
          } else {
            _gender = value;
          }
        });
      },
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: (value == groupValue) ? Colors.blue : Colors.grey,
        ),
        child: Center(
          child: Text(
            value,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
