import React from 'react';
import { Link } from 'react-router-dom';
/*import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import {solid, regular, brands} from '@fortawesome/fontawesome-svg-core/import.macro'*/
const Navmenu = () => {
  
  return (
    <div className='sidebar'>
        <h2>{localStorage.getItem("name")}</h2>
        
        <ol>
            <li><a href='#'><i className=''></i>Admins</a></li>
            <li><a href='#'><i className=''></i>Items</a></li>
            <li><Link to ='/Categories'><i className=''></i>Categories</Link></li>
          
        </ol>
    </div>
  )
}

export default Navmenu