import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart'; // Сгенерированный файл Firebase

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Notes',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: NotesPage(),
    );
  }
}

class NotesPage extends StatelessWidget {
  final CollectionReference notes =
      FirebaseFirestore.instance.collection('notes');

  void _addOrEditNote(BuildContext context, [DocumentSnapshot? doc]) {
    final TextEditingController controller = TextEditingController(
      text: doc != null ? doc['text'] : '',
    );

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(doc == null ? 'Добавить заметку' : 'Редактировать заметку'),
        content: TextField(
          controller: controller,
          decoration: InputDecoration(hintText: 'Введите текст заметки'),
        ),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context), child: Text('Отмена')),
          TextButton(
            onPressed: () {
              if (doc == null) {
                // Добавляем новую заметку
                notes.add({
                  'text': controller.text,
                  'created_at': DateTime.now(),
                  'updated_at': DateTime.now()
                });
              } else {
                // Обновляем существующую
                notes.doc(doc.id).update({
                  'text': controller.text,
                  'updated_at': DateTime.now()
                });
              }
              Navigator.pop(context);
            },
            child: Text(doc == null ? 'Добавить' : 'Сохранить'),
          ),
        ],
      ),
    );
  }

  void _deleteNote(String id) {
    notes.doc(id).delete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Мои заметки')),
      body: StreamBuilder<QuerySnapshot>(
        stream: notes.snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());

          final docs = snapshot.data!.docs;

          return ListView.builder(
            itemCount: docs.length,
            itemBuilder: (context, index) {
              final doc = docs[index];
              return ListTile(
                title: Text(doc['text']),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _addOrEditNote(context, doc)),
                    IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteNote(doc.id)),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addOrEditNote(context),
      ),
    );
  }
}