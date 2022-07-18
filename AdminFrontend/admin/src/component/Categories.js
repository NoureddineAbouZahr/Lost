import React, { useState,useEffect } from 'react'
import Navmenu from './Navmenu';

const Categories = () => {
  const [cats, setCats] = useState([]);
  
  useEffect(() => {
    const getCats = async () => {
      const res = await fetch("http://localhost:3001/api/categories/getCategories")
      const data = await res.json();
      setCats(data);
    };
    getCats();
  }, [])


  return (
    <div className='cats'>
      <h2 className='cc'>Categories</h2>
      <Navmenu />
      <div className='items'>
        {
          cats?.map((category) => (
            <div className='ic' key={category._id}>
              <details>
                <summary>{category.name}</summary>
                <div className="det">
                <div>
                {category.subid.map(sub => (
                  <p key={sub._id}>{sub.name}</p>

                ))}
                </div>
                <form action="">
                  <label htmlFor="">Sub Category Name</label>
                  <input type="text" />
                  <input type="submit" value="Add" />
                </form>
                </div>
              </details>
            </div>
          ))
        }
      </div>
    </div>
  )
}

export default Categories