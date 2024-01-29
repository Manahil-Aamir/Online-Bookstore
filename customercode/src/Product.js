import React, {useState,useEffect} from 'react';
import { Link } from 'react-router-dom';
import { useParams } from 'react-router-dom';
import Axios from "axios";
import CartAmountToggle from './CartAmountToggle';
import AddIcon from '@mui/icons-material/Add';
import RemoveIcon from '@mui/icons-material/Remove';

import AddShoppingCartIcon from '@mui/icons-material/AddShoppingCart';
import {useCart} from 'react-use-cart';
import Navbar from './Navbar';
import './Styles/Product.css';



function Product(){
    const  {productId}  = useParams();
    const [id,setID]=useState(0);
    const [val, setVal] = useState(0);
    const [result,setResult]=useState([]);
    const [amount, setAmount]=useState(1);
    const [stock,setStock]=useState(0);
    const [errorMessage, setErrorMessage] = useState(null);
    const [title,setTitle]=useState('');
    const [url,setURL]=useState('');
    const [review,setReview]=useState([]);
    const [price,setPrice]=useState('');
    const[userRev,setUserRev]=useState('');
    const data={amount,id,title,url,price, val};

    const {addItem, updateItemQuantity} = useCart();

    const handleAddToCart = async () => {
      console.log("u",amount);
     const product={id:id,title:title,price:price,url:url,stock:stock, val:val};
     addItem(product,amount);

//       if (id) {
// // Make sure the cart state is updated before calling updateItemQuantity
//         addItem({
//           id: productId,
//           title,
//           price,
//           quantity: amount,
//           url,
//           stock,
//         });
//         updateItemQuantity(id,amount);


// Now, you can safely call updateItemQuantity
//updateItemQuantity(productId, amount);

     // }
    };


    const setDecrease=()=>{
        amount >0 ? setAmount(amount-1):setAmount(0);
        console.log(amount);
    };

    const setIncrease=()=>{
        amount <stock ? setAmount(amount+1):setAmount(stock);
        console.log(data);
        if (amount==stock){
          setErrorMessage("Cannot add more items. Stock limit reached.");
        }
        
    };
 
 useEffect(() => {
  setID({productId});
    getInformation();
    getReview();
     
  }, []);

const getInformation = () => {
  setVal({productId});
    Axios.get("http://localhost:3008/GetProduct",{ params: { productId } })
      .then((response) => {
    //    setResult(response.data[0][4]);
        setResult(response.data);
        const data = response.data[0];
        setPrice(data[5])
        setTitle(data[1]);
        setStock(data[4]);
        setURL(data[7]);
       console.log("stock",stock);
        console.log('Response:', response); // Log the entire response object
        console.log('Data:', response.data); // Log the data
        console.log("out",result);
      })
      .catch((error) => {
        console.error(error);
      });
  };


  const getReview = () => {
    Axios.get("http://localhost:3008/GetReview",{ params: { productId } })
      .then((response) => {
    //    setResult(response.data[0][4]);
        setReview(response.data);
        const data = response.data[0];
       console.log("stock",stock);
        console.log('Response:', response); // Log the entire response object
        console.log('Data:', response.data); // Log the data
        console.log("out",result);
      })
      .catch((error) => {
        console.error(error);
      });
  };

  const handleClick = () => {
    if (userRev.trim() !== ""){
    console.log("change", userRev);
    console.log("hi2", id);
    Axios.post("http://localhost:3008/addReview", { id: id, userRev: userRev })
      .then(() => {
        setReview((prevReviews) => [
          ...prevReviews,
          { userRev: userRev }, // Assuming your review object has a property userRev
        ]);
      })
      .then(() => {
        console.log("updated",review); // This should log the updated review state
      })
      .catch((error) => {
        console.error('Error adding review:', error);
      });
    }
    else { return(<p>enter valid review!</p>)}
  };
  
  const formatDate = (inputDate) => {
    const date = new Date(inputDate);
    const day = date.getDate().toString().padStart(2, '0');
    const month = date.toLocaleString('default', { month: 'short' }).toUpperCase();
    const year = date.getFullYear();
    return `${day}-${month}-${year}`;
  };
  const displayAll = () => {
  
    console.log("stock", stock);
    return result.map((val, key) => {
        return (
          <div className="displayContainer">
          <div key={key} className="bookInfo">
            <div>
              <img src={val[7]} alt="Image" style={{ width: '100px', height: 'auto' }} />
            </div>
            <div className="title">{val[1]}</div>
            <div className="date">{formatDate(val[3])}</div>
            <div className="description">{val[8]}</div>
          </div>
          <div className="shopping-area">
            <div className="price">Rs {val[5]} /-</div>
            <div className="amount-toggle">
              <button onClick={setDecrease}><RemoveIcon/></button>
              <div className="amount">{amount}</div>
              <button onClick={setIncrease}><AddIcon /></button>
            </div>
            <Link to={`/Cart`} onClick={handleAddToCart}><button className="add"><AddShoppingCartIcon /></button></Link>
          </div>
        </div>
        
        )
      })
      
  };

  const displayReview = () => {
    return review.map((val, key) => {
      let reviewtext = val[0];
      if(val[0]==null){
        reviewtext = val.userRev ? val.userRev : "";
      }
      console.log('userRev:', val.userRev);
      return (
        <div className="displayrev" key={key}>
          <div className="revdisp" >
            <div>Review: {reviewtext}</div>
          </div>
        </div>
      );
    });
  };
 
   
  
const giveReview=()=>{
return(
<div className="giverev">
  <label>SHARE YOUR REVIEW:</label>
  <div>
  <input type='text' onChange={(e)=>{setUserRev(e.target.value)}}></input></div>
  <button onClick={handleClick}>SUBMIT</button></div>
);

};




    return (
 <div className="ProductsContainer">
 <div>
 <Navbar />
 </div>
 <div classname="displayAll">
 {displayAll()} 
 </div>
 <div Classname="review-section">
 {giveReview()}
 {displayReview()}
 
 {errorMessage && <div className="error-message">{errorMessage}</div>}
 </div>  
        </div>
    );
}
export default Product;