class BooksModel {
  final int flag;
  final List<books> booksL;

  BooksModel({this.flag , this.booksL});

  factory BooksModel.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['books'] as List;
    print(list.runtimeType);
    List<books> bookList = list.map((i) => books.fromJson(i)).toList();


    return BooksModel(
        flag: parsedJson['flag'],
        booksL: bookList

    );
  }
}

class books {
  final String id;
  final String book_name;
  final String book_writer;
  final String book_desc;
  final String book_image;
  final String book_r;
  final String book_d;
  final String u_id;

  books({this.id, this.book_name , this.book_writer , this.book_desc , this.book_image , this.book_r,this.book_d , this.u_id});

  factory books.fromJson(Map<String, dynamic> parsedJson){
    return books(
        id:parsedJson['id'],
        book_name:parsedJson['book_name'],
        book_writer:parsedJson['book_writer'],
        book_desc:parsedJson['book_desc'],
        book_d:parsedJson['book_d'],
        book_r:parsedJson['book_r'],
        u_id:parsedJson['u_id'],
        book_image: parsedJson['book_image']
    );
  }
}