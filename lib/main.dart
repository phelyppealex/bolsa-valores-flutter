import 'package:connectivity_plus/connectivity_plus.dart';

import 'widgets/cards_moeda.dart';
import 'widgets/card_moeda_item.dart';
import 'widgets/cards_bolsa.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: const HomeMaterial(),
    );
  }
}

// HOME MATERIAL

class HomeMaterial extends StatefulWidget {
  const HomeMaterial({super.key});

  @override
  State<HomeMaterial> createState() => _HomeMaterialState();
}

// HOME MATERIAL STATE

class _HomeMaterialState extends State<HomeMaterial> {
  late Future<Map<String, dynamic>> dadosCotacoes;

  @override
  void initState() {
    super.initState();
    dadosCotacoes = getDadosCotacoes();
  }

  Future<Map<String, dynamic>> getDadosCotacoes() async {
    final connectivityResult = await Connectivity().checkConnectivity();

    try {
      if(!(connectivityResult == ConnectivityResult.none)){
        final res = await http.get(
          Uri.parse(
            'http://api.hgbrasil.com/finance/quotations?key=03f48f0c',
          ),
        );

        if (res.statusCode != HttpStatus.ok) {
          throw 'Erro de conexão';
        }

        final data = jsonDecode(res.body);

        return data;
      }else{
        throw "Sem conexão à internet";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Cotações Brasil',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                dadosCotacoes = getDadosCotacoes();
              });
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: dadosCotacoes,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro: ${snapshot.error}'),
            );
          }

          final data = snapshot.data!;
          final dollar = data["results"]["currencies"]["USD"];
          final moedas = data["results"]["currencies"].values.toList();
          final bolsas = data["results"]["stocks"].values.toList();
          
          moedas.removeAt(0);
          moedas.removeAt(0);

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // main card
              Center(
                child: CardMoedaItem(
                  nome: '${dollar["name"]}',
                  valorMoeda: '${dollar["buy"]}',
                  variacaoMoeda: '${dollar["variation"]}'
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Outras moedas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              CardsMoeda(moedas: moedas),
              const SizedBox(height: 20),
              const Text(
                'Bolsa de Valores',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Expanded(
                child: CardsBolsa(bolsas: bolsas)
              ),
            ],
          );
        }
      ),
    );
  }
}