import 'package:flutter/material.dart';

import '../themes/themes_colors.dart';

erroDialog({
  required BuildContext context,
  required String mensagem,
}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Erro!'),
      content: SizedBox(
        height: 100,
        child: Center(child: Text(mensagem)),
      ),
      icon: const Icon(Icons.warning_amber_rounded, size: 64),
      iconColor: ThemesColors.red,
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, "Ok"),
          child: const Text('Fechar'),
        ),
      ],
    ),
  );
}
