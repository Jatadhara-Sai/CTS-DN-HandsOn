import React from 'react';

const ListofPlayers = () => {
  const players = [
    { name: 'Rohit', score: 85 },
    { name: 'Gill', score: 65 },
    { name: 'Kohli', score: 90 },
    { name: 'Rahul', score: 55 },
    { name: 'Iyer', score: 78 },
    { name: 'Hardik', score: 45 },
    { name: 'Jadeja', score: 88 },
    { name: 'Kuldeep', score: 50 },
    { name: 'Bumrah', score: 95 },
    { name: 'Shami', score: 72 },
    { name: 'Siraj', score: 60 },
  ];

  const filteredPlayers = players.filter(player => player.score >= 70);

  return (
    <div>
      <h2>Players with Score ≥ 70</h2>
      <ul>
        {filteredPlayers.map((player, index) => (
          <li key={index}>{player.name} - {player.score}</li>
        ))}
      </ul>
    </div>
  );
};

export default ListofPlayers;
