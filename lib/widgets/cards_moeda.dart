import 'package:flutter/material.dart';
import 'package:cotacoes_app/widgets/card_moeda_item.dart';

class CardsMoeda extends StatelessWidget {
  final dynamic moedas;

  const CardsMoeda({
    super.key,
    required this.moedas,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: moedas.length,
        // physics: const ClampingScrollPhysics(),
        itemBuilder: (context, index){
          return CardMoedaItem(
            nome: '${moedas[index]["name"]}',
            valorMoeda: '${moedas[index]["buy"]}',
            variacaoMoeda: '${moedas[index]["variation"]}',
          );
        }
      ),
    );
  }
}