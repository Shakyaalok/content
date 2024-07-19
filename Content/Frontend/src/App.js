
import {Outlet } from "react-router-dom";
import './assets/scss/style.scss';
import Header from "./containers/Header";
import { Provider } from "react-redux";
import store from './store'

function App(){
  return(
    <Provider store={store}>
    <Header/>
    <Outlet/>
    </Provider>
   
  )
}

export default App;
