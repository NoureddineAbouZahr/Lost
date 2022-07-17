import { BrowserRouter as Router, Route, Routes, Switch } from 'react-router-dom'
import Login from './component/Login';
function App() {
  return (
  <Router>
    <Routes>
      <Route exact path='/' element={<Login />}></Route>
    </Routes>
  </Router>
  );
}

export default App;
