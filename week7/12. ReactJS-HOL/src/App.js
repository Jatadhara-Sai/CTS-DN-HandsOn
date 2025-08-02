import React, { useState } from "react";

function App() {
  const [isLoggedIn, setIsLoggedIn] = useState(false);

  const flightDetails = [
    { flight: "AI-101", destination: "Delhi", time: "10:00 AM" },
    { flight: "AI-202", destination: "Mumbai", time: "12:30 PM" },
    { flight: "AI-303", destination: "Chennai", time: "3:45 PM" }
  ];

  const handleLogin = () => {
    setIsLoggedIn(true);
  };

  const handleLogout = () => {
    setIsLoggedIn(false);
  };

  const GuestPage = () => (
    <div>
      <h2>Welcome Guest!</h2>
      <p>Please login to book your flight.</p>
      <FlightList />
    </div>
  );

  const UserPage = () => (
    <div>
      <h2>Welcome User!</h2>
      <p>You can now book your flight tickets.</p>
      <FlightList />
      <button>Book Selected Flight</button>
    </div>
  );

  const FlightList = () => (
    <div>
      <h3>Available Flights:</h3>
      <ul>
        {flightDetails.map((f, index) => (
          <li key={index}>
            {f.flight} - {f.destination} at {f.time}
          </li>
        ))}
      </ul>
    </div>
  );

  return (
    <div style={{ padding: "20px", fontFamily: "Arial" }}>
      <h1>Flight Ticket Booking App</h1>

      {isLoggedIn ? (
        <>
          <button onClick={handleLogout}>Logout</button>
          <UserPage />
        </>
      ) : (
        <>
          <button onClick={handleLogin}>Login</button>
          <GuestPage />
        </>
      )}
    </div>
  );
}

export default App;
