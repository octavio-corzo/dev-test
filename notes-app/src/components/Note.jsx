import React from "react";

function Note({ note, deleteNote }) {
  return (
    <div className="card" style={{ marginBottom: "10px", marginTop: "10px" }}>
      <div className="card-body">
        <h2>{note.title}</h2>
        <p>{note.content}</p>
        <button
          type="button"
          className="btn btn-danger"
          onClick={() => deleteNote(note.id)}
        >
          Eliminar
        </button>
      </div>
    </div>
  );
}

export default Note;
