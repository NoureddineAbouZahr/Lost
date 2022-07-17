import { useState } from "react";
import { BrowserRouter as Router, Link } from "react-router-dom";
import axios from "axios";
import React from 'react'

const Login = () => {
    return (
        <form action="">

            <div className="form-inner">
                <div className='hc'><h2>Log In</h2>
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

    )
}

export default Login