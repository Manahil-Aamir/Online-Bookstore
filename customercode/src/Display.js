
import React, {useState,useEffect} from 'react';
import { Link } from 'react-router-dom';
import Axios from "axios";
import SearchIcon from '@mui/icons-material/Search';
import './Styles/Display.css';





function Display(props){

    const[items,setItems]=useState([]);
    const[productId, setProductId]=useState(0);
    const[clicked,setClicked]=useState(false);
    const[category,setCategory]=useState("");
    const[search,setSearch]=useState("");
   console.log("pr",props.cat);



    useEffect(() => {
      if (props.cat==""){
        console.log(1);
        getInformation();}
      else   {
        setCategory(props.cat);
      getInformation2();
      console.log(2);;
      }}, [category,props]);

    const getInformation = () => {
      console.log('here1');
        Axios.get("http://localhost:3008/DisplayItems")
          .then((response) => {
           setItems(response.data);
            console.log('Response:', response); // Log the entire response object
            console.log('Data:', response.data); // Log the data
          })
          .catch((error) => {
            console.error(error);
          });
      };

      const getInformation2 = () => {
        console.log('here2');
        Axios.get("http://localhost:3008/DisplayItems",{ params: { category } })
          .then((response) => {
           setItems(response.data);
            console.log('Response:', response); // Log the entire response object
            console.log('Data:', response.data); // Log the data
          })
          .catch((error) => {
            console.error(error);
          });
      };
    
const handleClick=()=>{

}

        return (
        <div className="maincont">
           <input className='searchBar' type='text' placeholder='Search by Title' onChange={(e)=>setSearch(e.target.value)}/>
              <SearchIcon />
        <div className="displayContainer">
        
         {items.filter((val) =>  {
        // Return all data if search is 0
        if (search == '') {
          return val;
        }
        else if (val[0].replace(/\s/g, "").toUpperCase().includes(search.replace(/\s/g, "").toUpperCase()) )
        {
        return val
       }

       // Return an empty array if no match found
       
     })
       .map((val, key) => {
           return (
          <div >
             <div className="book" key={key}>
               <div className="details" >
               <div><Link to={`/Product/${val[6]}`}><img src={val[4]} alt="Image" style={{ width: '100px', height: 'auto' }} /></Link></div>
                 <div className="bookname"> <strong>{val[0]}</strong></div>

                <div ><strong>Rs {val[2]} /-</strong></div>
                <Link to={`/Product/${val[6]}`}><button>View</button></Link>
              
                
    
              
               </div>
             </div>
             </div>
           );
         })}
        </div>
        </div>);
 
    };
    

export default Display;