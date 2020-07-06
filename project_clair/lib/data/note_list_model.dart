/*
    Copyright (C) 2020 Sabastian Peters

    the app-state model for the list of notes. think of it like a Vuex or Redux Store
    based on this guide: https://flutter.dev/docs/development/data-and-backend/state-mgmt/simple
*/

import 'package:project_clair/common.dart';

class NoteListModel extends ChangeNotifier {

    
    final List<NoteData> _noteList = [];
    UnmodifiableListView<NoteData> get noteList => UnmodifiableListView(_noteList);

    NoteListModel(){
        add(NoteData("Hi there! This is a note. You can press the trash bin to delete me."));
        add(NoteData("Try adding a note using the button below!"));
    }

    void add(NoteData note){
        _noteList.add(note);
        notifyListeners(); /// tells relevant widgets to rebuild
    }

    void removeAt (int index){
        _noteList.removeAt(index);
        notifyListeners();
    }

    void removeAll (){
        _noteList.clear();
        notifyListeners();
    }

}