abstract class CrudOBject{}

abstract class CrudService{

 late final String prefix;
   final String tableMahsulotSer;
  CrudService(this.tableMahsulotSer,{this.prefix=''});

  //bazadagi mahsulotlarni sorov boyicha va  barchasini olib kelish
  Future<Map<dynamic,dynamic>> select ({String? where});

  //bazadagi mahsulotni IDsi boyicha olib kelish
  Future<Map> selectId(int id,{String? where});

  //bazaga mahsulot qoshish uchun funksiya
  Future<int> insert(Map map);

  //bazaga mahsulot qo'shayotganda xar xil belgilarni olib tashlash uchun funcsiya
  Future<void> replace (Map map);

  //bazadan mahsulot o'chirib tashlash uchun funksiya
  Future<void> delete({String? where});

  //mahsulotni IDsi bo'yicha o'chirish
  Future<void> deleteId(int id,{String? where});

  //bazadagi  bor malumotga o'zgartirish uchun funksiya
  Future<void> update (Map map,{String? where});

  //bazadagi mahsulotlarni sonini aniqlash
  Future<int> count ({String? where});

  // ? ? ? ? ?
  Future<int> newId();



}