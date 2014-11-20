## Cúrriculo API

Este é um projeto rails de uma API Rest para o sistema de cúrriculos. Vai adiante os serviços e as suas estrututras de parâmetros. 

### Entidades

- Cv
```
Cv {
  info_pessoal: InfoPessoal,
  info_usuario: InfoUsuario,
  info_academicas[]: InfoAcademica,
  info_profissionais[]: InfoProfissional,
  cursos[]: Curso,
  qualificacaos[]: Qualificacao
}
```

- Informações de Usuário
```
InfoUsuario {
  email: String,
  senha: String,
  login: String,
  cv_id: Integer
}
```

- Informações Pessoais
```
InfoPessoal {
  cpf: String,
  nome: String,
  nacionalidade: String,
  estadoCivil: enum['solteiro' | 'casado'],
  endereco: String,
  numeroEndereco: String,
  complemento: String,
  bairro: String,
  cidade: String,
  estado: String,
  telefone: String,
  cv_id: Integer  
}
```

- Informações Academicas
```
InfoAcademica {
  nivel: enum['ensino_fundamental', 'ensino_medio', 'ensino_superior_graduacao', 'ensino_superior_pos_graduacao'],
  curso: String,
  incompleto: Boolean,
  instituicao: String,
  inicio: Date,
  fim: Date,
  cv_id: Integer  
}
```

- Informações Profissionais
```
InfoProfissional {
  empresa: String,
  cargo: String,
  inicio: Date,
  fim: Date,
  atividades: Atividade[],
  cv_id: Integer  
}
```

- Atividades
```
Atividade {
  descricao: String,
  info_profissional_id: Integer 
}
```

- Cursos
```
Curso {
  descricao: String,
  instituicao: String,
  inicio: Date,
  fim: Date,
  cv_id: Integer
}
```

- Qualificacoes
```
Qualificacao {
  descricao: String,
  cv_id: Integer 
}
```

### Serviços

Serviço                         | Métodos                 | Parâmetros
--------------------------------|-------------------------|-------------
cvs                             | GET, POST, DELETE       | Cv
cvs/[id]/info_usuarios          | GET, POST, PUT, DELETE  | InfoUsuario
cvs/[id]/info_pessoais          | GET, POST, PUT, DELETE  | InfoPessoal
cvs/[id]/info_academicas        | GET, POST, PUT, DELETE  | InfoAcademica
cvs/[id]/info_profissionais     | GET, POST, PUT, DELETE  | InfoProfissional
cvs/[id]/cursos                 | GET, POST, PUT, DELETE  | Curso
cvs/[id]/qualificacoes          | GET, POST, PUT, DELETE  | Qualificacao
