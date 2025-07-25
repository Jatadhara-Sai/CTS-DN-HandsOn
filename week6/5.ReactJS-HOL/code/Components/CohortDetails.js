import React from 'react';
import styles from './CohortDetails.module.css';

function CohortDetails(props) {
  const { name, trainer, coach, status } = props;

  const headingStyle = {
    color: status === 'ongoing' ? 'green' : 'blue'
  };

  return (
    <div className={styles.box}>
      <h3 style={headingStyle}>{name}</h3>
      <dl>
        <dt>Trainer:</dt>
        <dd>{trainer}</dd>
        <dt>Coach:</dt>
        <dd>{coach}</dd>
        <dt>Status:</dt>
        <dd>{status}</dd>
      </dl>
    </div>
  );
}

export default CohortDetails;
