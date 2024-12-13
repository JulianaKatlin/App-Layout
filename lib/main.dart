import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto de Juliana Katlin',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ResponsivePage(),
    );
  }
}

class ResponsivePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Juliana Katlin - Talento Tech-PR'), centerTitle: true),
      body: Column(
        children: [
          _buildHeader(),
          Expanded(child: _buildBody(context)),
        ],
      ),
    );
  }

  // Cabeçalho
  Widget _buildHeader() {
    return Container(
      color: Colors.teal[100],
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Juliana Katlin', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.teal[800])),
          SizedBox(height: 8),
          Text('Curso: Talento Tech-PR', style: TextStyle(fontSize: 20, color: Colors.teal[700])),
        ],
      ),
    );
  }

  // Corpo da página (responsivo)
  Widget _buildBody(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          // Layout para telas pequenas (Android ou telas pequenas)
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildButton(context, Colors.pink, 'Clique Aqui'),
                SizedBox(height: 20),
                _buildButton(context, Colors.orange, 'Toque Aqui'),
              ],
            ),
          );
        } else {
          // Layout para telas maiores (Android ou Web)
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton(context, Colors.blue, 'Clique Aqui'),
              _buildButton(context, Colors.green, 'Toque Aqui'),
              _buildButton(context, Colors.purple, 'Explore Aqui'),
            ],
          );
        }
      },
    );
  }

  // Botões animados
  Widget _buildButton(BuildContext context, Color color, String text) {
    return InkWell(
      onTap: () => _showSnackBar(context, text),
      borderRadius: BorderRadius.circular(12),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [BoxShadow(color: color.withOpacity(0.5), blurRadius: 8, offset: Offset(0, 4))],
        ),
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      ),
    );
  }

  // Exibe a SnackBar
  void _showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text('Você clicou em: $message', style: TextStyle(color: Colors.white)),
      backgroundColor: Colors.teal,
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}