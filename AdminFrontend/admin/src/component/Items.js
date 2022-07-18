import React from 'react';
import { useState, useEffect } from 'react';
import { Map, Marker } from 'pigeon-maps';
import { useNavigate } from "react-router-dom";
import { Link } from 'react-router-dom';


const Items = () => {
    const navigate = useNavigate();
    const [item, setItem] = useState([]);
    const [center, setCenter] = useState([33.5571, 35.3729]);
    const [zoom, setZoom] = useState(11);
    const [search, setSearch] = useState('');


    return (
        <div className='items'>Items</div>
    )
}

export default Items