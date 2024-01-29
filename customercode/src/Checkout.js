import Axios from "axios";
import React, { useState } from "react";
import NavigationBar from './Navbar';
import "./Styles/Checkout.css"; // Import the CSS file
import { BrowserRouter as Router, Route, Routes, Link, useNavigate, Navigate, useLocation } from 'react-router-dom';
import {useCart} from 'react-use-cart';

const Checkout = () => {  
  const location = useLocation();
  const { cartItems } = location.state || {};
  const [CheckoutList, setCheckoutList] = useState([]);
  const [id,setID]=useState(0);
  const [quantity, setQuantity]=useState(0);
  const navigate = useNavigate();

  const {
    items,
    emptyCart,
} = useCart();

// Validation functions for each field
const validateFName = (fname) => {
  // Add your validation logic for the First Name
  return fname.trim() !== "" ? "" : "First Name is required";
};

const validateLName = (lname) => {
  // Add your validation logic for the Last Name
  return lname.trim() !== "" ? "" : "Last Name is required";
};

const validateMobile = (mobile) => {
  // Add your validation logic for the Mobile Number
  return /^\d{11}$/.test(mobile) ? "" : "Mobile number must be 11 digits";
};

const validateEmail = (email) => {
  // Add your validation logic for the Email
  // You may use a more comprehensive email validation pattern
  return /\S+@\S+\.\S+/.test(email) ? "" : "Invalid email address";
};

const validateStreetNum = (streetnum) => {
  const parsedStreetNum = parseInt(streetnum, 10);

  // Check if the parsed value is a valid integer and greater than 0
  return Number.isInteger(parsedStreetNum) && parsedStreetNum > 0
    ? ""
    : "Street Number must be a valid positive integer";
};

const validateStreetName = (streetname) => {
  // Add your validation logic for the Street Name
  return streetname.trim() !== "" ? "" : "Street Name is required";
};

const validateZipcode = (zipcode) => {
  // Add your validation logic for the Zip Code
  return /^\d{5}$/.test(zipcode) ? "" : "Zip code must be 5 digits";
};

// Add more validation functions for other fields as needed

// Update handleSubmit function to include field validations
const handleSubmit = async (e) => {
  e.preventDefault(); // Prevent default form submission

  // Validate all fields before proceeding
  if (
    validateFName(fname) === "" &&
    validateLName(lname) === "" &&
    validateMobile(mobile) === "" &&
    validateEmail(email) === "" &&
    validateStreetNum(streetnum) === "" &&
    validateStreetName(streetname) === "" &&
    validateZipcode(zipcode) === ""
  ) {
    try {
      // All validation checks passed, proceed with adding checkout details
      await addCheckoutDetails();
      console.log('add done');
      
      // Update quantities after adding checkout details
      await updatequantities();
      console.log('update done');

      // If the above steps executed successfully, navigate to Thankyou page
      navigate("./Thankyou", {
        state: {
          checkoutDetails: {
            fname,
            lname,
            mobile,
            email,
            streetnum,
            streetname,
            city,  // Assuming you have a variable named city in your state
            zipcode
          },
          cartItems  // Use the existing cartItems or an empty array if undefined
        }
      });
    } catch (error) {
      console.error("Error in handleSubmit:", error);
      setErrorMessage("Cart is empty.");
      // Handle errors, if needed
    }
  } else {
    // Validation failed, show an error message or handle it accordingly
    console.error("Validation failed. Please check all fields.");
    setErrorMessage("Validation failed. Please check all fields.");
  }
};


const updatequantities = async() => {
  console.log('hello');
   for (const item of cartItems) {
    console.log("update id:", item.id);
    
    // Iterate through items in the cart and send update requests
   
      const response = await Axios.post('http://localhost:3008/updatequantity', {
        val: item.val, // Replace with the actual property of your item
        quantity: item.quantity,
        price: item.price,
        total: (item.price*item.quantity),
      }).then((response) =>{
        console.log(response.data);
        emptyCart();
        
      }).catch(error => {
      console.error('Error adding details:', error);
  });
}
//navigate('./Thankyou');
};

  const addCheckoutDetails = async() => {
      let total = 0;
      console.log('hi world');
      for (const item of cartItems) {
        total = total + (item.quantity*item.price);
            }
            console.log(total, "whyyyy");
      const response = await Axios.post('http://localhost:3008/checkoutdetails', {
          fname: fname,
          lname: lname,
          mobile: mobile,
          email: email,
          streetnum: streetnum,
          streetname: streetname,
          city: city,
          zipcode: zipcode,
          total: total,

      }).then((response) =>{
        console.log('hi', response);
          setCheckoutList([
            ...CheckoutList,
            {
              fname: fname,
              lname: lname,
              mobile: mobile,
              email: email,
              streetnum: streetnum,
              streetname: streetname,
              city: city,
              zipcode: zipcode,
            },
          ]);
          console.log('the details', setCheckoutList);
          //navigate('/Thankyou');

        }).catch(error => {
          console.error('Error adding details:', error);
      });
      
      
    };
  const [fname, setFName] = useState("");
  const [lname, setLName] = useState("");
  const [mobile, setMobile] = useState(0);
  const [email, setEmail] = useState("");
  const [city, setCity] = useState("Karachi");
  const [streetnum, setStreetNum] = useState(0);
  const [streetname, setStreetName] = useState("");
  const [zipcode, setZipcode] = useState(0);
  const [errorMessage, setErrorMessage] = useState('');



  // const validateMobile = (value) => {
  //   const isValid = /^\d{11}$/.test(value);
  //   return isValid ? "" : "Mobile number must be 11 digits";
  // };

  // const validateZipcode = (value) => {
  //   const isValid = /^\d{5}$/.test(value);
  //   return isValid ? "" : "Zip code must be 5 digits";
  // };
 const DisplayAll= () =>{
    return (
    
    <div>
      <div style={{ fontFamily: 'Arial, sans-serif', textAlign: 'center', color: '#481e05',  fontWeight: 'bold', margin: '120px' }}>
      <h1>Checkout</h1>
      <div className="checkout-container">
      <div className="form-container">
        <div className="information">
          <h2>Information</h2>
          <form>
            <div className="form-group">
              <label htmlFor="fname">First Name:</label>
              <input
                type="text"
                id="fname"
                value={fname}
                onChange={(e) => setFName(e.target.value)}
                required
              />
            </div>

            <div className="form-group">
              <label htmlFor="lname">Last Name:</label>
              <input
                type="text"
                id="lname"
                value={lname}
                onChange={(e) => setLName(e.target.value)}
                required
              />
            </div>

            <div className="form-group">
  <label htmlFor="mobile">Mobile Number: <span style={{ color: '#ff0000', fontSize: '1em', marginTop: '5px', display: 'block' }}>{validateMobile(mobile)}</span></label>
  
    <input
      type="number"
      id="mobile"
      value={mobile}
      onChange={(e) => setMobile(e.target.value)}
      pattern="\d{11}"
      required
      title="Mobile number must be 11 digits"
      
    />
    
  </div>

            <div className="form-group">
              <label htmlFor="email">Email:</label>
              <input
                type="email"
                id="email"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                required
              />
            </div>

            <div className="form-group">
              <label htmlFor="streetnum">Street Number:</label>
              <input
                type="number"
                id="streetnum"
                value={streetnum}
                onChange={(e) => setStreetNum(e.target.value)}
                required
              />
            </div>

            <div className="form-group">
              <label htmlFor="streetname">Street Name:</label>
              <input
                type="text"
                id="streetname"
                value={streetname}
                onChange={(e) => setStreetName(e.target.value)}
                required
              />
            </div>

            <div className="form-group">
              <label htmlFor="city">City:</label>
              <select
                id="city"
                value={city}
                onChange={(e) => setCity(e.target.value)}
                required
              >
                <option value="Karachi">Karachi</option>
                <option value="Lahore">Lahore</option>
                <option value="Islamabad">Islamabad</option>
              </select>
            </div>

            <div className="form-group">
              <label htmlFor="zipcode">Zip Code:  <span className="error">{validateZipcode(zipcode)}</span></label>
              <input
                type="numbers"
                id="zipcode"
                value={zipcode}
                onChange={(e) => setZipcode(e.target.value)}
                pattern="\d{5}"
                required
                title="Zip code must be 5 digits"
              />
            
            </div>

            <div className="submit-button">
              <button type="submit" onClick={handleSubmit}>Submit</button>
            </div>
          </form>
          {errorMessage && <p style={{ color: '#ff0000', fontSize: '1.2em', marginTop: '10px' , textAlign: 'center'}}>{errorMessage}</p>}
        </div>
      </div>
    </div>
    </div>
    </div>
  );
};

return(
  <div>
  <div>
  <NavigationBar className="nav" />
</div>
{DisplayAll()};
</div>
)
}

export default Checkout;