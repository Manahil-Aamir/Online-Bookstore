import React, { useState } from 'react';
import { Link,useLocation,useNavigate } from 'react-router-dom';
import {useCart} from 'react-use-cart';
import AddIcon from '@mui/icons-material/Add';
import RemoveIcon from '@mui/icons-material/Remove';
import DeleteForeverIcon from '@mui/icons-material/DeleteForever';
import NavigationBar from './Navbar';
import './Styles/Cart.css';

function Cart(){
// const location=useLocation();
// const data=location.state;
// const id=data.id;
// const amount=data.quantity;
// const title=data.title;
// const url=data.url;
// const price=data.price;
// const [qty, setQty]=useState(amount);


const [error,setError]=useState('Cannot exceed maximum stock');
const navigate=useNavigate();

const {isEmpty,
    items,
    totalUniqueItems,
    totalItems,
    updateItemQuantity,
    removeItem,
    emptyCart,
} = useCart();


const handleCheckout = () => {
  // Perform any necessary actions before navigating to checkout
  // For example, check if the cart is not empty
console.log("here");
  // Navigate to the Checkout page
  localStorage.setItem("checkout", true);
  if (!isEmpty) {
    navigate('/Checkout', { state: { cartItems: items} });
  } else {
    // Handle the case where the cart is empty
    console.log('Cart is empty. Cannot proceed to checkout.');
  }
};
const handleClick = (itemId, newQuantity) => {
    updateItemQuantity(itemId, newQuantity);
   // setQty(qty - 1); // Assuming you have a quantity state
  };

if(isEmpty) return <h1 > Your cart is empty</h1>

    return (

      <div>
       
        <section className=" cartcontainer" style={{marginTop:'130px'}}>
        <NavigationBar className="nav" />
            <div>
                <div className="cartInfo">
                    <h4>Cart ({totalUniqueItems}) total Items: ({totalItems})</h4>
                    <table className="cartItems">
                       

                      {items.map((item, index) => {
                        //setQty(item.quantity);
                      
                        return(
                  <tr key={index}>

                  <td className="image"><img src={item.url} alt={item.title} style={{ width: '100px', height: 'auto' }} /></td>
                  <div className="titlePrice">
                    <div className="title">
                  <td >{item.title}</td>
                  </div>
                   <div className="price">
                  <td >Price: Rs.{item.price * item.quantity}</td>
                  </div>
                  </div>
                  
                  {/* Add more details as needed */}
                  <div className="updatequantity">
                 <td ><button className="subtract" onClick={() => updateItemQuantity(item.id, item.quantity - 1) }><RemoveIcon/></button></td>
                
                  <td className="quantity"> {item.quantity}</td>
                  <td> <button className="add" onClick={() => {
    // Assuming maxStock is the maximum allowed stock for an item
    const maxStock = item.stock; // Replace with your actual maximum stock value

    // Check if incrementing the quantity would exceed the maximum stock
    if (item.quantity + 1 <= maxStock) {
      // If not, update the quantity
      updateItemQuantity(item.id, item.quantity + 1);
    } else {
      // If exceeding the maximum stock, you can show a message or take appropriate action
      console.log('Cannot exceed maximum stock.');
       

    
    }
  }}><AddIcon/></button></td> </div>


  <div className="removeitemfromcart">
                <td className="del"> <button onClick={()=> removeItem(item.id)}>< DeleteForeverIcon /></button></td>
                </div>
                </tr>

 
                   ) })}

                    </table>
                    
                    <div className="totalout">
          <h4>Total Cost: Rs.{items.reduce((total, item) => total + (item.price * item.quantity), 0)}</h4>
        </div>
        <button className='checkout' onClick={handleCheckout}>
          Proceed to Checkout
        </button>
                </div>
            </div>
            </section>

            </div>
    );
}

export default Cart;
