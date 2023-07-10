import 'package:flutter/material.dart';

import '../themes/themes_colors.dart';

avisoDialog({
  required BuildContext context,
  required String mensagem,
}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('Aviso!'),
      content: SizedBox(
        height: 100,
        child: Center(child: Text(mensagem)),
      ),
      icon: const Icon(Icons.warning_amber_rounded, size: 64),
      iconColor: ThemesColors.red,
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.pop(context, false),
          child: const Text('Não'),
        ),
        TextButton(
          onPressed: () => Navigator.pop(context, true),
          child: const Text('Sim'),
        ),
      ],
    ),
  );
}
