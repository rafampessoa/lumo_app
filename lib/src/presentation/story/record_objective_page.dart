import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lumo_flutter/src/theme.dart';

class RecordObjectivePage extends StatefulWidget {
  const RecordObjectivePage({super.key});

  @override
  _RecordObjectivePageState createState() => _RecordObjectivePageState();
}

class _RecordObjectivePageState extends State<RecordObjectivePage> {
  String _transcription = ''; // Variável para armazenar a transcrição do áudio

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grave Sua Explicação"),
        centerTitle: true,
        backgroundColor:
            AppColors.appBarBackgroundLight, // Usando a cor do tema
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0.w), // Padding
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Título e parágrafo convidando o usuário a gravar o áudio
              Text(
                "Conte-nos o motivo pelo qual você escolheu este objetivo.",
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium, // Usando o estilo do tema
              ),
              SizedBox(height: 16.0.h), // Espaço entre o título e o texto

              // Parágrafo convidando o usuário a gravar
              Text(
                "A gravação do seu áudio vai tornar a história ainda mais personalizada! Fale sobre o motivo pelo qual escolheu este objetivo para a história. Este passo é opcional, mas será muito valioso para personalizar a experiência.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[700]), // Usando o estilo do tema
              ),
              SizedBox(height: 24.0.h), // Espaço após o parágrafo

              // Ícone para gravar o áudio
              Center(
                child: GestureDetector(
                  onTap: () {
                    // Iniciar gravação de áudio
                    setState(() {
                      _transcription =
                          'Transcrição do áudio será exibida aqui.'; // Exemplo
                    });
                  },
                  child: Icon(
                    Icons.mic,
                    size: 80.0.sp, // Usando ScreenUtil para o tamanho do ícone
                    color: AppColors.primaryLight, // Usando a cor do tema
                  ),
                ),
              ),
              SizedBox(height: 24.0.h), // Espaço após o ícone de microfone

              // Texto explicativo sobre a gravação
              Text(
                "Toque no microfone para começar a gravar. Sua explicação pode ser curta e simples. Se preferir, você pode editar a transcrição abaixo.",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey[600]), // Usando o estilo do tema
              ),
              SizedBox(height: 16.0.h), // Espaço abaixo do texto de explicação

              // Caixa de texto para transcrição do áudio
              TextField(
                controller: TextEditingController(text: _transcription),
                maxLines: 5,
                decoration: InputDecoration(
                  labelText: 'Transcrição do áudio',
                  hintText: 'Sua explicação aparecerá aqui...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0.r),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _transcription = value; // Atualiza o valor da transcrição
                  });
                },
              ),
              SizedBox(height: 24.0.h), // Espaço após a caixa de texto

              // Botão de continuar, caso o usuário opte por pular a gravação
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Navegar para a próxima página, mesmo sem gravação
                  },
                  child: const Text("Pular e Continuar"),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(200.w, 50.h),
                    backgroundColor:
                        AppColors.primaryLight, // Usando a cor do tema
                    foregroundColor:
                        AppColors.onPrimaryLight, // Usando a cor do tema
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
