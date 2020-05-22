import 'package:flutter/material.dart';
import 'package:mobx_mvc/controllers/signup.controller.dart';
import 'package:mobx_mvc/view-models/signup.viewmodel.dart';
import 'package:mobx_mvc/views/android/home/home.view.dart';

class SignupView extends StatefulWidget {
  @override
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final _formKey = GlobalKey<FormState>();

  final _controller = SignupController();

  var model = SignupViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(40),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text('Cadastre-se'),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Preencha seu email';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  model.email = newValue;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Preencha seu nome';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  model.name = newValue;
                },
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 16),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Preencha sua senha';
                  }
                  return null;
                },
                onSaved: (newValue) {
                  model.password = newValue;
                },
              ),
              SizedBox(
                height: 20,
              ),
              model.busy
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : FlatButton(
                      color: Theme.of(context).primaryColor,
                      child: Text(
                        "Cadastrar",
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _formKey.currentState.save();
                        }
                        print(model.name);
                        print(model.email);
                        print(model.password);

                        setState(() {
                          _controller.create(model).then((value) {
                            setState(() {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                builder: (context) => HomeView(),
                              ));
                            });
                          });
                        });
                      },
                    ),
            ],
          ),
        ),
      )),
    );
  }
}
