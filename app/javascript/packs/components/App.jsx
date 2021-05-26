import React, { useState, useEffect } from "react";
import Card from "./card";
import Modal from "./modal";
const App = () => {
  const [desc, setDesc] = useState(
    "Lorem est tempor duis pariatur proident. Sunt cupidatat minim esse consectetur ipsum veniam elit reprehenderit culpa."
  );
  const [name, setName] = useState("Hello World");
  const [open, setOpen] = useState(false);
  const [list, setList] = useState([]);
  useEffect(() => {
    fetch("http://localhost:3000/api/v1/cards", {
      method: "GET"
    })
      .then((response) => response.json())
      .then((response) => {
        console.log(response);
        setList(JSON.parse(response['response']));
      })
      .catch((err) => {
        console.log(err);
      });
  }, []);
  return (
    <>
      {open ? (
        <>
          <Modal onHide={() => setOpen(false)} />
        </>
      ) : (
        ""
      )}
      <div className="w-full h-screen bg-gray-100 flex items-center justify-center">
        <div className="rounded shadow p-4 bg-white" style={{ width: 250 }}>
          {/* <h1 className="font-bold text-gray-900 text-2xl mb-1">TODO 👋</h1> */}
          {/**
           * TODO: Write your React APP here. You can use the "components folder" if you want to
           * split it on multiple files.
           */}
          <div className="text-gray-400">
            <section className="  space-y-4">
              <ul className="grid grid-cols-1  gap-4">
                <li>
                  {list.map((res) => (
                    <Card desc={res.description} name={res.name} />
                  ))}
                </li>
                <li className="hover:shadow-lg flex rounded-lg">
                  <button
                    onClick={() => setOpen(true)}
                    className="hover:border-transparent hover:shadow-xs w-full flex items-center justify-center rounded-lg border-2 border-dashed border-gray-200 text-sm font-medium py-4"
                  >
                    Add Card
                  </button>
                </li>
              </ul>
            </section>
          </div>
        </div>
      </div>
    </>
  );
};
export default App;