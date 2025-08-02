import React, { Component } from "react";

class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      counter: 0,
      rupees: '',
      euros: ''
    };
  }

  increment = () => {
    this.setState({ counter: this.state.counter + 1 });
    this.sayHello();
  };

  decrement = () => {
    this.setState({ counter: this.state.counter - 1 });
  };

  sayHello = () => {
    alert("Hello! The value was increased.");
  };

  sayWelcome = (message) => {
    alert(`Welcome Message: ${message}`);
  };

  handlePress = () => {
    alert("I was clicked");
  };

  handleConvert = (event) => {
    event.preventDefault();
    const euro = (parseFloat(this.state.rupees) / 90).toFixed(2);
    this.setState({ euros: euro });
  };

  handleReverseConvert = (event) => {
    event.preventDefault();
    const rupee = (parseFloat(this.state.euros) * 90).toFixed(2);
    this.setState({ rupees: rupee });
  };

  render() {
    return (
      <div style={{ padding: "20px", fontFamily: "Arial" }}>
        <h1>Currency Convertor</h1>

        <h2>Counter: {this.state.counter}</h2>
        <button onClick={this.increment}>Increment</button>
        <button onClick={this.decrement}>Decrement</button>

        <br /><br />
        <button onClick={() => this.sayWelcome("Welcome to the Convertor App")}>
          Say Welcome
        </button>

        <br /><br />
        <button onClick={this.handlePress}>OnPress</button>

        <br /><br /><hr /><br />
        <h2>Convert Rupees to Euro</h2>

        <form>
          <label>Rupees:</label><br />
          <input
            type="number"
            value={this.state.rupees}
            onChange={(e) => this.setState({ rupees: e.target.value })}
          />
          <button onClick={this.handleConvert}>Convert</button>
        </form>

        <p>Euro: {this.state.euros}</p>

        <h2>Convert Euro to Rupees</h2>

        <form>
          <label>Euro:</label><br />
          <input
            type="number"
            value={this.state.euros}
            onChange={(e) => this.setState({ euros: e.target.value })}
          />
          <button onClick={this.handleReverseConvert}>Convert</button>
        </form>

        <p>Rupees: {this.state.rupees}</p>
      </div>
    );
  }
}

export default App;
