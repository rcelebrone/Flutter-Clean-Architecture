import 'package:Clean_Dart/modules/search/presenter/search/search_page.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:Clean_Dart/modules/search/domain/usecases/search_by_text_imp.dart';
import 'package:Clean_Dart/modules/search/external/datasources/github_datasource_imp.dart';
import 'package:Clean_Dart/modules/search/infra/repositories/search_repository_imp.dart';

import 'app_widget.dart';
import 'modules/search/presenter/search/search_bloc_imp.dart';

class AppModule extends MainModule {

  @override
  List<Bind> get binds => [
    Bind((i) => Dio()),
    Bind((i) => GitHubDatasourceImp(i())),
    Bind((i) => SearchRepositoryImp(i())),
    Bind((i) => SearchByTextImp(i())),
    Bind((i) => SearchBlocImp(i()))
  ];

  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
    ModularRouter('/', child: (_, __) => SearchPage())
  ];

}