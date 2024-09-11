import 'dart:math';
import 'package:meta/meta.dart';

double _DoubleInRange(Random source, num start, num end) => source.nextDouble() * (end - start) + start;

final random = Random();

final coffeess = List.generate(
  _name.length,
  (index) => Coffee(
    image: 'assets/${index + 1}.png',
    price: _DoubleInRange(random, 3, 8),
    name: _name[index],
  ),
);

class Coffee {
  Coffee({required this.name, required this.image, required this.price});

  final String name;
  final String image;
  final double price;
}

final _name = [
  'name 1',
  'name 2',
  'name 3',
  'name 4',
  'name 5',
  'name 6',
  'name 7',
  'name 8',
  
];
