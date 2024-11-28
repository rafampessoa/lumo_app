enum StoriesObjectivesEnum {
  fortalecaVinculoFamiliar(
      title: 'Fortaleça o Vínculo Familiar',
      example:
          'Transforme momentos simples em histórias mágicas que aproximam pais e filhos.'),
  ensineLicoesImportantes(
      title: 'Ensine Lições Importantes',
      example:
          'Ajude sua criança a enfrentar o medo do escuro com uma história onde o personagem descobre a coragem escondida dentro dele.'),
  estimuleCriatividade(
      title: 'Estimule a Criatividade',
      example:
          'Inspire a imaginação da sua criança com histórias criadas especialmente para ela.'),
  resolvaDesafiosDoDiaDia(
      title: 'Resolva Desafios do Dia a Dia',
      example:
          'Ajude sua criança a enfrentar o medo do escuro com uma história onde o personagem descobre a coragem escondida dentro dele.'),
  guardeMemoriasInesqueciveis(
      title: 'Guarde Memórias Inesquecíveis',
      example:
          'Transforme momentos simples em histórias mágicas que aproximam pais e filhos.');

  const StoriesObjectivesEnum({required this.title, required this.example});

  final String title;
  final String example;
}
