import React from 'react';
import { useState, useEffect } from 'react';
import { Map, Marker } from 'pigeon-maps';
import { useNavigate } from "react-router-dom";
import { Link } from 'react-router-dom';
import logo from './assets/logo.png'

const Items = () => {
    const [items, setItems] = useState([]);
    const [center, setCenter] = useState([33.5571, 35.3729]);
    const [zoom, setZoom] = useState(11);

    useEffect(() => {
        const getItems = async () => {
            const res = await fetch("http://localhost:3001/api/items/getItems")
            const data = await res.json();
            setItems(data);
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
                                    {item.SerialNumber?(<p><b>S.N: </b>{item.SerialNumber}</p>):(<p></p>)}
                                    {item.SerialNumber?(<hr />):(<p></p>)}
                                    {item.model?(<p><b>Model: </b>{item.model}</p>):(<p></p>)}
                                    {item.brand?(<p><b>Brand: </b>{item.brand}</p>):(<p></p>)}
                                    <p><b>Color: </b>{item.color}</p>
                                    
                                    {item.extraInfo?(<hr />): (<p></p>)}
                                    {item.extraInfo?(<p><b>Extra: </b>{item.extraInfo}</p>): (<p></p>)}
                                    
                                    
                                </div>
                                <div>
                                    <img src={`data:image/${item.extension || 'jpg'};base64,${item.pic}`} alt=""  />
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