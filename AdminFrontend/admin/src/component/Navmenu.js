import React from 'react';
import jwt from 'jwt-decode';
/*import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import {solid, regular, brands} from '@fortawesome/fontawesome-svg-core/import.macro'*/
const Navmenu = () => {
    const [name,setName]=useState();
    const name=jwt(localStorage.getItem("tokeeeeen"));
  return (
    <div className='sidebar'>
        <h2>nav</h2>
        
        <ol>
            <li><a href='#'><i className=''></i>Admins</a></li>
            <li><a href='#'><i className=''></i>Items</a></li>
            <li><a href='#'><i className=''></i>Categories</a></li>
          
        </ol>
    </div>
  )
}

export default Navmenu