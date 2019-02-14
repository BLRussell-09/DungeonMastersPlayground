import React, { Component } from 'react';
import { BrowserRouter, Route, Switch, Redirect } from 'react-router-dom';
import { Navibar } from './components/NaviBar/Navibar';

class App extends Component{
  displayName = App.name
  render() {
    return (
        <div>
          <BrowserRouter>
          <div>
              <Navibar/>
            </div>
          </BrowserRouter>
        </div>
    );
  }
}

export default App;
