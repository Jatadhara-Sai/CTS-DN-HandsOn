import React from 'react';
import CourseDetails from './CourseDetails';
import BookDetails from './BookDetails';
import BlogDetails from './BlogDetails';

function App() {
  return (
    <div style={{ padding: '20px', fontFamily: 'Arial' }}>
      <div style={{
        display: 'flex',
        justifyContent: 'space-between',
        alignItems: 'flex-start',
        gap: '20px'
      }}>
        <div style={{ flex: 1, borderRight: '3px solid green', paddingRight: '20px' }}>
          <CourseDetails />
        </div>

        <div style={{ flex: 1, borderRight: '3px solid green', paddingRight: '20px' }}>
          <BookDetails />
        </div>

        <div style={{ flex: 1, paddingRight: '20px' }}>
          <BlogDetails />
        </div>
      </div>
    </div>
  );
}

export default App;
