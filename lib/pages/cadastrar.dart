import 'package:flutter/material.dart';


class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  List<String> dadosCadastrados = [];

  void cadastrar() {
    String nome = nomeController.text;
    String email = emailController.text;
    String senha = senhaController.text;

    String dados = 'Nome: $nome, Email: $email, Senha: $senha';

    setState(() {
      dadosCadastrados.add(dados);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nomeController,
              decoration: const InputDecoration(
                labelText: 'Nome',
              ),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextField(
              controller: senhaController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Senha',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                cadastrar();
              },
              child: const Text('Cadastrar'),

              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(20),
                fixedSize: const Size(200, 50),
              ),
            ),
            const SizedBox(height: 20),
            const Text('Dados Cadastrados:'),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: dadosCadastrados.map((data) {
                return Text(data);
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}