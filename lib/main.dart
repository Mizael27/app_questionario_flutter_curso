import 'package:flutter/material.dart';
import './resultado.dart';
import './questionario.dart';

void main() => runApp(QuestionarioApp());

class _QuestionarioAppState extends State<QuestionarioApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;
  final List<Map<String, Object>> _questoes = const [
    {
      'texto': 'Qual é o seu time favorito?',
      'respostas': [
        {'texto': 'Vasco', 'pontuacao': 10},
        {'texto': 'Flamento', 'pontuacao': 5},
        {'texto': 'Botafogo', 'pontuacao': 3},
        {'texto': 'Fluminense', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é sua fruta favorita?',
      'respostas': [
        {'texto': 'Maca', 'pontuacao': 10},
        {'texto': 'Pera', 'pontuacao': 5},
        {'texto': 'Uva', 'pontuacao': 3},
        {'texto': 'Abacaxi', 'pontuacao': 1},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Leão', 'pontuacao': 10},
        {'texto': 'Cobra', 'pontuacao': 10},
        {'texto': 'Escorpião', 'pontuacao': 10},
        {'texto': 'Ovelha', 'pontuacao': 10},
      ],
    }
  ];

  void _responder(int pontuacao) {
    setState(() {
      _perguntaSelecionada++;
      _pontuacaoTotal += pontuacao;
    });
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _questoes.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Questionário")),
        body: temPerguntaSelecionada
            ? Questionario(
                perguntas: _questoes,
                perguntaSelecionada: _perguntaSelecionada,
                responder: _responder,
              )
            : Resultado(_pontuacaoTotal, _reiniciarQuestionario),
      ),
    );
  }
}

class QuestionarioApp extends StatefulWidget {
  @override
  _QuestionarioAppState createState() {
    return _QuestionarioAppState();
  }
}
