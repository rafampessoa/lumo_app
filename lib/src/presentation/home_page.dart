import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo ao Lumo!'),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Seção de Boas-vindas e Introdução
              _buildSection(
                title: 'Objetivo',
                content:
                    'Que tal criar uma história para ensinar algo importante ou celebrar um momento especial da sua família?',
                backgroundColor: Colors.lightBlue[50],
                buttonText: 'Entenda o Valor',
                onPressed: () {
                  _showDialog(context, 'O Valor das Histórias',
                      'Histórias personalizadas ajudam na conexão emocional e no aprendizado lúdico. Comece agora e veja a mágica acontecer!');
                },
              ),
              const SizedBox(height: 16),

              // Seção de Introdução à Criação
              _buildSection(
                title: 'Comece Agora!',
                content:
                    'Você pode criar histórias com lições valiosas, como coragem, amor, ou lidar com desafios do dia a dia.',
                backgroundColor: Colors.green[50],
                buttonText: 'Criar Primeira História',
                onPressed: () {
                  Navigator.pushNamed(context, '/createStory');
                },
              ),
              const SizedBox(height: 16),

              // Perguntar o Motivo
              _buildSection(
                title: 'Por que você está aqui?',
                content:
                    'Nos conte o motivo de buscar histórias personalizadas. Isso nos ajudará a entregar melhores sugestões!',
                backgroundColor: Colors.pink[50],
                buttonText: 'Responder',
                onPressed: () {
                  _showDialog(context, 'Motivo', 'Exibir um questionário...');
                },
              ),
              const SizedBox(height: 16),

              // Seção de Benefícios
              _buildSection(
                title: 'Benefícios',
                content:
                    'Acompanhe o crescimento do seu filho, fortaleça os laços familiares e ensine lições importantes de forma divertida!',
                backgroundColor: Colors.yellow[50],
                buttonText: 'Saiba Mais',
                onPressed: () {
                  _showDialog(context, 'Benefícios',
                      'Ensinar de forma lúdica é uma forma eficaz de reforçar valores importantes na infância.');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String content,
    required Color? backgroundColor,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: const TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              foregroundColor: Colors.white,
            ),
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }

  void _showDialog(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
