// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> en = {
    "Hello": "Hi",
    "registration": "Registration",
    "dataname": "Please enter your full name",
    "dataphone": "Please enter your phone number",
    "datacountry": "Country",
    "datame": "Please write about you",
    "datapassword": "Please enter your password",
    "datapassword2": "Please enter your password",
  };
  static const Map<String, dynamic> kk = {
    "Hello": "Сәлем",
    "registration": "Тіркеу",
    "dataname": "Толық атыңызды енгізіңіз",
    "dataphone": "Телефон нөміріңізді енгізіңіз",
    "datacountry": "Ел",
    "datame": "Өзіңіз туралы жазыңыз",
    "datapassword": "Құпия сөзіңізді енгізіңіз",
    "datapassword2": "Құпия сөзіңізді енгізіңіз",
  };
  static const Map<String, dynamic> ru = {
    "Hello": "Привет",
    "registration": "Регистрация",
    "dataname": "Напишите свое Имя",
    "dataphone": "Напишите свой номер телефона",
    "datacountry": "Страна",
    "datame": "Расскажите о себе",
    "datapassword": "Впишите пароль",
    "datapassword2": "Впишите пароль",
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "en": en,
    "kk": kk,
    "ru": ru
  };
}
