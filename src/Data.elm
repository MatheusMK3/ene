module Data exposing
    ( Class
    , Course
    , Semester
    , availableCourses
    , courseToString
    , defaultCourse
    , findClassByCode
    , findCourseByCode
    , lastSemesterFromCourse
    , placeholderClass
    , semesterString
    )

import List.Extra exposing (find)
import Utils exposing (semesterList)


type alias Course =
    { code : String
    , name : String
    , availableSemesters : List String
    }


courseToString : Course -> String
courseToString course =
    course.code ++ " - " ++ course.name


defaultCourse : Course
defaultCourse =
    { code = "208"
    , name = "CIÊNCIAS DA COMPUTAÇÃO"
    , availableSemesters = List.drop 1 (semesterList 2009 2019) -- drop inexistent 20192
    }


availableCourses : List Course
availableCourses =
    [ defaultCourse
    ]


type alias Semester =
    ( Int, Int )


semesterString : Semester -> String
semesterString s =
    String.fromInt (Tuple.first s) ++ String.fromInt (Tuple.second s)


lastSemesterFromCourse : Course -> String
lastSemesterFromCourse course =
    Maybe.withDefault "error" (List.head course.availableSemesters)


type alias Class =
    -- SP - Sufficient Presence
    -- IP - Insufficient Presence
    { semester : String
    , center : String
    , centerName : String
    , department : String
    , departmentName : String
    , classCourse : String
    , courseCode : String
    , courseName : String
    , credits : Int
    , grades100 : Int
    , grades95to90 : Int
    , grades85to80 : Int
    , grades75to70 : Int
    , grades65to60 : Int
    , grades55to50 : Int
    , grades45to40 : Int
    , grades35to30 : Int
    , grades25to20 : Int
    , grades15to05 : Int
    , grades0SP : Int
    , grades0IP : Int
    , studentsWithGrades : Int
    , mentionOne : Int
    , approved : Int
    , disapprovedSP : Int
    , disapprovedIP : Int
    }


findCourseByCode : String -> List Course -> Maybe Course
findCourseByCode courseCode list =
    find (\course -> course.code == courseCode) list


findClassByCode : String -> List Class -> Maybe Class
findClassByCode classCourseCode list =
    find (\class -> class.courseCode == classCourseCode) list


placeholderClass : Class
placeholderClass =
    -- Used during loading
    let
        pStr =
            "---"

        pInt =
            0
    in
    { semester = pStr
    , center = pStr
    , centerName = pStr
    , department = pStr
    , departmentName = pStr
    , classCourse = pStr
    , courseCode = pStr
    , courseName = pStr
    , credits = pInt
    , grades100 = pInt
    , grades95to90 = pInt
    , grades85to80 = pInt
    , grades75to70 = pInt
    , grades65to60 = pInt
    , grades55to50 = pInt
    , grades45to40 = pInt
    , grades35to30 = pInt
    , grades25to20 = pInt
    , grades15to05 = pInt
    , grades0SP = pInt
    , grades0IP = pInt
    , studentsWithGrades = pInt
    , mentionOne = pInt
    , approved = pInt
    , disapprovedSP = pInt
    , disapprovedIP = pInt
    }
