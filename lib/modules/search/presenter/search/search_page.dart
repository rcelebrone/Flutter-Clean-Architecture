import 'package:Clean_Dart/modules/search/presenter/search/search_bloc_imp.dart';
import 'package:Clean_Dart/modules/search/presenter/search/states/search_state%20error_imp.dart';
import 'package:Clean_Dart/modules/search/presenter/search/states/search_state%20loading_imp.dart';
import 'package:Clean_Dart/modules/search/presenter/search/states/search_state%20start_imp.dart';
import 'package:Clean_Dart/modules/search/presenter/search/states/search_state%20success_imp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


  final bloc = Modular.get<SearchBlocImp>();

  @override
  void initState() {
    
    super.initState();
  }

  @override
  void dispose() {
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHub search')
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
          child: TextField(
            onChanged: bloc.add,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Search..."
            )
          )
        ),
        Expanded(
          child: StreamBuilder(
            stream: bloc,
            builder: (context, snapshop){

              final state = bloc.state;

              if(state is SearchStateStart)
                return Center(child: Text('Digite um texto'));

              if(state is SearchStateLoading)
                return CircularProgressIndicator();

              if(state is SearchStateError)
                return Center(child: Text('Ops! Algo deu ruim :('));

              final list = (state as SearchStateSuccess).list;

              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, id) => ListTile(
                  title: Text(list[id].title??"unknown"),
                  subtitle: Text(list[id].content??""),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(list[id].img??"https://img.pngio.com/rai-sport-hd-rai-sport-hd-logo-hd-png-download-1280x364-convex-png-no-background-320_400.png")
                  )
              ));
            },
          )
        )
      ])
    );
  }

}