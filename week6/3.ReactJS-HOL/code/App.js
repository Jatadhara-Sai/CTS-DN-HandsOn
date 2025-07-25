import React from 'react';
import CalculateScore from './Components/CalculateScore';

function App() {
  return (
    <div>
      <h1>Student Management Portal</h1>
      <CalculateScore
        name="Katta Jatadhara Sai"
        school="PVP Siddhartha"
        goal="CTS"
        total={475}
      />
    </div>
  );
}

export default App;
