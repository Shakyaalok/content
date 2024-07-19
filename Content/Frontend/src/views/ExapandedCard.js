import React, { useEffect, useRef, useState } from 'react';
import ReactPlayer from 'react-player';
import { useSelector } from 'react-redux'
import { CCard, CCol, CRow, CContainer, CCardBody, CButton, } from '@coreui/react';
import { FaArrowCircleRight, FaPlayCircle, FaPauseCircle } from 'react-icons/fa';
import { TiTick } from 'react-icons/ti';
import { expnadedCardJson, iconsRender, whatuLearnForHigherEd,whatuLearnForK12,isTokenExpire } from './gradeSubject';
import { Link, useLocation, useNavigate } from 'react-router-dom';
import video from '../assets/video/video.mp4';

const ExpandedCard = () => {

  const [isPlaying, setIsPlaying] = useState(false);
  const [showControls, setShowControls] = useState(true);
  const contentCtx = useSelector(state => state.content); 
  const [content,setContent] = useState(contentCtx)   
  const user_info = JSON.parse(localStorage.getItem('user_info'));  
  const navigate = useNavigate();
  const location = useLocation();  
  const playerRef = useRef(null);
 

  useEffect(() => {
    if (contentCtx.length!==0) {
      try {
        localStorage.setItem('rcontent', JSON.stringify(contentCtx));
      } catch (error) {
        console.error('Error storing content in localStorage:', error);
      }
    }
  }, []);


useEffect(() => {
  const persistContent = localStorage.getItem('rcontent');
  if (persistContent) {
    try {
      const parsedContent = JSON.parse(persistContent);
      setContent(parsedContent);
    } catch (error) {
    }
  }
}, []);


  useEffect(() => {
    if(!user_info || isTokenExpire(user_info?.accessToken)){
        localStorage.removeItem('user_info')
        navigate('/login');
    }
  }, [user_info,navigate])


  const handlePlayPause = () => {
    setIsPlaying(!isPlaying);
    setShowControls(true);

    setTimeout(() => {
      setShowControls(false);
    }, 2000);
  };

  const handleMouseEnter = () => {
    setShowControls(true);
  };

  const handleMouseLeave = () => {
    setShowControls(false);
  };


  const watchNowHandler = () => {
    let path = location.pathname
    navigate(`${path}/modal`)
  }


  const renderingWhatUWillLearn = () => {
    const rows = [];
    const whatUlearnFromK12OrHigherEd = content.topic_name ? whatuLearnForK12(content.topic_name) : whatuLearnForHigherEd(content.description)
    const learningPoints =whatUlearnFromK12OrHigherEd
    for (let i = 0; i < learningPoints?.length; i += 2) {
      rows.push(
        <CRow key={i}>
          <CCol lg={6} className="bullets_points">
            <TiTick className="icons font_change_tick_icons" />
            <p>{learningPoints[i]}</p>
          </CCol>
          {learningPoints[i + 1] && (
            <CCol lg={6} className="bullets_points">
              <TiTick className="icons font_change_tick_icons" />
              <p>{learningPoints[i + 1]}</p>
            </CCol>
          )}
        </CRow>
      );
    }
    return rows;
  };

  const moduleIncludes = () => {
    const rows = [];
    const ModuleInclude = expnadedCardJson['thismodulesIncludes'];
    for (let i = 0; i < ModuleInclude.length; i = i + 2) {
      rows.push(
        <CRow>
          <CCol md={6} className="bullets_points" key={i}>
            {iconsRender(ModuleInclude[i].icons)}
            <p>{ModuleInclude[i].text}</p>
          </CCol>
          {ModuleInclude[i + 1] &&
            <CCol md={6} className="bullets_points" key={i+1}>
              {iconsRender(ModuleInclude[i + 1].icons)}
              <p>{ModuleInclude[i + 1].text}</p>
            </CCol>
          }
        </CRow>
      )
    }
    return rows;
  }

  const navigationBreadCrumb = () => {
    const pathnames = location.pathname.split('/').filter((x) => x);
    return (
      <ol className="breadcrumb">
        {pathnames.map((value, index) => {
          const to = `/${pathnames.slice(0, index + 1).join('/')}`;
          const isLast = index === pathnames.length - 1;
          const displayValue = value.charAt(0).toUpperCase() + value.slice(1);

          if (value.toLowerCase() === 'home') {
            return (
              <li key={to} className={`breadcrumb-item ${isLast ? 'active' : ''}`}>
                {isLast ? (
                  displayValue
                ) : (
                  <Link to="/">{displayValue}</Link>
                )}
              </li>
            );
          }

          return (
            <li key={to} className={`breadcrumb-item ${isLast ? 'active' : ''}`}>
              {isLast ? (
                displayValue
              ) : (
                <Link to={to}>{displayValue}</Link>
              )}
            </li>
          );
        })}
      </ol>
    );
  };


  return (

    <CContainer fluid className="expanded_card_main_container margin-top" style={{ minHeight: '500px', overflowY: 'auto', overflowX: 'hidden' }}>
      <CRow className="row_of_teal">
        <CCol md={8} className="text_white">
          <nav aria-label="breadcrumb">
            {navigationBreadCrumb()}
          </nav>
          <h3>{content?.topic_name ? content.topic_name : content.description}</h3>
          <h5>{expnadedCardJson['higlightedTextB']}</h5>
          <p>Detailed Explanation</p>
          <CRow className="nested_row_of_teal">
            {expnadedCardJson['detailedExplanation'].map((item, index) => (
              <CCol md={5} key={item.text}>
                {iconsRender(item.icons)}
                <span className="icons_text">{item.text}</span>
              </CCol>
            ))}
          </CRow>
          <p className="qvolv_link">Created By</p>
          <CRow className="nested_row_of_teal">
            {expnadedCardJson['otherContentInHeader'].map((item, index) => (
              <CCol lg={5} md={12} key={item.text}>
                {iconsRender(item.icons)}
                <span className="icons_text">{item.text}</span>
              </CCol>
            ))}
          </CRow>
        </CCol>


        <CCol md={12} lg={4} className="react_player">
          <CCard className="shadow border-radius">
            <div className="player-container border-radius shadow-sm">
              <div
                className="player-wrapper"
                onMouseEnter={handleMouseEnter}
                onMouseLeave={handleMouseLeave}
              >
                <ReactPlayer
                  ref={playerRef}
                  url={video}
                  width="100%"
                  height="auto"
                  controls={false}
                  playing={isPlaying}
                  onClick={handlePlayPause}
                />
                <div className={`overlay border-radius ${showControls ? '' : 'hidden'}`}>
                  {isPlaying ? (
                    <FaPauseCircle className="pause" onClick={handlePlayPause} />
                  ) : (
                    <FaPlayCircle className="play" onClick={handlePlayPause} />
                  )}
                </div>
              </div>
            </div>

            {content?.topic_name ?
              <CCardBody>   <p className="card-title">
                <FaArrowCircleRight className="icons font_change_hand_icons" />
                <span className="player_text_key">Module</span>
                <span> - {content.subjectName}</span>
              </p>
                <p className="card-text">
                  <FaArrowCircleRight className="icons font_change_hand_icons" />
                  <span className="player_text_key">Chapter</span>
                  <span> - {content.module_name}</span>
                </p>
                <p className="card-title">
                  <FaArrowCircleRight className="icons font_change_hand_icons" />
                  <span className="player_text_key">Topic Name</span>
                  <span> - {content.topic_name}</span>
                </p>
                <p className="card-title">
                  <FaArrowCircleRight className="icons font_change_hand_icons" />
                  <span className="player_text_key">Description</span>
                  <span> - {content.main_description}</span>
                </p>
              </CCardBody>
              :

              <CCardBody className='border-radius'>   <p className="card-title">
                <FaArrowCircleRight className="icons font_change_hand_icons" />
                <span className="player_text_key">Module</span>
                <span> - {content.module_name}</span>
              </p>
                <p className="card-text">
                  <FaArrowCircleRight className="icons font_change_hand_icons" />
                  <span className="player_text_key">Course</span>
                  <span> - {content.description}</span>
                </p>
                <p className="card-title">
                  <FaArrowCircleRight className="icons font_change_hand_icons" />
                  <span className="player_text_key">Description</span>
                  <span> - {content.main_description}</span>
                </p>
              </CCardBody>

            }
            <CButton id='btn' onClick={watchNowHandler}>Watch Now</CButton>
          </CCard>
        </CCol>
      </CRow>

      <CRow>
        <CCol lg={6} className="shadow what_u_learn">
          <h4 className="what_learn_heading">What will you learn</h4>
          {renderingWhatUWillLearn()}
        </CCol>
      </CRow>

      <CRow className="modules_inlcudes_row">
        <CCol className="modules_inlcudes" lg={8}>
          <h4 className="what_learn_heading">This Module includes:</h4>
          {moduleIncludes()}
        </CCol>
      </CRow>
    </CContainer>
  );
};




export default ExpandedCard;
