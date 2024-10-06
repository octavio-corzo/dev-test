import React, { useState } from 'react';
import NoteForm from './components/NoteForm';
import NoteList from './components/NoteList';

const App = () => {
  const [notes, setNotes] = useState([]);
  
  const addNote = (title, content) => {
    const newNote = {
      id: Date.now(),  
      title,
      content
    };
    setNotes([...notes, newNote]);
  };

  const deleteNote = (id) => {
    const updatedNotes = notes.filter(note => note.id !== id);
    setNotes(updatedNotes);
  };

  return (
    <div className="App">
      <h1 style={{marginTop: 30, marginBottom: 30}}>Notes app</h1>
      <NoteForm addNote={addNote} />
      <NoteList notes={notes} deleteNote={deleteNote} />
    </div>
  );
}

export default App;
