import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aruka_reg/bloc/auth_bloc_bloc.dart';
import 'package:flutter_aruka_reg/generated/locale_keys.g.dart';
import 'package:flutter_aruka_reg/user.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistrationForm extends StatefulWidget {
  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  final AuthBlocBloc _authBloc = AuthBlocBloc();

  final List<String> countries = [
    'Kazakhstan',
    'Russia',
    'Korea',
    'Japan',
    'USA'
  ];

  String fullName = '';
  String phoneNumber = '';
  String email = '';
  String country = 'Korea';
  String aboutMe = '';
  String password = '';
  String confirmPassword = '';

  User newUser = User(
    fullName: '',
    phoneNumber: '',
    email: '',
    country: 'Korea',
    aboutMe: '',
    password: '',
  );

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      newUser = User(
        fullName: fullName,
        phoneNumber: phoneNumber,
        email: email,
        country: country,
        aboutMe: aboutMe,
        password: password,
      );
      _authBloc.add(SubmitRegistrationForm(newUser));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Registration Form'),
      ),
      body: BlocProvider<AuthBlocBloc>(
        create: (context) => _authBloc,
        child: BlocListener<AuthBlocBloc, AuthBlocState>(
          listener: (context, state) {
            if (state is SuccessState) {
              Navigator.pushNamed(context, '/user_table', arguments: newUser);
            } else if (state is ErrorState) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ошибка: ${state.errorMessage}'),
                ),
              );
            }
          },
          child: BlocBuilder<AuthBlocBloc, AuthBlocState>(
            builder: (context, state) {
              return Padding(
                padding: EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: LocaleKeys.dataname.tr()),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            fullName = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: LocaleKeys.dataphone.tr()),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your phone number';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            phoneNumber = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(labelText: 'Email'),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter your email address';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            email = value;
                          });
                        },
                      ),
                      DropdownButtonFormField(
                        value: country,
                        onChanged: (value) {
                          setState(() {
                            country = value.toString();
                          });
                        },
                        items: countries.map((country) {
                          return DropdownMenuItem(
                            value: country,
                            child: Text(country),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                            labelText: LocaleKeys.datacountry.tr()),
                      ),
                      TextFormField(
                        decoration:
                            InputDecoration(labelText: LocaleKeys.datame.tr()),
                        onChanged: (value) {
                          setState(() {
                            aboutMe = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: LocaleKeys.datapassword.tr()),
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            password = value;
                          });
                        },
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            labelText: LocaleKeys.datapassword2.tr()),
                        obscureText: true,
                        validator: (value) {
                          if (value != password) {
                            return 'Passwords do not match';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            confirmPassword = value;
                          });
                        },
                      ),
                      ElevatedButton(
                        onPressed: () {
                          _submitForm();
                        },
                        child: Text(LocaleKeys.registration.tr()),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.setLocale(Locale('en'));
                        },
                        child: const Text('English'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.setLocale(Locale('kk'));
                        },
                        child: const Text('Казахский'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          context.setLocale(Locale('ru'));
                        },
                        child: const Text('Русский'),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
