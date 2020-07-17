import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final _form = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void salvarUsuario() {
    if (!_form.currentState.validate()) {
      _scaffoldKey.currentState
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            duration: Duration(
              seconds: 2,
            ),
            content: Text(
              'Dados inválidos!',
              style: TextStyle(fontSize: 18),
            ),
            backgroundColor: Colors.red,
          ),
        );

      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Cadastro de Usuário'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    labelStyle: TextStyle(color: Colors.teal),
                    labelText: 'Nome completo',
                  ),
                  validator: (valor) {
                    if (valor.length < 3) return 'Nome muito curto';
                    if (valor.length > 30) return 'Nome muito longo';
                    return null;
                  },
                ),
                SizedBox(height: 15),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    labelStyle: TextStyle(color: Colors.teal),
                    labelText: 'Idade',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (valor) {
                    if ((int.tryParse(valor) ?? 0) <= 0)
                      return 'Idade Inválida';
                    return null;
                  },
                ),
                SizedBox(height: 15),
                // textfield do email
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal),
                    ),
                    labelStyle: TextStyle(color: Colors.teal),
                    labelText: 'E-mail',
                  ),
                ),
                Container(
                  width: double.maxFinite,
                  child: OutlineButton(
                    onPressed: salvarUsuario,
                    child: Text(
                      'Salvar',
                      style: TextStyle(fontSize: 18),
                    ),
                    textColor: Colors.teal,
                    borderSide: BorderSide(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://www.gravatar.com/avatar/$index?d=robohash'),
              ),
            );
          },
        ),
      ),
    );
  }
}
