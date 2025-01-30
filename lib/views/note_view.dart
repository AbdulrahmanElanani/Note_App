import 'package:flutter/material.dart';
import 'package:note_app/views/widgets/add_note_bottom_sheet.dart';
import 'package:note_app/views/widgets/note_view_body.dart';

import '../constant/colors.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(kPrimaryColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              50,
            ),
          ),
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                return AddNoteBottomSheet();
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            );
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
        body: NoteViewBody());
  }
}
