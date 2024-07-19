
import { createBrowserRouter } from "react-router-dom";
import Home from './views/Home'
import K12 from './views/K12';
import App from './App'
import HigherEd from "./views/HigherEd";
import UnderMaintaince from "./views/UnderMaintaince";
import ExpandedCard from "./views/ExapandedCard";
import './views/Css/commonStyle.css'
import Modals from "./views/Modals";
import Login from "./views/auth/login/Login";

const router = createBrowserRouter([
  {
    path: '/',
    element: <App />,
    children: [
      {
        path: '',
        element: <Home />
      },
      {
        path: '/login',
        element: <Login />
      },
      {
        path: '/k12',
        element: <K12 />
      },
      {
        path: '/higher-ed',
        element: <HigherEd />
      },
      {
        path: '/enterprises',
        element: <UnderMaintaince />
      },
      {
        path: '/virtual-tour',
        element: <UnderMaintaince />
      },
      {
        path: ':particularComponent/expandedCard',
        element: <ExpandedCard />

      },
      {
        path: ':r1/:r2/modal',
        element: <Modals />
      },{
        path:'*',
        element:<Home/>
      }
    ]
  }
])


export default router