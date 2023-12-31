import 'package:flutter/material.dart';
import 'card_bolsa_item.dart';

class CardsBolsa extends StatelessWidget {
  final dynamic bolsas;

  const CardsBolsa({
    super.key,
    required this.bolsas,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: bolsas.length,
      itemBuilder: (context, index){
        return CardBolsaItem(
          nome: '${bolsas[index]["name"]}',
          localizacao: '${bolsas[index]["location"]}',
          modificacao: '${bolsas[index]["variation"]}'
        );
      },
    );
  }
}