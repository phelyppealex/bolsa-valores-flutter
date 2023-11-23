import 'package:flutter/material.dart';

class CardBolsaItem extends StatelessWidget {
  final String nome, localizacao, modificacao;

  const CardBolsaItem({
    super.key, required this.nome, required this.localizacao, required this.modificacao,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          nome,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Text(
          localizacao,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          modificacao,
          style: const TextStyle(
            fontSize: 12,
          ),
        )
      ],
    );
  }
}