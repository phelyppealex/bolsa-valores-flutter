import 'package:flutter/material.dart';
import 'package:cotacoes_app/widgets/card_moeda_item.dart';

class CardsMoeda extends StatelessWidget {
  const CardsMoeda({
    super.key,
    required this.moedas,
  });

  final moedas;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: moedas.length,
      itemBuilder: (context, index){
        return CardMoedaItem(
          nome: '${moedas[index]["name"]}',
          valorMoeda: '${moedas[index]["buy"]}',
          variacaoMoeda: '${moedas[index]["variation"]}',
        );
      }
    );
  }
}