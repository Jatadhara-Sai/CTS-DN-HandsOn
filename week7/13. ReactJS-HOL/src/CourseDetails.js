import React from 'react';

function CourseDetails() {
  const courses = [
    { name: "Angular", date: "29/6/2025" },
    { name: "React", date: "30/7/2025" }
  ];

  return (
    <div>
      <h2>Course Details</h2>
      {courses.map((course, index) => (
        <div key={index}>
          <strong>{course.name}</strong><br />
          <p>{course.date}</p>
        </div>
      ))}
    </div>
  );
}

export default CourseDetails;
