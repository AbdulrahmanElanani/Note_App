import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:note_app/cubit/note_cubit.dart';
import 'package:note_app/models/note_model.dart';

import '../edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});
  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EditNoteView(
                note: note,
              ),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Color(note.color),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(0),
                title: Text(
                  note.title,
                  style: TextStyle(fontSize: 28, color: Colors.black),
                ),
                subtitle: Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 16),
                  child: Text(
                    note.subTitle,
                    style: TextStyle(
                        color: Colors.black.withAlpha(140), fontSize: 18),
                  ),
                ),
                trailing: GestureDetector(
                  onTap: () {
                    note.delete();
                    BlocProvider.of<NoteCubit>(context).fetchAllNotes();
                  },
                  child: Icon(
                    FontAwesomeIcons.trash,
                    size: 24,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                note.date,
                style: TextStyle(
                  color: Colors.black.withAlpha(140),
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ));
  }
}
