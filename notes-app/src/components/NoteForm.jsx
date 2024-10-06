import React, { useState } from "react";

const NoteForm = ({ addNote }) => {
  const [title, setTitle] = useState("");
  const [content, setContent] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    if (title && content) {
      addNote(title, content);
      setTitle("");
      setContent("");
    }
  };

  return (
    <>
      <form onSubmit={handleSubmit}>
        <div className="mb-3">
          <input
            type="text"
            className="form-control"
            id="titleInput"
            placeholder="Título"
            value={title}
            onChange={(e) => setTitle(e.target.value)}
          />
        </div>
        <div className="mb-3">
          <input
            type="text"
            placeholder="Contenido"
            className="form-control"
            id="contentInput"
            value={content}
            onChange={(e) => setContent(e.target.value)}
        />
        </div>
        <button className="btn btn-primary" type="submit">
          Agregar Nota
        </button>
      </form>
    </>
  );
};

export default NoteForm;
