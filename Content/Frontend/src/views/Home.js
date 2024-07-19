import { useEffect, useState } from 'react';
import {  useNavigate } from 'react-router-dom';
import axios from '../services/api';
import {  useDispatch } from 'react-redux'
import {
  CCard,
  CCardBody,
  CCol,
  CRow,
  CContainer,
  CCardImage,
  CCardText, 

} from '@coreui/react'
import Navigation from '../containers/Navigation';

import './Css/home.css'
import { LuLoader2 } from "react-icons/lu";
import { isTokenExpire } from './gradeSubject';

const Home = () => {
  const dispatch = useDispatch();  
  const navigate = useNavigate();
  const [allContents,setAllContents] = useState([]);
  const [inputFilter,setInputFilter] = useState(null);
  const [filteredContents, setFilteredContents] = useState([]);
  const [loader,setLoader] = useState(true);
  const user_info = JSON.parse(localStorage.getItem('user_info'))


  const navigateHandler = (content) =>{
    navigate('home/expandedCard');
    dispatch({type:'set',content:content})
  }
 

  const allContent = async()=>{
    try {
    setLoader(true)
    let res = await axios.get('/contents',{
      headers: {
        authorization: user_info.accessToken,
        token: user_info.refreshToken
      }
    });
    await new Promise(resolve => setTimeout(resolve, 500));
    setAllContents(res.data);
    }catch(error){
    }finally{
      setLoader(false)
    }
  }

  useEffect(()=>{
    allContent();
  },[]);


  useEffect(() => {
    if(!user_info || isTokenExpire(user_info?.accessToken)){
        localStorage.removeItem('user_info')
        navigate('/login');
    }
  }, [user_info,navigate])

const searchHandler = (tobeSearchedValue)=>{
  setInputFilter(tobeSearchedValue)
}


useEffect(()=>{
  const searchTerm = inputFilter?.toLowerCase();
  const filteredContent = searchTerm? allContents.filter(content =>  Object.values(content).some(value => typeof value === 'string' && value.toLowerCase().includes(searchTerm))): allContents;
  setFilteredContents(filteredContent);
},[inputFilter, allContents]);


  
  const data = ()=>{
    return (filteredContents.map((content)=>(
      <CCol lg={3} md={4} sm={6} key={`${content.id}-${content.module_name}`}>
      <CCard className='shadow border-radius'>
        <CCardImage orientation="top" className='separation_line' src={`http://localhost:5000/images/${content.imageUrl}`} onClick={()=>navigateHandler(content)}/>
        <CCardBody>
          <CCardText className='card-container card_space'>
            {content.grade ? 
            <>             
             <h4 className='card-text-1'>{content.subjectName}</h4>     
             <h4 className='card-text-2'>{content.module_name}</h4>
            <h4 className='card-text-2'>{content.topic_name}</h4>
            </>
              : 
            <>
            <h4 className='card-text-1'>{content.module_name}</h4>
            <h4 className='card-text-2'>{content.description}</h4>
            </>
            }

          </CCardText>
        </CCardBody>
      </CCard>
    </CCol>
    )
    ))
  }


  return (
 
    <CContainer className='bg__white' style={{marginTop:'5rem'}} >
    <Navigation onSearch={searchHandler}/>

  
    <CRow>
      {loader && <div className='loader'><LuLoader2/></div>}
      {!loader && filteredContents.length>0  && data() }
      {!filteredContents.length && !loader && <h3 className='no-match'>No Match Found!</h3>}
    </CRow>
  </CContainer>
  )
}


export default Home
