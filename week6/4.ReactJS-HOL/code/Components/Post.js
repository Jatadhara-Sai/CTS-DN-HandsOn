import React, { Component } from 'react';

class Post extends Component {
  render() {
    return (
      <div className="post-box">
        <h3>{this.props.title}</h3>
        <p>{this.props.body}</p>
        <hr />
      </div>
    );
  }
}

export default Post;
