import React from 'react';
import jwt from 'jwt-decode';
import { useState } from 'react';
/*import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import {solid, regular, brands} from '@fortawesome/fontawesome-svg-core/import.macro'*/
const Navmenu = () => {
  
  return (
    <div className='sidebar'>
        <h2>{localStorage.getItem("name")}</h2>
        
        <ol>
            <li><a href='#'><i className=''></i>Admins</a></li>
            <li><a href='#'><i className=''></i>Items</a></li>
            <li><a href='#'><i className=''></i>Categories</a></li>
          
        </ol>
    </div>
  )
}

export default Navmenu