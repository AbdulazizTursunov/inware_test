
import 'package:flutter/material.dart';
import 'package:inware_test/data/model/mahsulot_obekti.dart';

TextStyle sttyle =
const TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black);

//list
List itemsL = [
  'Naim',
  'Xo\'ja',
  'Alisher',
  'Azim',
  'Aziz',
  'Oybek',
  'Sroch',
  'Rasul',
  'Jasur',
  'Bobur',
  'Sarvar',
];



///  set
Set<String> itemsS = {'Kozim','Nozim','Mansur','Olim','Jasur','Ozod'};


///  map
List<String> nameValue = ['Ahmadillo','Usmonjon','Islomjon','Rustambek','Jomidin','Marufjon'];
List<int> idKey = [1,2,3,4,5,6];
Map<int, String> itemM = Map.fromIterables(idKey, nameValue);

///  mahsulotlar listi

List<Mahsulot> listProduct = [
  Mahsulot(id: 1, category: 'Texnika', narx: 250, nomi: 'Televizor'),
  Mahsulot(id: 2, category: 'Kiyim', narx: 35, nomi: 'Kurtka'),
  Mahsulot(id: 3, category: 'Texnika', narx: 300, nomi: 'kir Mashina'),
  Mahsulot(id: 4, category: 'Kiyim', narx: 40, nomi: 'Tufli'),
  Mahsulot(id: 5, category: 'Texnika', narx: 100, nomi: 'Changyutgich'),
  Mahsulot(id: 6, category: 'Texnika', narx: 400, nomi: 'Haladelnik'),
  Mahsulot(id: 7, category: 'Kiyim', narx: 400, nomi: 'kirasofka'),
  Mahsulot(id: 8, category: 'Texnika', narx: 50, nomi: 'Dazmol'),
  Mahsulot(id: 9, category: 'Texnika', narx: 100, nomi: 'Telefon'),
  Mahsulot(id: 10, category: 'Parfumeriya', narx: 20, nomi: 'Dove'),
];

///  Set mahsulotlar

Set<Mahsulot> setProduct = {
  Mahsulot(id: 1, category: 'Texnika', narx: 250, nomi: 'Televizor'),
  Mahsulot(id: 2, category: 'Kiyim', narx: 35, nomi: 'Kurtka'),
  Mahsulot(id: 3, category: 'Texnika', narx: 300, nomi: 'kir Mashina'),
  Mahsulot(id: 4, category: 'Kiyim', narx: 40, nomi: 'Tufli'),
  Mahsulot(id: 5, category: 'Texnika', narx: 100, nomi: 'Changyutgich'),
  Mahsulot(id: 6, category: 'Texnika', narx: 400, nomi: 'Haladelnik'),
  Mahsulot(id: 7, category: 'Kiyim', narx: 400, nomi: 'kirasofka'),
  Mahsulot(id: 8, category: 'Texnika', narx: 50, nomi: 'Dazmol'),
  Mahsulot(id: 9, category: 'Texnika', narx: 100, nomi: 'Telefon'),
  Mahsulot(id: 10, category: 'Parfumeriya', narx: 20, nomi: 'Dove'),
};

///  map mahsulotlar

Map<String,Mahsulot> mapProduct = {
  '1':  Mahsulot(id: 1, category: 'Texnika', narx: 250, nomi: 'Televizor'),
  '2': Mahsulot(id: 2, category: 'Kiyim', narx: 35, nomi: 'Kurtka'),
  '3': Mahsulot(id: 3, category: 'Texnika', narx: 300, nomi: 'kir Mashina'),
  '4': Mahsulot(id: 4, category: 'Kiyim', narx: 40, nomi: 'Tufli'),
  '5': Mahsulot(id: 5, category: 'Texnika', narx: 100, nomi: 'Changyutgich'),
  '6': Mahsulot(id: 6, category: 'Texnika', narx: 400, nomi: 'Haladelnik'),
  '7': Mahsulot(id: 7, category: 'Kiyim', narx: 400, nomi: 'kirasofka'),
  '8': Mahsulot(id: 8, category: 'Texnika', narx: 50, nomi: 'Dazmol'),
  '9': Mahsulot(id: 9, category: 'Texnika', narx: 100, nomi: 'Telefon'),
  '10': Mahsulot(id: 10, category: 'Parfumeriya', narx: 20, nomi: 'Dove'),
};
//
Mahsulot? mahsulot;


