import Axios from "axios";
import React, { useState } from "react";
import NavigationBar from './Navbar';

import { BrowserRouter as Router, Route, Routes, Link, useNavigate, Navigate } from 'react-router-dom';
import './Styles/ContactUs.css'; // Import your CSS file

const ContactUs = () => {
  const [firstName, setFirstName] = useState('');
  const [lastName, setLastName] = useState('');
  const [email, setEmail] = useState('');
  const [message, setMessage] = useState('');
  const [submitted, setSubmitted] = useState(false);
  const [ContactList, setContactList] = useState([]);



  const addCheckoutDetails = async() => {
      const response = await Axios.post('http://localhost:3008/contactusdetails', {
          firstName: firstName,
          lastName: lastName,
          email: email,
          message: message,

      }).then((response) =>{
        console.log('hi', response);
          setContactList([
            ...ContactList,
            {
                firstName: firstName,
                lastName: lastName,
                email: email,
                message: message,
            },
          ]);
          console.log('the details', setContactList);
          

        }).catch(error => {
          console.error('Error adding details:', error);
      });
      
      
    };

  const handleSubmit = (e) => {
    e.preventDefault();
    addCheckoutDetails();

    // Perform any necessary actions (e.g., send data to server, etc.)

    // Display the submission message
    setSubmitted(true);
  };

  

  return (
    <div style={{ fontFamily: 'Arial, sans-serif', textAlign: 'center', fontWeight: 'bold' }}>
        <div>
  <NavigationBar className="nav" />
</div>
    <div className="contact-form-container" style={{ marginTop: '150px' }}>
      <h1>Contact Us</h1>
      <h3 style={{ textAlign: 'left' }}>Summary Of Query</h3>
      <form onSubmit={handleSubmit}>
        <div className="form-group">
          <label htmlFor="firstName">First Name:</label>
          <input
            type="text"
            id="firstName"
            name="firstName"
            value={firstName}
            onChange={(e) => setFirstName(e.target.value)}
            style={{ width: '40ch' }}
            maxLength={20}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="lastName" >Last Name:</label>
          <input
            type="text"
            id="lastName"
            name="lastName"
            value={lastName}
            onChange={(e) => setLastName(e.target.value)}
            style={{ width: '40ch' }}
            maxLength={20}
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="email">Email:</label>
          <input
            type="email"
            id="email"
            name="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            style={{ width: '40ch' }}
            maxLength={50} // Adjust the maximum length as needed
            required
          />
        </div>
        <div className="form-group">
          <label htmlFor="message">Message:</label>
          <textarea
            id="message"
            name="message"
            value={message}
            onChange={(e) => setMessage(e.target.value)}
            rows="4"
            style={{ width: '40ch' }}
            required
          ></textarea>
        </div>
        <div className="submit-button">
          <button type="submit">Submit</button>
        </div>
      </form>
    </div>
  </div>
  );
};

export default ContactUs;