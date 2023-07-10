import 'package:app_livraria_flutter/models/livro.dart';
import 'package:app_livraria_flutter/pages/novo_livro.dart';
import 'package:app_livraria_flutter/themes/themes_colors.dart';
import 'package:flutter/material.dart';

import '../services/livro_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LivroService service = LivroService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de livros"),
      ),
      body: StreamBuilder(
        stream: Stream.fromFuture(service.getAll()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return SingleChildScrollView(
              child: Center(
                child: Text("Erro: ${snapshot.error}"),
              ),
            );
          } else {
            List<Livro>? lista = snapshot.data;

            if (lista != null && lista.isNotEmpty) {
              return CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Column(
                          children: [
                            ListTile(
                              title: Text(lista[index].titulo),
                              subtitle: Text(lista[index].autor),
                              onTap: () {},
                            ),
                            const Divider(),
                          ],
                        );
                      },
                      childCount: lista.length,
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: SizedBox(height: 80),
                  ),
                ],
              );
            } else {
              return const Center(
                child: Text("Lista vazia"),
              );
            }
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NovoLivro()),
          );
        },
        backgroundColor: ThemesColors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        child: const Icon(Icons.add, color: ThemesColors.white, size: 32),
      ),
    );
  }
}
