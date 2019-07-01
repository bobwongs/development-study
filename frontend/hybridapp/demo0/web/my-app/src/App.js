import React from 'react';
import logo from './logo.svg';
import './App.css';

class App extends React.Component {

  componentWillMount() {
    window.test0 = this.test0;
  }

  render() {
    return (
      <div className="App">
        <header>Hybrid App Demo</header>
        <div className="button0" onClick={this.notifyToNative}>JS Notify To Native</div>
        <div className="button0">Other Event</div>
  
        <a href="https:www.baidu.com">Baidu</a>
  
        {/* <header className="App-header">
          <img src={logo} className="App-logo" alt="logo" />
          <p>
            Edit <code>src/App.js</code> and save to reload.
          </p>
          <a
            className="App-link"
            href="https://reactjs.org"
            target="_blank"
            rel="noopener noreferrer"
          >
            Learn React
          </a>
        </header> */}
      </div>
    );
  }

  notifyToNative() {
    console.log('notifyToNative');

    window.sendObjcLoginAction("my email from js", "my password from js");

    // window.location = "bws://home/product?name=bob&age=26"
  }

  test0() {
    console.log("I am test0!")
    return "I am test0!"
  }
}

export default App;
