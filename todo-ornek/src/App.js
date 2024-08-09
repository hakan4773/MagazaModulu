import React, { useState } from 'react'; // Corrected import statement
import Form from './components/form'; // Ensure the casing matches the file name
function App() {
  const [sendValue, setValue] = useState([{
    name:"JavaScript",isCompleted:false},
    {
      name:"Html",isCompleted:false},
      {
        name:"ASP.NET",isCompleted:false}
  ]);

  return (
    <div className="App">
      <Form sendValue={sendValue} setValue={setValue} />
    </div>
  );
}

export default App;
