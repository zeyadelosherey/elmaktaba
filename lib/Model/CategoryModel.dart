import 'dart:core';
class CategoryModel {
  final int flag;
  final List<Category> Categories;

  CategoryModel({this.flag , this.Categories});


  factory CategoryModel.fromJson(Map<String, dynamic> parsedJson){

    var list = parsedJson['Category'] as List;
    print(list.runtimeType);

    List<Category> CategoryList = list.map((i) => Category.fromJson(i)).toList();

    return CategoryModel(
        flag: parsedJson['flag'],
        Categories: CategoryList

    );
  }
}

class Category {
  final String id;
  final String cat_name;
  final String cat_image;

  Category({this.id, this.cat_name , this.cat_image});

  factory Category.fromJson(Map<String, dynamic> parsedJson){
    return Category(
        id:parsedJson['id'],
        cat_name:parsedJson['cat_name'],
        cat_image:parsedJson['cat_image']
    );
  }
}