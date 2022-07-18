import React, { useState,useEffect } from 'react'
import Navmenu from './Navmenu';
import axios from 'axios'

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

  function onSubmit(e,cid, name) {
    e.preventDefault()
    console.log(cid, name);

    let data={
      name,
      cid
    }
    console.log(data);
    axios({
      method: 'post',
      url: 'http://localhost:3001/api/subs/addSubCategory',
      data
    });
  }

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
                <form action="" onSubmit={e => onSubmit(e, category._id, e.target.querySelector('input[type=text]').value)} >
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