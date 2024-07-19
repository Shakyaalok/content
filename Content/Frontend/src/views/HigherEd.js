import { useEffect, useState } from 'react';
import axios from '../services/api'
import {
    CCard,
    CCardBody,
    CCol,
    CRow,
    CContainer,
    CCardImage,
    CCardText,
} from '@coreui/react';
import { LuLoader2 } from "react-icons/lu";

import '../views/Css/k12.css'
import { RiGalleryView } from "react-icons/ri";
import { MdViewColumn, MdViewList } from "react-icons/md";
import { courseSelection } from './gradeSubject';
import { useNavigate } from 'react-router-dom'
import { useDispatch } from 'react-redux'
import { MdExpandMore, MdExpandLess } from "react-icons/md";
import { isTokenExpire } from './gradeSubject';
import CommonSubHeaders from '../containers/CommonSubHeaders';



// this is for the k-12 
const HigherEd = () => {

    const navigate = useNavigate();
    const dispatch = useDispatch();

    const [changeView, setChangeView] = useState(3);
    const [isHovered, setIsHovered] = useState(false);
    const [target, setTarget] = useState(null);
    const [higherEd, setHigherEd] = useState([]);
    const [courseSelecteVal, setCourseSelectedVal] = useState([]);
    const [loader, setLoader] = useState(false);
    const [showCourse, setShowCourse] = useState(true);


    const user_info = JSON.parse(localStorage.getItem('user_info'));

    useEffect(() => {
        if(!user_info || isTokenExpire(user_info?.accessToken)){
            localStorage.removeItem('user_info')
            navigate('/login');
        }
      }, [user_info,navigate])




    const changeViewHandler = (numberOfCards) => {
        setChangeView(numberOfCards);
    }

    const handleMouseEnter = (i) => {
        setIsHovered(true);
        setTarget(i)
    }

    const handleMouseLeave = (i) => {
        setIsHovered(false);
        setTarget(null)
    }

    const checkCourseHandler = (e) => {
        const value = e.target.value;
        const isChecked = e.target.checked;
        setCourseSelectedVal((prevCourse) => {
            let newState;
            if (isChecked) {
                newState = [...prevCourse, value];
            } else {
                newState = prevCourse.filter((val) => val !== value);
            }
            return newState;
        })
    }

 


    const filterData = () => {
        return courseSelecteVal.length > 0 ? higherEd.filter(content => courseSelecteVal.includes(content.module_name)) : higherEd
    }


    const content = async () => {
        try {
            setLoader(true)
            let res = await axios.get('/higher-ed', {
                headers: {
                    authorization: user_info.accessToken,
                    token: user_info.refreshToken
                }
            });
            await new Promise((resolve) => setTimeout(resolve, 500))
            setHigherEd(res.data);
        } catch (error) {

        } finally {
            setLoader(false)
        }
    }


    useEffect(() => {
        content()
    }, []);


    const navigateHandler = (content) => {
        navigate('/higher-ed/expandedCard');
        dispatch({ type: 'set', content: content })
    }


    //this is to be fixed because when the user either do check responsiveness or the col should be change on the decrease the size and right now it is only one
    const dataInCol = () => {
        return filterData().map((content) => (
            <CCol lg={changeView} md={6} key={content.id}>
                <CCard className='card-img-hover shadow card-container border-radius' onClick={() => navigateHandler(content)} onMouseEnter={() => handleMouseEnter(content.id)} onMouseLeave={() => handleMouseLeave(content.id)} >
                    <div className="image-container" onMouseEnter={() => handleMouseEnter(content.id)} onMouseLeave={handleMouseLeave}  >
                        <CCardImage orientation="top" src={`http://localhost:5000/images/${content.imageUrl}`} className='separation_line' />
                        {target === content.id ? <div className={`black-overlay ${isHovered ? 'expanded' : ''}`}></div> : null}
                    </div>

                    <CCardBody>
                    <CCardText className='card-container card_space' style={{marginBottom:'2rem'}}>
                            <div className='card-text-1'>{content.module_name}</div>
                            <div className='card-text-2'>{content.description}</div>
                        </CCardText>
                    </CCardBody>
                </CCard>

            </CCol>
        ))
    }

    const dataInRow = () => {
        return (filterData().map((content) => (
            <CCol lg={12} key={content.id}>
                <CCard className="mb-3 card-img-hover shadow card-container border-radius" style={{ maxWidth: '100%' }} onClick={() => navigateHandler(content)} onMouseEnter={() => handleMouseEnter(content.id)} onMouseLeave={() => handleMouseLeave(content.id)} >
                    <CRow className="g-0">
                        <CCol md={4}>
                            <div className="image-container" onMouseEnter={() => handleMouseEnter(content.id)} onMouseLeave={handleMouseLeave}  >
                                <CCardImage src={`http://localhost:5000/images/${content.imageUrl}`} className='separation_line' />
                            </div>
                        </CCol>
                        {target === content.id ? <div className={`black-overlay ${isHovered ? 'expanded' : ''}`}></div> : null}

                        <CCol md={8}>
                            <CCardBody>
                            <CCardText className='card-container card_space' style={{marginBottom:'2rem'}}>
                                    <div className='card-text-1'>{content.module_name}</div>
                                    <div className='card-text-2'>{content.description}</div>
                                </CCardText>
                            </CCardBody>
                        </CCol>
                    </CRow>
                </CCard>
            </CCol>
        )))
    }


    const toggleGradeHandler = () => {
        setShowCourse(!showCourse)
    }


    return (
        <CContainer className='padding-top margin-container' >
            <CommonSubHeaders/>
            <CRow className='margin-top'>

                <CCol lg={3} md={12}>
                    <CCard className='pt-4 pb-4 border-radius' >
                        <CCardText>
                            <CCol>

                                <div className='hide_show_container'>
                                <h2 className='left_card_heading'>Courses</h2>
                                    <div className='hide_show' onClick={toggleGradeHandler}>
                                        {showCourse ? <MdExpandMore className='icons toggle_icon_adjust' /> : <MdExpandLess className='icons toggle_icon_adjust' />}
                                    </div>
                                    <div className='underline' style={{ margin: 0,width:'100%' }}></div>
                                    <div className='double-underline' style={{ margin: 0 }}></div>
                                    <div>
                                        {showCourse && (<div className={`left-card-container content ${showCourse ? 'show' : ''}`}>
                                            {courseSelection.map((course) => (
                                                <div className='checkbox-container' key={course}>
                                                    <input type="checkbox" style={{ marginRight: '1rem' }} value={course}  checked={courseSelecteVal.includes(course)} onChange={(e) => checkCourseHandler(e)} /> <span className='left_card_text'>{course}</span>
                                             </div>
                                            ))}
                                        </div>)}
                                    </div>
                                </div>

                            </CCol>
                        </CCardText>
                    </CCard>
                </CCol>


                <CCol lg={9} md={12} >
                    <CRow className='down'>
                        <CCol className='gird-icon-parent'>
                        <h2 className='module_course_main_heading'>Courses</h2>
                            <div className='underline' style={{ margin: 0, width: '100%' }}></div>
                            <div className='double-underline double-underline-adjust' style={{ margin: 0 }}></div>
                            <div className='view-icons-container'>
                                <div className='view-icons'>
                                    <RiGalleryView onClick={() => changeViewHandler(3)} className={changeView === 3 ? 'clicked-added' : 'grid-view-icon'} style={{ marginRight: '5px' }} />
                                    <MdViewColumn onClick={() => changeViewHandler(4)} className={changeView === 4 ? 'clicked-added' : 'grid-view-icon'} style={{ marginRight: '5px' }} />
                                    <MdViewList onClick={() => changeViewHandler(12)} className={changeView === 12 ? 'clicked-added' : 'grid-view-icon'} style={{ marginRight: '5px' }} />
                                </div>
                            </div>
                        </CCol>
                    </CRow>

                    <CRow className='gap_on_grid_icon_hide'>
                        {changeView !== 12 ? !loader && (dataInCol()) : !loader && (dataInRow())}
                        {loader && <div className='loader'><LuLoader2 /></div>}
                    </CRow>
                </CCol>
            </CRow>

            {/* <div className='help' style={{fontSize:'4rem'}}>
             <IoMdBasketball/>
            </div> */}
        </CContainer>
    )
}

export default HigherEd
