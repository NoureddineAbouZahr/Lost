import React from 'react';
import { useState, useEffect } from 'react';
import { Map, Marker } from 'pigeon-maps';
import { useNavigate } from "react-router-dom";
import { Link } from 'react-router-dom';


const Items = () => {
    const navigate = useNavigate();
    const [items, setItems] = useState([]);
    const [center, setCenter] = useState([33.5571, 35.3729]);
    const [zoom, setZoom] = useState(11);
    const [search, setSearch] = useState('');

    useEffect(() => {
        const getItems = async () => {
            const res = await fetch("http://localhost:3001/api/items/getItems")
            const data = await res.json();
            setItems(data);
            console.log(items)
        };
        getItems();
    }, [])
    return (
        <div>
            <h2 className='ititle'>Lost Items</h2>
            <div className='items'>
                {items.map((item) => {
                    return (
                        <div className='ic' key={item._id}>
                        <details>

                            <summary >                                
                            <p>{item.name}</p>
                            <button className='view'>View Item</button>
                            </summary>
                            <p></p>
                        </details>
                        </div>

                    )
                })}
            </div>
        </div>
    )
}

export default Items