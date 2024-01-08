class MahsulotFields {
  static const String id = 'id';
  static const String nomi = 'nomi';
  static const String category = 'category';
  static const String narx = 'narx';

  static final List<String> values = [
    id,nomi,category,narx
  ];


  static const String tableName = 'mahsulot';
}

class Mahsulot {
  final int id;
  final String nomi;
  final String category;
  final int narx;

  Mahsulot(
      {
        required this.id,
      required this.category,
      required this.narx,
      required this.nomi});

  Mahsulot copyWith({
    int? id,
    String? nomi,
    String? category,
    int? narx,
  }) =>
      Mahsulot(
        id: id ?? this.id,
        category: category ?? this.category,
        narx: narx ?? this.narx,
        nomi: nomi ?? this.nomi,
      );

  factory Mahsulot.fromJson(Map<String, dynamic> json) {
    return Mahsulot(
      id: json['id'],
      category: json['category'],
      narx: json['narx'],
      nomi: json['nomi'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      MahsulotFields.id: id,
      MahsulotFields.nomi: nomi,
      MahsulotFields.category: category,
      MahsulotFields.narx: narx,
    };
  }
}
