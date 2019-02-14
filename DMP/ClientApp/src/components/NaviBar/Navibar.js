import React, { Component } from 'react';
import { Link } from 'react-router-dom'
import { Navbar, Nav, NavItem, Button, FormGroup, FormControl, Form } from 'react-bootstrap';
import { LinkContainer } from 'react-router-bootstrap';

export class Navibar extends Component {
  render() {
    return (
      <div>
        <Navbar inverse>
            <Navbar.Header>
              <Navbar.Brand>
                <Link to="/">DMP</Link>
              </Navbar.Brand>
              <Navbar.Toggle/>
            </Navbar.Header>
            <Navbar.Collapse>
              <Nav>
                <NavItem>Player Characters</NavItem>
                <NavItem>Npc's</NavItem>
              </Nav>
              <Nav>
                <NavItem>
                <Button >
                  </Button>
                </NavItem>
              </Nav>
            </Navbar.Collapse>
            
       
          </Navbar>
      </div>
      
      );
  }
}

export default Navibar;