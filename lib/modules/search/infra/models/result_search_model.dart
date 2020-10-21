import 'dart:convert';

import 'package:Clean_Dart/modules/search/domain/entities/result_search.dart';

class ResultSearchModel extends ResultSearch {
  
  final String title;
  final String content;
  final String img;

  ResultSearchModel({this.title, this.content, this.img});


  Map<String, dynamic> toMap() {
    return {
      'titulo': title,
      'content': content,
      'img': img,
    };
  }

  factory ResultSearchModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;
  
    return ResultSearchModel(
      title: map['titulo'],
      content: map['content'],
      img: map['img'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ResultSearchModel.fromJson(String source) => ResultSearchModel.fromMap(json.decode(source));
}
