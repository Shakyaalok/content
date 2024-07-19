import { useEffect, useState } from 'react';
import axios from '../services/api'
import {
    CCard,
    CCardBody,
    CCol,
    CRow,
    CContainer,
    CCardImage,
    CCardText
} from '@coreui/react'

import '../views/Css/k12.css'
import { RiGalleryView } from "react-icons/ri";
import { MdViewColumn, MdViewList } from "react-icons/md";
import { grades, gradeSubjects, subjectMatchedGrades, gradesMatchSubject, subjects } from './gradeSubject'
import { LuLoader2 } from "react-icons/lu";
import { Link, useNavigate } from 'react-router-dom';
import { useDispatch } from 'react-redux';
import { MdExpandMore, MdExpandLess } from "react-icons/md";
import { isTokenExpire } from './gradeSubject';
import CommonSubHeaders from '../containers/CommonSubHeaders';



// this is for the k-12 
const K12 = () => {

    const navigate = useNavigate();
    const dispatch = useDispatch();
    const [changeView, setChangeView] = useState(3);
    const [isHovered, setIsHovered] = useState(false);
    const [target, setTarget] = useState(null);
    const [gradeSelectedVal, setGradeSelectedVal] = useState([]);
    const [subjectSelectedVal, setSubjectSelectedVal] = useState([])
    const [k12Content, setK12Content] = useState([]);
    const [initailSubjectOrFilterSubject, setInitailSubjectOrFilterSubject] = useState(subjects);
    const [initialGradesOrFilterGrades, setInitialGradesOrFilterGrades] = useState(grades);
    const [loader, setLoader] = useState(false);
    const [showGrades, setShowGrades] = useState(true);
    const [showSubjects, setShowSubjects] = useState(true);
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

    const checkGradeHandler = (e) => {
        const value = Number(e.target.value);
        const isChecked = e.target.checked;

        setGradeSelectedVal((prevState) => {
            let newState;
            if (isChecked) {
                newState = [...prevState, value];
            } else {
                newState = prevState.filter((val) => val !== value);
            }
            return newState;
        });
    };

    const checkSUbjectHandler = (e) => {
        const value = e.target.value;
        const isChecked = e.target.checked;

        setSubjectSelectedVal((prevSubject) => {
            let newState;
            if (isChecked) {
                newState = [...prevSubject, value];
            } else {
                newState = prevSubject.filter((val) => val !== value);
            }
            return newState;
        })
    }


    const Content = async () => {
        try {
            setLoader(true)
            let res = await axios.get('/k12', {
                headers: {
                    authorization: user_info.accessToken,
                    token: user_info.refreshToken
                }
            });
            await new Promise(resolve => setTimeout(resolve, 500));
            setK12Content(res.data);
        } catch (error) {

        } finally {
            setLoader(false)
        }
    }

    useEffect(() => {
        Content();

    }, [])



    useEffect(() => {
        let subject = gradeSelectedVal.length > 0 ? subjectMatchedGrades(gradeSelectedVal, gradeSubjects) : subjects
        setInitailSubjectOrFilterSubject(subject);
    }, [gradeSelectedVal]);

    useEffect(() => {
        let grade = subjectSelectedVal.length > 0 ? gradesMatchSubject(gradeSubjects, subjectSelectedVal) : grades;
        setInitialGradesOrFilterGrades(grade);
    }, [subjectSelectedVal]);


    //this is to be fixed because when the user either do check responsiveness or the col should be change on the decrease the size and right now it is only one

    const filterData = () => {
        let finalFilter;
        if (!gradeSelectedVal.length && !subjectSelectedVal.length) {
            finalFilter = k12Content;
        } else if (!subjectSelectedVal.length) {
            finalFilter = k12Content.filter(content => gradeSelectedVal.includes(content.grade));
        } else if (!gradeSelectedVal.length) {
            finalFilter = k12Content.filter(content => subjectSelectedVal.includes(content.subjectName))
        } else {
            finalFilter = k12Content.filter(content => gradeSelectedVal.includes(content.grade) && subjectSelectedVal.includes(content.subjectName));
        }
        return finalFilter;
    }

    const navigateHandler = (content) => {
        navigate('/k12/expandedCard');
        dispatch({ type: 'set', content: content })
    }

    const dataInCol = () => {
        return filterData().map((content) => (
            <CCol lg={changeView} md={6} key={content.id} >
                <CCard className='card-img-hover shadow border-radius' onMouseEnter={() => handleMouseEnter(content.id)} onMouseLeave={() => handleMouseLeave(content.id)} onClick={() => navigateHandler(content)} >
                    <div className="image-container" onMouseEnter={() => handleMouseEnter(content.id)} onMouseLeave={handleMouseLeave}  >
                        <CCardImage orientation="top" src={`http://localhost:5000/images/${content.imageUrl}`} className='separation_line' />
                        {target === content.id ? <div className={`black-overlay ${isHovered ? 'expanded' : ''}`}></div> : null}
                    </div>
                    <CCardBody>
                        <CCardText className='card-container card_space' style={{marginBottom:'2rem'}}>
                            <h4 className='card-text-1'>{content.subjectName}</h4>
                            {/* <div className='card-text-2'>{content.module_name}</div> */}
                            <h4 className='card-text-2'>{content.topic_name}</h4>
                        </CCardText>
                    </CCardBody>
                </CCard>

            </CCol>
        ))
    }


    const dataInRow = () => {
        return (
            filterData().map((content) => (
                <CCol lg={12} key={content.id}>
                    <CCard className="mb-3 card-img-hover shadow card-container border-radius" onClick={() => navigateHandler(content)} style={{ maxWidth: '100%' }} onMouseEnter={() => handleMouseEnter(content.id)} onMouseLeave={() => handleMouseLeave(content.id)} >
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
                                        <div className='card-text-1'>{content.subjectName}</div>
                                        {/* <div className='card-text-2'>{content.module_name}</div> */}
                                        <div className='card-text-2'>{content.topic_name}</div>
                                    </CCardText>
                                </CCardBody>
                            </CCol>
                        </CRow>
                    </CCard>
                </CCol>
            ))
        )
    }


    const toggleGradesHandler = () => {
        setShowGrades(!showGrades);
    };

    const toggleSubjectsHandler = () => {
        setShowSubjects(!showSubjects);
    };

    return (
        <CContainer className='padding-top margin-container' >
            <CommonSubHeaders/>

            <CRow className='margin-top'>

                <CCol lg={3} md={12}>
                    <CCard className='pt-4 pb-4 border-radius'>
                        <CCardText>
                            <CCol >
                                <div className='hide_show_container'>
                                    <h2 className='left_card_heading'>Grades</h2>
                                    <div className='hide_show' onClick={toggleGradesHandler}>
                                        {showGrades ? <MdExpandMore className='icons toggle_icon_adjust' /> : <MdExpandLess className='icons toggle_icon_adjust' />}
                                    </div>

                                    <div className='underline' style={{ margin: 0,width:'100%' }}></div>
                                    <div className='double-underline' style={{ margin: 0 }}></div>
                                    <div>
                                        {showGrades && (<div className={`left-card-container content ${showGrades ? 'show' : ''}`}>
                                            {initialGradesOrFilterGrades.map((grade) => (
                                                <div className='checkbox-container' key={grade}>
                                                    <input type="checkbox" style={{ marginRight: '1rem' }} checked={gradeSelectedVal.includes(grade)} value={grade} onChange={(e) => checkGradeHandler(e)} /><span className='left_card_text'>Grade {grade}</span>
                                                </div>
                                            ))}
                                        </div>)}
                                    </div>
                                </div>

                                <div className='hide_show_container'>
                                    <h2 className='gap left_card_heading'>Subjects</h2>
                                    <div className='hide_show' onClick={toggleSubjectsHandler}>
                                        {showSubjects ? <MdExpandMore className='icons toggle_icon_adjust' /> : <MdExpandLess className='icons toggle_icon_adjust' />}
                                    </div>

                                    <div className='underline' style={{ margin: 0,width:'100%' }}></div>
                                    <div className='double-underline' style={{ margin: 0 }}></div>
                                    <div >
                                        {showSubjects && (<div className={`content left-card-container ${showSubjects ? 'show' : ''}`}>
                                            {initailSubjectOrFilterSubject.map((subjects) => (
                                                <div className='checkbox-container' key={subjects}>
                                                    <input type="checkbox" style={{ marginRight: '1rem' }} value={subjects} checked={subjectSelectedVal.includes(subjects)} onChange={(e) => checkSUbjectHandler(e)} /><span className='left_card_text'>{subjects}</span>
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
                            <h2 className='module_course_main_heading'>Modules</h2>
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

export default K12
