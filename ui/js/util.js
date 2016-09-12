

function getSessionTimingString(session_timing)
{
    var ret;
    console.log(session_timing);
    switch(session_timing)
        {
            case 1:
                ret = "Full day(9am - 4pm)";
                break;
            case 2:
                ret = "Half day(7am – 12 pm)";
                break;
            case 3:
                ret = "Evening school(1 pm – 5 pm)";
                break;
        }
    console.log("Session Timing"+ ret);
    return ret;
}

function getCategoryString(category)
{
    var ret;
    switch(category)
        {
            case 1:
                ret = "Government";
                break;
            case 2:
                ret = "Private";
                break;
            case 3:
                ret = "Semi Government";
                break;
        }
    return ret;
}

function getCourseString(course)
{
    var ret;
    switch(course)
        {
            case 1:
                ret = "Pre­Nursery";
                break;
            case 2:
                ret = "Kindergarten";
                break;
            case 3:
                ret = "Primary";
                break;
            case 4:
                ret = "Upper primary";
                break;
            case 5:
                ret = "PUC/12th";
                break;
            case 6:
                ret = "Special school for the handicap";
                break;
        }
    return ret;
}


function getSchoolSizeString(school_size)
{
    var ret;
    switch(school_size)
        {
            case 1:
                ret = " 3000+";
                break;
            case 2:
                ret = "2000+";
                break;
            case 3:
                ret = "1000+";
                break;
            case 4:
                ret = "500+";
                break;
            case 5:
                ret = "500 and below";
                break;
        }
    return ret;
}

function getSchoolBoardString(school_board)
{
    var ret;
    switch(school_board)
        {
            case 1:
                ret = "CBSE";
                break;
            case 2:
                ret = "ICSE";
                break;
            case 3:
                ret = "State Board";
                break;
        }
    return ret;
}

function getMediumOfTeachingString(medium)
{
    var ret;
    switch(medium)
        {
            case 1:
                ret = "English";
                break;
            case 2:
                ret = "Hindi";
                break;
            case 3:
                ret = "Kannada";
                break;
            case 4:
                ret = "Others";
                break;
        }
    return ret;
}



function getAdmissionMethodString(adm_method)
{
    var ret;
    switch(adm_method)
        {
            case 1:
                ret = "Interview";
                break;
            case 2:
                ret = "Written test+ interview";
                break;
            case 3:
                ret = "Percent criteria";
                break;
            case 4:
                ret = "School prerogative";
                break;
        }
    return ret;
}


function getReligousPreferencesString(rel)
{
    var ret;
    switch(rel)
        {
            case 1:
                ret = "Govt Neutral";
                break;
            case 2:
                ret = "Hindu trust";
                break;
            case 3:
                ret = "Muslim trust/ Mosque school";
                break;
            case 4:
                ret = "Sikh Gurdyara school";
                break;
            case 5:
                ret = "Christian Missionary school";
                break;
        }
    return ret;
}