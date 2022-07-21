import React from 'react';
import { Link } from 'react-router-dom';
import { useLocation } from 'react-router-dom';
/*import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import {solid, regular, brands} from '@fortawesome/fontawesome-svg-core/import.macro'*/
const Navmenu = () => {
  const path = useLocation().pathname;

  function lout(){
    window.location.href='/';
    delete localStorage['tokeeeeen'];
  }
  if(!localStorage['tokeeeeen']){
    window.location.href='/'
  }

  return (
    <div>
      <input type="checkbox" className='burger' />
      <div className='burgerLines'>
        <div></div>
        <div></div>
        <div></div>
      </div>
      <div className='sidebar'>

        <h2>{localStorage.getItem("name")}</h2>

        <ol>
          <li className={path == '/admin' ? 'open' : ''}><Link to='/admin'><i></i>Items</Link></li>
          <li className={path == '/Categories' ? 'open' : ''}><Link to='/Categories'><i></i>Categories</Link></li>

        </ol>
        {/* <div className="lout"><Link to>Log Out</Link></div> */}
        <button className='lout' onClick={lout}>Log Out</button>

      </div>
      <div>
      </div>


    </div>
  )
}

export default Navmenu