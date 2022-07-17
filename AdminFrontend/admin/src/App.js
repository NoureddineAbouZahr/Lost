import { BrowserRouter as Router, Route, Routes, Switch } from 'react-router-dom'
import Login from './component/Login';
import Admin from './component/Admin';
function App() {
  return (
  <Router>
    <Routes>
      <Route exact path='/' element={<Login />}></Route>
      <Route exact path='/admin' element={<Admin />}></Route>
    </Routes>
  </Router>
  );
}

export default App;
