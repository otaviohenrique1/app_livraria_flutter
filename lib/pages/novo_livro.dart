import 'dart:io';

import 'package:app_livraria_flutter/components/botao.dart';
import 'package:app_livraria_flutter/components/erro_dialog.dart';
import 'package:app_livraria_flutter/models/livro.dart';
import 'package:app_livraria_flutter/services/livro_service.dart';
import 'package:app_livraria_flutter/themes/themes_colors.dart';
import 'package:app_livraria_flutter/utils/validator.dart';
import 'package:flutter/material.dart';

import '../components/campo_texto.dart';

class NovoLivro extends StatefulWidget {
  const NovoLivro({super.key});

  @override
  State<NovoLivro> createState() => _NovoLivroState();
}

class _NovoLivroState extends State<NovoLivro> {
  var formKey = GlobalKey<FormState>();
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _autorController = TextEditingController();
  final TextEditingController _editoraController = TextEditingController();
  final TextEditingController _precoController = TextEditingController();
  final TextEditingController _numeroPaginasController =
      TextEditingController();

  @override
  void dispose() {
    _tituloController.dispose();
    _autorController.dispose();
    _editoraController.dispose();
    _precoController.dispose();
    _numeroPaginasController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Novo livro"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 22),
                      child: CampoTexto(
                        controller: _tituloController,
                        hintText: "Titulo",
                        validator: validaCampoVazio,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: CampoTexto(
                        controller: _autorController,
                        hintText: "Autor",
                        validator: validaCampoVazio,
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    CampoTexto(
                      controller: _editoraController,
                      hintText: "Editora",
                      validator: validaCampoVazio,
                      keyboardType: TextInputType.text,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: CampoTexto(
                        controller: _precoController,
                        hintText: "Preço",
                        validator: validaCampoVazio,
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    CampoTexto(
                      controller: _numeroPaginasController,
                      hintText: "Numero de paginas",
                      validator: validaCampoVazio,
                      keyboardType: TextInputType.number,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Botao(
                        onPressed: onSubmit,
                        label: "Salvar",
                        fontColor: Colors.white,
                        backgroundColor: ThemesColors.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onSubmit() {
    if (formKey.currentState!.validate()) {
      LivroService service = LivroService();

      String titulo = _tituloController.text;
      String autor = _autorController.text;
      String editora = _editoraController.text;
      double preco = double.parse(_precoController.text);
      int numeroPaginas = int.parse(_numeroPaginasController.text);

      Livro livro = Livro(
          id: "",
          titulo: titulo,
          autor: autor,
          editora: editora,
          preco: preco,
          numeroPaginas: numeroPaginas);

      service.register(livro).then((value) {
        if (value) {
          Navigator.pop(context);
        }
      }).catchError(
        (error) {
          var innerError = error as HttpException;
          erroDialog(
            context: context,
            mensagem: innerError.message,
          );
        },
        test: (error) => error is HttpException,
      );
    }
  }
}
