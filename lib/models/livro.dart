class Livro {
  Livro({
    required this.id,
    required this.titulo,
    required this.autor,
    required this.editora,
    required this.preco,
    required this.numeroPaginas,
  });
  String id;
  String titulo;
  String autor;
  String editora;
  double preco;
  int numeroPaginas;

  Livro.vazio()
      : id = "",
        titulo = "",
        autor = "",
        editora = "",
        preco = 0,
        numeroPaginas = 0;

  Livro.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        titulo = map["titulo"],
        autor = map["autor"],
        editora = map["editora"],
        preco = map["preco"],
        numeroPaginas = map["numeroPaginas"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "titulo": titulo,
      "autor": autor,
      "editora": editora,
      "preco": preco,
      "numeroPaginas": numeroPaginas,
    };
  }

  @override
  String toString() {
    return "id: $id \ntitulo:$titulo \nautor: $autor \neditora:$editora \npreco: $preco \nnumeroPaginas: $numeroPaginas";
  }
}
