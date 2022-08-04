import { BrowserRouter as Router, Route, Routes, Switch } from 'react-router-dom'
import Login from './component/login';
import Admin from './component/Admin';
import Categories from './component/Categories';
import Items from './component/Items';
import Admins from './component/Admins';
function App() {
  
  return (
  <Router>
    <Routes>
      <Route exact path='/' element={<Login />}></Route>
      <Route exact path='/admin' element={<Admin />}></Route>
      <Route exact path='/admins' element={<Admins />}></Route>
      <Route exact path='/items' element={<Items />}></Route>
      <Route exact path='/Categories' element={<Categories />}></Route>
    </Routes>
  </Router>
  );
}

export default App;
