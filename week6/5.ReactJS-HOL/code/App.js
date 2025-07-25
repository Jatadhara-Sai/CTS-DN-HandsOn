import React from 'react';
import CohortDetails from './Components/CohortDetails';

function App() {
  return (
    <div>
      <h1>My Academy Dashboard</h1>
      <CohortDetails
        name="JAVA FSD"
        trainer="Jatadhara Sai"
        coach="seshadrimr"
        status="ongoing"
      />
      <CohortDetails
        name="React Bootcamp"
        trainer="Jatadhara Sai"
        coach="Suruthi"
        status="ongoing"
      />
      <CohortDetails
        name="Spring Boot Training"
        trainer="Jatadhara Sai"
        coach="Poonam"
        status="completed"
      />
    </div>
  );
}

export default App;
