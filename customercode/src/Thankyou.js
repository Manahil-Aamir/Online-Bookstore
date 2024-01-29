import React from "react";
// import thankYouImage from "./Thanks.png";
import "./Styles/Thankyou.css"; // Import the CSS file
import { BrowserRouter as Router, Route, Routes, Link, useNavigate, Navigate, useLocation } from 'react-router-dom';
import Payslip from './Payslip';// Adjust the import path accordingly

const ThankYouPage = () => {
  const location = useLocation();
  const { checkoutDetails, cartItems } = location.state || {};
  console.log('Checkout details are:', checkoutDetails);
  console.log('cart item details are:', cartItems);
  if (!checkoutDetails || !cartItems) {
    // Handle the case where data is missing or not available
    return <p>Invalid data. Please go back and try again.</p>;
  }

  return (
   <div className="thankyou-container" style={{ textAlign: 'center', marginTop: '20px' }}>
  {/* <p className="thankyou-message" style={{ marginBottom: '10px' }}>Thanks for Ordering!  <img className="thankyou-image" src={thankYouImage} alt="Thank You" style={{ maxWidth: '50px', maxHeight:'50px'}} /></p>
   */}


      <Payslip checkoutDetails={checkoutDetails} cartItems={cartItems} />
    </div>
  );
};

export default ThankYouPage;
