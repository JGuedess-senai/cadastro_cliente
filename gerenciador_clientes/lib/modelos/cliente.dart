//importe necessário do Material App
import 'package:flutter/material.dart';

class Cliente {
  final String nome;
  final String email;
  final String senha;

  // Construtor do cliente
  Cliente({required this.nome, required this.email, required this.senha});

  @override
  String toString() {
    return 'Cliente: $nome, Email: $email';
  }
}

class GerenciadorClientes {
  // Variável estática que guarda a única cópia desta classe
  static final GerenciadorClientes _instancia = GerenciadorClientes.interno();
  // impede a criação de novas instância
  GerenciadorClientes._interno();
  // sempre retorna a instância existente
  factory GerenciadorClientes() => _instancia;
  // lista <ul> que armazena todos os clientes cadastrados
  final List<Cliente> _clientes = [];
  // para acessar a lista de clientes (retorna uma cópia imutável)
  List<Cliente> get clientes => List.unmodifiable(_clientes)
  // Tentar cadastrar um cliente novo.
  bool cadastro(Cliente cliente){
    // vamos checar se já existe um email cadastrado
    if(_clientes.any((c) => c.email.toLowerCase() == cliente.email.toLowerCase())){
      print('Erro: email ${cliente.email} já cadastrado');
      return false; // Cadastro falhou
    }
    _clientes.add(cliente); //Adiciona o cliente
    print('Novo cliente cadastrado: ${cliente.nome}');
    return true; //Cadastroooooouuu
  }
  
}
