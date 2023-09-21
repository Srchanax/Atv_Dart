import 'dart:convert';
class Dependente {
  late String _nome;

  Dependente(String nome) {
    this._nome = nome;
  }

  String toJson() {
    return json.encode({"nome": _nome});
  }

  @override
  String toString() {
    return 'Dependente: $_nome';
  }
}

class Funcionario {
  late String _nome;
  late List<Dependente> _dependentes;

  Funcionario(String nome, List<Dependente> dependentes) {
    this._nome = nome;
    this._dependentes = dependentes;
  }

  String toJson() {
    List<dynamic> dependentes = [];
    _dependentes.forEach((dependente) {
      dependentes.add(jsonDecode(dependente.toJson()));
    });
    return json.encode({"nome": _nome, "dependentes": dependentes});
  }

  @override
  String toString() {
    return 'Funcionario: $_nome\nDependentes: $_dependentes';
  }
}

class EquipeProjeto {
  late String _nomeProjeto;
  late List<Funcionario> _funcionarios;

  EquipeProjeto(String nomeprojeto, List<Funcionario> funcionarios) {
    _nomeProjeto = nomeprojeto;
    _funcionarios = funcionarios;
  }

  String toJson() {
    List<dynamic> funcionarios = [];
    _funcionarios.forEach((funcionario) {
      funcionarios.add(jsonDecode(funcionario.toJson()));
    });
    return json.encode({"projeto": _nomeProjeto, "funcionarios": funcionarios});
  }

  @override
  String toString() {
    return 'Projeto: $_nomeProjeto\nFuncionarios: $_funcionarios';
  }
}

void main() {
  //criação dos dependentes
  var dpt1 = Dependente('João');
  var dpt2 = Dependente('Maria');
  var dpt3 = Dependente('Álvaro');
  var dpt4 = Dependente('Lucia');
  
  //criação dos funcionários
  var fnc1 = Funcionario('Pedro', [dpt1, dpt3]);
  var fnc2 = Funcionario('Marcos', [dpt2, dpt4]);

  //criação da lista de funcionários
  List<Funcionario> listafunc = [fnc1, fnc2];

  //criação da equipe de funcionários
   var eqp = EquipeProjeto('Ecuipe',listafunc);

  //print da Equipe do Projeto no formato JSON
  print(eqp);
}
