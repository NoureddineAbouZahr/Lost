import { useState } from "react";
import { BrowserRouter as Router, Link } from "react-router-dom";
import axios from "axios";
import logo from './assets/logo.png';
import React from 'react';
import jwt from "jwt-decode";

const Login = () => {

    const [email, setEmail] = useState("");
    const [password, setPassword] = useState("");
    const em = document.getElementById('email');
    const p = document.getElementById('password');

    const onSubmit = (e) => {
        if (!email || !password) {
            e.preventDefault();
            alert("no entered data");
            return
        }
        e.preventDefault();

        let data = {
            email: email,
            password: password
        }
        setEmail('');
        setPassword('');
        em.value = '';
        p.value = '';
        axios({
            method: "post",
            url: "http://localhost:3001/api/users/login",
            data,
        }).then(function (response) {
            localStorage.clear();
            localStorage.setItem('tokeeeeen', response.data);
            var role=jwt(response.data).role;
            
            alert(role);
            window.location = "/admin";
        }).catch(function (error) {
            alert('invalid email or password');
        })

    }

    return (
        <div className="loginBody">
            <div className="logo">
            </div>
            <img src={logo} alt="logo" className="lgo" />
            <form action="" className="lgn-container" onSubmit={onSubmit}>

                <div className="form-inner">

                    <div className='hc'>
                    </div>
                    {/* Error! */}
                    <div className="form-control">
                        <label htmlFor="email">Email: </label>
                        <input type="text" name='email' id='email'
                            placeholder='Email'
                            onChange={e => setEmail(e.target.value)} />
                    </div>
                    <div className="form-control">
                        <label htmlFor="password">Password: </label>
                        <input type="password" name='password' id='password'
                            placeholder='Password'
                            onChange={e => setPassword(e.target.value)} />
                    </div>
                    <input type="submit" value=" Log In" className="btn btn-block" />
                </div>
            </form>
        </div>

    )
}

export default Login