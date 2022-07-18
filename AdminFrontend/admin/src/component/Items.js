import React from 'react';
import { useState, useEffect } from 'react';
import{Map,Marker} from 'pigeon-maps';
import {useNavigate} from "react-router-dom";
import { Link } from 'react-router-dom';


const Items = () => {
const navigate=useNavigate();

  return (
    <div className='items'>Items</div>
  )
}

export default Items