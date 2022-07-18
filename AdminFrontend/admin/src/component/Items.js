import React from 'react';
import { useState, useEffect } from 'react';
import { Map, Marker } from 'pigeon-maps';
import { useNavigate } from "react-router-dom";
import { Link } from 'react-router-dom';
import logo from './assets/logo.png'

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
                            <summary><span>{item.name}</span></summary>
                            <div className='data'>
                                <div className='det'>
                                <div>
                                    <p><b>S.N: </b>{item.SerialNumber}</p>
                                    <hr />
                                    <p><b>Model: </b>{item.model}</p>
                                    <p><b>Color: </b>{item.color}</p>
                                    {/* <p><b>Photo: </b>{item.pic}</p> */}
                                    <p><b>Brand: </b>{item.brand}</p>
                                    <hr />
                                    <p><b>Extra: </b>{item.extraInfo}</p>
                                    <p><b>Location:</b></p>
                                </div>
                                <div>
                                    <img src={logo} alt=""  />
                                </div>
                            </div>
                            <details>
                                <summary>Location</summary>
                                <div className='map'>
                                    <Map

                                        center={[item.locationy, item.locationx]}
                                        zoom={zoom}
                                        onBoundsChanged={({ center, zoom }) => {
                                            setCenter(center)
                                            setZoom(zoom)
                                        }}
                                    >
                                        <Marker width={50} anchor={[item.locationy, item.locationx
                                        ]} />
                                    </Map>
                            </div>
                            </details>
                            </div>
                        </details>

                    </div>
                    )
                })}
            </div>
        </div>
    )
}

export default Items