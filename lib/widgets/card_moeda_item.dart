import 'package:flutter/material.dart';

class CardMoedaItem extends StatelessWidget {

  final String nome, valorMoeda, variacaoMoeda;

  const CardMoedaItem({
    super.key,
    required this.nome,
    required this.valorMoeda,
    required this.variacaoMoeda,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              nome,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              valorMoeda,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 8),
            Text(variacaoMoeda),
          ],
        ),
      ),
    );
  }
}