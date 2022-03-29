import 'package:flutter/material.dart';
import 'package:graphql_prueba/src/home/data/repository.dart';
import 'package:graphql_prueba/src/home/data/repository_impl.dart';
import 'package:graphql_prueba/src/model/data_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Repository repository = RepositoryImpl();

  List<Question> questions = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Query example',
          style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.white,
              ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          questions = await repository.consulta('es');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: questions.isNotEmpty
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  for (final consulta in questions) {
                    return ListTile(
                      title: Text(consulta.question ?? ''),
                      subtitle: Text(consulta.answer ?? ''),
                    );
                  }
                  return const SizedBox.shrink();
                },
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tap en el boton para consultar datos',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator.adaptive(),
                  ),
                ],
              ),
      ),
    );
  }
}
