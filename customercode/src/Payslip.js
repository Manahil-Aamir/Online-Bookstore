import React from 'react';
import {useCart} from 'react-use-cart';




const Payslip = ({ checkoutDetails, cartItems }) => {
  console.log('Checkout details are:', checkoutDetails);
  console.log('cart item details are:', cartItems);
  const {
    items,
    emptyCart,
  } = useCart();
  console.log(checkoutDetails);
  console.log(cartItems);
  return (
    <div style={{ padding: '10px', border: '1px solid #ccc' }}>
  <h2 style={{ marginBottom: '10px' }}>Payslip</h2>
  <div style={{ marginBottom: '20px' }}>
    <p><strong>Name:</strong> {checkoutDetails.fname} {checkoutDetails.lname}</p>
    <p><strong>Email:</strong> {checkoutDetails.email}</p>
    <p><strong>Phone:</strong> {checkoutDetails.mobile}</p>
    <p><strong>Address:</strong> {checkoutDetails.streetnum} {checkoutDetails.streetname}, {checkoutDetails.city}, {checkoutDetails.zipcode}</p>
  </div>

  <div style={{ display: 'table', width: '100%' }}>
  <div style={{ display: 'table-header-group' }}>
    <div style={{ display: 'table-row', background: '#f0f0f0' }}>
      <div style={{ display: 'table-cell', padding: '8px', fontWeight: 'bold' }}>Image</div>
      <div style={{ display: 'table-cell', padding: '8px', fontWeight: 'bold' }}>Title</div>
      <div style={{ display: 'table-cell', padding: '8px', fontWeight: 'bold' }}>Quantity</div>
      <div style={{ display: 'table-cell', padding: '8px', fontWeight: 'bold' }}>Total Cost</div>
    </div>
  </div>
  <div style={{ display: 'table-row-group' }}>
    {cartItems.map((item, index) => {
      const totalCost = item.quantity * item.price;

      return (
        <div key={index} style={{ display: 'table-row' }}>
          <div style={{ display: 'table-cell', padding: '8px' }}>
            <img
              src={item.url}
              alt={item.title}
              style={{ maxWidth: '70px', marginRight: '10px' }}
            />
          </div>
          <div style={{ display: 'table-cell', padding: '8px' }}>{item.title}</div>
          <div style={{ display: 'table-cell', padding: '8px' }}>{item.quantity}</div>
          <div style={{ display: 'table-cell', padding: '8px' }}>Rs.{totalCost}</div>
        </div>
      );
    })}
  </div>

  {/* Total Cost Row */}
  <div style={{ display: 'table-row', borderTop: '1px solid #ddd', marginTop: '10px' }}>
    <div style={{ display: 'table-cell', padding: '8px', fontWeight: 'bold' }}></div>
    <div style={{ display: 'table-cell', padding: '8px', fontWeight: 'bold' }}></div>
    <div style={{ display: 'table-cell', padding: '8px', fontWeight: 'bold' }}></div>
    <div style={{ display: 'table-cell', padding: '8px', fontWeight: 'bold' }}>
    <span style={{ fontWeight: 'bold' }}>
        TOTAL: Rs.{cartItems.reduce((acc, item) => acc + item.quantity * item.price, 0)}
      </span>
    </div>
  </div>
</div>

</div>

  );
};

export default Payslip;
